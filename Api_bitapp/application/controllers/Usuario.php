<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';


class usuario extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('usuario_model');
    }

    public function index_get()
    {
        $usuario = $this->usuario_model->get();

        if (!is_null($usuario)) {
            $this->response(array('response' => $usuario), 200);
        } else {
            $this->response(array('error' => 'No hay usuarios en la base de datos...'), 404);
        }
    }

    public function find_get($id)
    {
        if (!$id) {
            $this->response(null, 400);
        }
        $city = $this->usuario_model->get($id);

        if (!is_null($city)) {
            $this->response(array('response' => $city), 200);
        } else {
            $this->response(array('error' => 'Usuario no encontrado...'), 404);
        }
    }

    public function index_post()
    {


        $id = $this->usuario_model->save($_POST['empresa'] ,$_POST['nombre_completo'] ,$_POST['departamento'] ,$_POST['status'] );


    }

    public function index_put()
    {
        if (!$this->put('city')) {
            $this->response(null, 400);
        }

        $update = $this->usuario_model->update($this->put('city'));

        if (!is_null($update)) {
            $this->response(array('response' => 'Usuario actualizado!'), 200);
        } else {
            $this->response(array('error', 'Algo se ha roto en el servidor...'), 400);
        }
    }

    public function index_delete($id)
    {
        if (!$id) {
            $this->response(null, 400);
        }

        $delete = $this->usuario_model->delete($id);

        if (!is_null($delete)) {
            $this->response(array('response' => 'Usuario eliminado!'), 200);
        } else {
            $this->response(array('error', 'Algo se ha roto en el servidor...'), 400);
        }
    }
}