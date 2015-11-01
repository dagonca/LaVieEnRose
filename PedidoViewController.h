//
//  PedidoViewController.h
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 15/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PedidoViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate>{
    NSMutableArray *datosPicker;
    NSMutableArray *datosPicker3;
    UIPickerView * pickerView;
    NSMutableArray *datosPicker4;
    NSMutableArray *datosPicker2;
    UIToolbar *mypickerToolbar;

    
}
@property (weak, nonatomic) IBOutlet UITextField *nombre;
@property (weak, nonatomic) IBOutlet UITextField *Direccion;
@property (weak, nonatomic) IBOutlet UITextField *Mail;
@property (weak, nonatomic) IBOutlet UITextField *telefono;
@property (weak, nonatomic) IBOutlet UITextField *cp;
@property (strong, nonatomic) IBOutlet UIView *viewg;

@property (weak, nonatomic) IBOutlet UITextField *TipoEnvio;
@property (weak, nonatomic) IBOutlet UITextField *TipoPago;

@end
