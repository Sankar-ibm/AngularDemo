import { Component, OnInit } from '@angular/core';
import { IconService } from 'carbon-components-angular';
import { analytics } from "@carbon/icons";
import * as Icons from "@carbon/icons";

@Component({
  selector: 'app-ft-sidenavbar',
  templateUrl: './ft-sidenavbar.component.html',
  styleUrls: ['./ft-sidenavbar.component.scss']
})
export class FtSidenavbarComponent implements OnInit {
  groupedIcons = [];
  hasHamburger: boolean = true;
  active: boolean= false;
  isSideNavExpanded =false;
  constructor(protected iconService: IconService) { }

  ngOnInit() {
    const iconMap = new Map();
		for (const [key, descriptor] of Object.entries(Icons)) {
			this.iconService.register(descriptor as object);
			if (!iconMap.has(descriptor["name"])) {
				iconMap.set(descriptor["name"], []);
			}
			iconMap.get(descriptor["name"]).push(descriptor);
		}
		this.groupedIcons = Array.from(iconMap.values());
	}

  }

