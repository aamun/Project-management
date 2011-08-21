<?php

class appviews extends views {
	
	
    
        protected $messages;

	public function __construct() {
		parent::__construct();

		
                $this->messages = Message::getInstance();
	}

        
}

?>