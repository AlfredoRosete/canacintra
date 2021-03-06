<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';


class Usuario extends REST_Controller
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
            $this->response(array('error' => 'No hay ciudades en la base de datos...'), 404);
        }
    }

    public function find_get($id)
    {
        if (!$id) {
            $this->response(null, 400);
        }
        $usuario = $this->usuario_model->get($id);

        if (!is_null($usuario)) {
            $this->response(array('response' => $usuario), 200);
        } else {
            $this->response(array('error' => 'Ciudad no encontrada...'), 404);
        }
    }

    public function index_post()
    {
        if (!$this->post('usuario')) {
            $this->response(null, 400);
        }

        $id = $this->usuario_model->save($this->post('usuario'));

        if (!is_null($id)) {
            $this->response(array('response' => $id), 200);
        } else {
            $this->response(array('error', 'Algo se ha roto en el servidor...'), 400);
        }
    }

    public function index_put()
    {
        if (!$this->put('usuario')) {
            $this->response(null, 400);
        }

        $update = $this->usuario_model->update($this->put('usuario'));

        if (!is_null($update)) {
            $this->response(array('response' => 'Ciudad actualizada!'), 200);
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
            $this->response(array('response' => 'Ciudad eliminada!'), 200);
        } else {
            $this->response(array('error', 'Algo se ha roto en el servidor...'), 400);
        }
    }
}