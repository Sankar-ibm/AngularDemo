import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FtSidenavbarComponent } from './ft-sidenavbar.component';

describe('FtSidenavbarComponent', () => {
  let component: FtSidenavbarComponent;
  let fixture: ComponentFixture<FtSidenavbarComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FtSidenavbarComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FtSidenavbarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
