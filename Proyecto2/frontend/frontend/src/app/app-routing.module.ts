import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AstComponent } from './components/ast/ast.component';
const routes: Routes = [

  {
    path : '',
    component: DashboardComponent
  },
  {
    path : 'ast',
    component: AstComponent
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }