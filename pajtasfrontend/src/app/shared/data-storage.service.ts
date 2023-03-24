import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class DataStorageService {
  constructor(private http: HttpClient) {}

  login() {}
}

const URL = 'localhost:7294/API';
const API = { 
  LOGIN: '/auth/bej',
  REGISTRATION: "/auth/reg",
  
};
