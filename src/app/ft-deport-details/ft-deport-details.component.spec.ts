import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FtDeportDetailsComponent } from './ft-deport-details.component';

describe('FtDeportDetailsComponent', () => {
  let component: FtDeportDetailsComponent;
  let fixture: ComponentFixture<FtDeportDetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FtDeportDetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FtDeportDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
