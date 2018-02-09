<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');
class Login_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function save ($telefono)
    {
        if ($telefono) {
          
            $query = $this->db->query('select* from usuario where telefono_usuario='.$telefono);

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }

            return null;
        }

        $query = $this->db->select('*')->from('usuario')->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return null;
    }

    
}