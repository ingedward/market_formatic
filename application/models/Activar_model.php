<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
Class: Users_model
Modelo para crear y eliminar Usuarios
*/
class Activar_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
        $this->db = $this->load->database('formatic', TRUE);
    }


  function getPin($id_course, $id_company)
  {
  	$this->db->select('code');
    $this->db->from('pin');
    $array= array('id_course' => $id_course, 'id_company'=> $id_company, 'active'=> 0, 'send_mail'=>0 );
  	$this->db->where($array);
    $this->db->limit(1);
  	$result = $this->db->get();
  	if($result->num_rows() > 0)
    {
      return $result->row();
  	}
  	return FALSE;
  }

  function getIdCourse($course)
  {
    $this->db->like('name_course', $course);
    $result = $this->db->get('course');
    if($result->num_rows() > 0)
    {
      return $result->row();
    }

/*
    $this->db->select('id_course');
    $this->db->from('course');
    $array= array('name_course' => $course );
    $this->db->where($array);
    $result = $this->db->get();
    if($result->num_rows() > 0)
    {
      return $result->row();
    }
*/
  }

  function updatePin($code, $id_company, $id_course)
  {
    $this->db->set('send_mail',1);
    $array = array(
      'code'        =>  $code,
      'id_company'  =>  $id_company,
      'id_course'   =>  $id_course
    );
    $this->db->where($array);
    return $this->db->update('pin');
  }

  function getCompany($id_course, $code)
  {
    $this->db->select('id_company');
    $this->db->from('pin');
    //$this->db->join('pin','company.id_company = pin.id_company');
    $array= array('id_course' => $id_course, 'code'=> $code, 'active'=> 0, 'send_mail'=>1 );
    $this->db->where($array);
    $this->db->limit(1);
    $result = $this->db->get();
    if($result->num_rows() > 0){
      return $result->result();
    }
    return FALSE;
  }
  function isActivePin($code)
  {
    $this->db->select('active');
    $this->db->from('pin');
    //$this->db->join('pin','company.id_company = pin.id_company');
    $array= array('code' => $code,'active'=>0);
    $this->db->where($array);
    $this->db->limit(1);
    $result = $this->db->get();
    if($result->num_rows() > 0){
      return FALSE;
    }
    return TRUE;
  }
  
  function activeSendMail($codes=array())
  {
    foreach ($codes as $code) {
      $this->db->set('send_mail', 1);
      $this->db->where('code', $code);
      $this->db->update('pin'); 
    }
  }
}