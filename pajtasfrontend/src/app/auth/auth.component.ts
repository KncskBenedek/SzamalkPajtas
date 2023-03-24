import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.css'],
})
export class AuthComponent {
  form: FormGroup = new FormGroup('');
  isLoggingIn: boolean = false;
  constructor() {
    this.initForm()
  }
  onSubmit() {
    if(this.isLoggingIn){

    }else{
      
    }
    
    
  }

  initForm(){
    this.form = new FormGroup({
      user: new FormControl(''),
      password: new FormControl(''),
      email: new FormControl(''),
    });
  }
  
  onChangeMode(){
    this.isLoggingIn =  !this.isLoggingIn;
    this.initForm();

  }
}
