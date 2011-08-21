<?php

abstract class appcontroller extends controller {
	
	// Shopping car
	//protected $shoppingCar;
        protected $messages;
	
	public function __construct() {
		parent::__construct();
		
		//$this->shoppingCar = new shoppingCar();
        $this->messages = Message::getInstance();
	}
	
	public function beforeRender(){
	//	$this->debug->log('Pase por '.get_class($this).'<br>','Route',true);
	}
	
	public function setLastUrl($url){
		$_SESSION["lastUrl"] = $url;
	}
	
	public function getLastUrl(){
		return isset($_SESSION["lastUrl"])?$_SESSION["lastUrl"]:"index/";	
	}

        public function checkProfile($idProfile){
            if(isset($this->session['user']) == false){

                // FIXME: Mensaje del motivo de redireccion
                $this->messages->addMessage(Message::WARNING, "Lo sentimos, no tienes permisos para acceder a esa sección.");
                $this->redirect("login/");
            }elseif($this->session['user']['idProfile'] != $idProfile){
                
                // FIXME: Mensaje del motivo de redireccion
                $this->messages->addMessage(Message::WARNING, "Lo sentimos, no tienes permisos para acceder a esa sección.");
                $this->redirect("index/");
            }
        }
}

?>