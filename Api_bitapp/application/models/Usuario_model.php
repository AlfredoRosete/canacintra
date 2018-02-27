<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');
class Usuario_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function get($id = null)
    {
        if (!is_null($id)) {
            $query = $this->db->select('*')->from('usuarios')->where('id_usuario', $id)->get();
            if ($query->num_rows() === 1) {
                return $query->row_array();
            }

            return null;
        }

        $query = $this->db->select('*')->from('usuarios')->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return null;
    }

    public function save($empresa,$nombre_completo,$departamento,$status)
    {
            $query = $this->db->query("INSERT INTO usuarios (nombre_completo, empresa, departamento, status)
VALUES ( '".$nombre_completo."' ,'".$empresa."', '".$departamento."', '".$status."')");


         if (!is_null($query)) {
            $this->response(array('response' => $query), 200);
        } else {
            $this->response(array('error' => 'El usuario no se encuentra registrado...'));
    }

    }

    public function update($city)
    {
        $id = $city['id_usuario'];

        $this->db->set($this->_setCity($city))->where('id_usuario', $id)->update('usuarios');

        if ($this->db->affected_rows() === 1) {
            return true;
        }

        return null;
    }

    public function delete($id)
    {
        $this->db->where('id_usuario', $id)->delete('usuarios');

        if ($this->db->affected_rows() === 1) {
            return true;
        }

        return null;
    }

    private function _setCity($city)
    {
        return array(
            'name' => $city['name']
        );
    }
}