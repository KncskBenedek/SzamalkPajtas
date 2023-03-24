import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthComponent } from './auth/auth.component';
import { HomeComponent } from './home/home.component';
import { KerdesComponent } from './kerdes/kerdes.component';
import { KeresettComponent } from './keresett/keresett.component';
import { SajatComponent } from './sajat/sajat.component';
import { TalalatComponent } from './talalat/talalat.component';

const routes: Routes = [
  {path: 'home', component: HomeComponent},
  {path: 'auth', component: AuthComponent},
  {path: 'kerdes', component: KerdesComponent},
  {path: 'sajat', component: SajatComponent},
  {path: 'keresett', component: KeresettComponent},
  {path: 'talalat', component: TalalatComponent},



];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
