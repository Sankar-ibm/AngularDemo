import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ButtonModule, DialogModule, IconModule, InputModule, ModalModule, PlaceholderModule, TagModule, UIShellModule } from 'carbon-components-angular';
import { CarbonModule, FadeModule, InformationFilledModule } from '@carbon/icons-angular';
import { FtSidenavbarComponent } from './ft-sidenavbar/ft-sidenavbar.component';
import { FtHeaderComponent } from './ft-header/ft-header.component';
import { FtDeportDetailsComponent } from './ft-deport-details/ft-deport-details.component';

@NgModule({
  declarations: [
    AppComponent,
    FtSidenavbarComponent,
    FtHeaderComponent,
    FtDeportDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    UIShellModule,
    IconModule,
    CarbonModule,
    FadeModule,
    DialogModule,
    PlaceholderModule,
    TagModule,
    ModalModule,
    InputModule,
    ButtonModule,
    InformationFilledModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
