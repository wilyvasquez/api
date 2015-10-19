<?php if ( ! defined('BASEPATH')) exit('no se permite acceso directo al scrip');

class Metodos extends CI_Controller
{
	function __construct()
	{	
		parent::__construct();
		$this->load->helper('form');
		$this->load->model('metodosmodelo');
	}

    function index(){
        $data['segmento'] = $this->uri->segment(3);
        if(!$data['segmento']){
            $data['cursos'] = $this->metodosmodelo->obtenerCursos();     
        }
        else{
            $data['cursos'] = $this->metodosmodelo->obtenerCurso($data['segmento']);
        }
        header('Content-Type: application/json');
        echo json_encode($data['cursos']);
    }

	function recibirDatos(){
        $data = array(
            'nombre' => $this ->input->post('nombre') ,
            'obs' => $this ->input->post('obs') 
        );
        $exito = $this->metodosmodelo->crearCurso($data);
        header('Content-Type: application/json');
        if($exito){             
            echo json_encode(array('mensaje'=> "Insertado",'id'=>$exito));
        }else{
            echo json_encode(array('mensaje'=> "error"));
        } 
    }

    function actualizar(){
        $data =array(
            'nombre'=> $this->input->post('nombre'),
            'obs' => $this->input->post('obs')
            );
        $exito = $this->metodosmodelo->actualizarCurso($this->uri->segment(3),$data);
        header('Content-Type: application/json');
        if(!$exito){             
            echo json_encode(array('mensaje'=> "Actualizado"));
        }else{
            echo json_encode(array('mensaje'=> "error"));
        } 
    }

    function borrar(){
        $id = $this->input->post('id');
        if(!$id){
             header('Content-Type: application/json');
             echo json_encode(array('mensaje'=> "error"));
            return true;
        }
        $data = array(
            'id' => $this ->input->post('id') ,
        );
        $exito = $this->metodosmodelo->eliminarCurso($data);
        header('Content-Type: application/json');
        if(!$exito){             
            echo json_encode(array('mensaje'=> "Borrado"));
        }else{
            echo json_encode(array('mensaje'=> "error"));
        } 
    }
}
?>