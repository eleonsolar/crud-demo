<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Estudiante extends CI_Controller{

  public function __construct()
  {
      parent::__construct();
      $this->load->model('Estudiante_model');
      $this->load->model('Carrera_model');
  }

  public function index()
  {
      $this->load->helper('url');
      $data['list'] = $this->Carrera_model->get_rows();
      $this->load->view('estudiante/index', $data);
  }

  public function ajax_list()
  {
      $list = $this->Estudiante_model->get_datatables();
      $data = array();
      $no = $_POST['start'];
      foreach ($list as $estudiante) {
          $no++;
          $row = array();
          $row[] = '<input type="checkbox" class="data-check" value="'.$estudiante->estu_id.'" onclick="showBottomDelete()"/>';
          $row[] = $estudiante->estu_nombre;
          $row[] = $estudiante->estu_apellido;
          $row[] = $estudiante->estu_cedula;
          $row[] = $estudiante->carr_nombre;
          //add html for action
          $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void()" title="Edit" onclick="editEstudiante('."'".$estudiante->estu_id."'".')"><i class="glyphicon glyphicon-pencil"></i> Edit</a>
                <a class="btn btn-sm btn-danger" href="javascript:void()" title="Hapus" onclick="deleteEstudiante('."'".$estudiante->estu_id."'".')"><i class="glyphicon glyphicon-trash"></i> Delete</a>';
          $data[] = $row;
      }
      $output = array(
                      "draw" => $_POST['draw'],
                      "recordsTotal" => $this->Estudiante_model->count_all(),
                      "recordsFiltered" => $this->Estudiante_model->count_filtered(),
                      "data" => $data,
              );
      //output to json format
      echo json_encode($output);
  }

  public function ajax_edit($id)
  {
      $data = $this->Estudiante_model->get_by_id($id);
      echo json_encode($data);
  }

  public function ajax_add()
  {
      $this->_validate();
      $data = array(
              'estu_nombre' => $this->input->post('estu_nombre'),
              'estu_apellido' => $this->input->post('estu_apellido'),
              'estu_cedula' => $this->input->post('estu_cedula'),
              'carr_id' => $this->input->post('carr_nombre')
          );
      $insert = $this->Estudiante_model->save($data);
      echo json_encode(array("status" => TRUE));
  }

  public function ajax_update()
  {
      $this->_validate();
      $data = array(
              'estu_nombre' => $this->input->post('estu_nombre'),
              'estu_apellido' => $this->input->post('estu_apellido'),
              'estu_cedula' => $this->input->post('estu_cedula'),
              'carr_id' => $this->input->post('carr_nombre')
          );
      $this->Estudiante_model->update(array('estu_id' => $this->input->post('estu_id')), $data);
      echo json_encode(array("status" => TRUE));
  }

  public function ajax_delete($id)
  {
      $this->Estudiante_model->delete_by_id($id);
      echo json_encode(array("status" => TRUE));
  }

  public function ajax_list_delete()
   {
       $list_id = $this->input->post('id');
       foreach ($list_id as $id) {
           $this->Estudiante_model->delete_by_id($id);
       }
       echo json_encode(array("status" => TRUE));
   }

  private function _validate()
  {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;

      if($this->input->post('estu_nombre') == '')
      {
          $data['inputerror'][] = 'estu_nombre';
          $data['error_string'][] = 'First name is required';
          $data['status'] = FALSE;
      }else{

        if(!$this->_validate_string($this->input->post('estu_nombre')))
        {
          $data['inputerror'][] = 'estu_nombre';
          $data['error_string'][] = 'Invalid value';
          $data['status'] = FALSE;
        }

      }

      if($this->input->post('estu_apellido') == '')
      {
          $data['inputerror'][] = 'estu_apellido';
          $data['error_string'][] = 'First lastname is required';
          $data['status'] = FALSE;
      }else{

        if(!$this->_validate_string($this->input->post('estu_apellido')))
        {
          $data['inputerror'][] = 'estu_apellido';
          $data['error_string'][] = 'Invalid value';
          $data['status'] = FALSE;
        }

      }

      if($this->input->post('estu_cedula') == '')
      {
          $data['inputerror'][] = 'estu_cedula';
          $data['error_string'][] = 'DNI is required';
          $data['status'] = FALSE;
      }else{

        if(!$this->_validate_number($this->input->post('estu_cedula')))
        {
          $data['inputerror'][] = 'estu_cedula';
          $data['error_string'][] = 'Invalid value';
          $data['status'] = FALSE;
        }
      }

      if($this->input->post('carr_nombre') == '')
      {
          $data['inputerror'][] = 'carr_nombre';
          $data['error_string'][] = 'You should select a course ';
          $data['status'] = FALSE;
      }

      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
  }

  private function _validate_string($string)
  {
      $allowed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for ($i=0; $i<strlen($string); $i++)
      {
          if (strpos($allowed, substr($string,$i,1))===FALSE)
          {
              return FALSE;
          }
      }

     return TRUE;
  }

  private function _validate_number($string)
  {
      $allowed = "0123456789";
      for ($i=0; $i<strlen($string); $i++)
      {
          if (strpos($allowed, substr($string,$i,1))===FALSE)
          {
              return FALSE;
          }
      }

     return TRUE;
  }
}
