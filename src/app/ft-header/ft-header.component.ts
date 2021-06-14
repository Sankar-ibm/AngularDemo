import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-ft-header',
  templateUrl: './ft-header.component.html',
  styleUrls: ['./ft-header.component.scss']
})
export class FtHeaderComponent implements OnInit {
  placement="bottom";
	triggerText="Margindeckung";
  Textsaldo="Saldo aktuell";
  triggerText2="Verpflichtungen";
  triggertext3="Verfügungsrahmen";
  modalText="detailsss"
  constructor() { }

  ngOnInit() {
  }

}
