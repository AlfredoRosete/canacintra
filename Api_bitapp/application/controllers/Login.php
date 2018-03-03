<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');
require_once APPPATH . '/libraries/REST_Controller.php';


class Login extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
    }

    public function index_post()
    {
             $login = $this->login_model->save( $_POST['telefono'] );
         if (!is_null($login)) {
            $this->response(array('response' => $login), 200);
        } else {
            $this->response(array('error' => 'El usuario no se encuentra registrado.'));
    }

    
}
}