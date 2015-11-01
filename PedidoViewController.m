//
//  PedidoViewController.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 15/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "PedidoViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface PedidoViewController (){
    NSString *pedidoTotal;
   int CAMPO;
    NSMutableArray *arrayLista;
    NSString *campoEnvio;
    NSString *campoPago;
}



@end

@implementation PedidoViewController
@synthesize nombre,Direccion,Mail,cp,telefono,viewg,TipoEnvio,TipoPago;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    datosPicker = [[NSMutableArray alloc] init];
    [datosPicker addObject:@"Envio a Domicilio"];
    [datosPicker addObject:@"Entrega en mano (Madrid)"];
   
    
    datosPicker2 = [[NSMutableArray alloc] init];
    [datosPicker2 addObject:@"Contrarembolso"];
    [datosPicker2 addObject:@"Ingreso en cuenta"];
    [datosPicker2 addObject:@"Entrega en mano (solo Madrid)"];
 
   
   


       datosPicker3 = [[NSMutableArray alloc] init];
    
    campoEnvio= TipoEnvio.text;
    campoPago=TipoPago.text;
    
    // Do any additional setup after loading the view.
}
-(void)pickerDoneClicked

{
    NSLog(@"Done Clicked");
    
 //   [TipoPago resignFirstResponder];
    [TipoEnvio resignFirstResponder];
    
}

- (IBAction)atras:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewg.frame = CGRectMake(viewg.frame.origin.x, (viewg.frame.origin.y - 115.0), viewg.frame.size.width, viewg.frame.size.height);
    [UIView commitAnimations];
    
    
    CGRect pickerFrame = CGRectMake(0, 25, 0, 0);
    pickerView = [[UIPickerView alloc]initWithFrame:pickerFrame];
    
    if (textField == TipoEnvio) {
        
        datosPicker3 = [datosPicker mutableCopy];
        TipoEnvio.text = [datosPicker objectAtIndex:0];
        TipoEnvio.inputView = pickerView;
        
        pickerView.delegate = self;
        CAMPO=1;
        
    }else if (textField == TipoPago){
      
        
        datosPicker3 = [datosPicker2 mutableCopy];
        TipoPago.text = [datosPicker2 objectAtIndex:0];
        TipoPago.inputView = pickerView;
        
        pickerView.delegate = self;
        CAMPO=0;

        
}


    

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewg.frame = CGRectMake(viewg.frame.origin.x, (viewg.frame.origin.y + 115.0), viewg.frame.size.width, viewg.frame.size.height);
    [UIView commitAnimations];
    

}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
     [TipoPago resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([nombre isFirstResponder] && [touch view] != nombre) {
        [nombre resignFirstResponder];
    }
    if ([Direccion isFirstResponder] && [touch view] != Direccion) {
        [Direccion resignFirstResponder];
    }
    
    if ([Mail isFirstResponder] && [touch view] != Mail) {
        [Mail resignFirstResponder];
    }
    if ([telefono isFirstResponder] && [touch view] != telefono) {
        [telefono resignFirstResponder];
    }
    if ([cp isFirstResponder] && [touch view] != cp) {
        [cp resignFirstResponder];
    }
    
    
    [super touchesBegan:touches withEvent:event];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView2{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [datosPicker3 count];
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [datosPicker3 objectAtIndex:row];
    
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (CAMPO == 1) {
        TipoEnvio.text= [datosPicker3 objectAtIndex:row];
        campoEnvio= TipoEnvio.text;
        
        [[self view] endEditing:YES];
        
    }else{
        TipoPago.text= [datosPicker3 objectAtIndex:row];
        campoPago=TipoPago.text;
        
        [[self view] endEditing:YES];
    }
}





- (IBAction)RealizarPedido:(id)sender {
    //CREAR PEDIDO
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Condiciones del pedido:"
                                                   message: @"-Entrega enmano: estableceremos un contacto para concretar la fecha. \n- Contrarrembolso: el envio se efectuara entre 24-48h (en dias habieles). \n- Ingreso bancario: el ingreso deberá realizarse en un máximo de 48hh(en dias hábiles) o el pedido será cancelado- \nPosteriormente el pago será confirmado y se prodecerá al envio.\n\n Nºde Cuenta (La Caixa):\n ES84-2100-7943-400100089627 \n\n *El proceso del pedido esta sujeto a condiciones de stock. Cualquier imprevisto sera comunicado.\n\n ¿Desea Continuar?"
                                                  delegate: self
                                         cancelButtonTitle:@"Si"
                                         otherButtonTitles:@"No",nil];
    
    
    [alert show];

 
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Clicked button index 0");
        
        
        
        
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        arrayLista = [[NSMutableArray alloc] init];
        
        
        for (int i =0; i<appDelegate.globalArray.count; i++) {
            
            pedidoTotal = [NSString stringWithFormat:@" Nombre:%@           -Cantidad: %@           -Precio: %@          -Precio Total: %@ ",appDelegate.globalArray[i],appDelegate.globalArray2[i],appDelegate.globalArray1[i],appDelegate.globalArray3[i]];
            [arrayLista addObject:[NSString stringWithFormat:@"%@",pedidoTotal]];
            
            
        }
        
        
        
        NSString *documentsDirectory = [NSHomeDirectory()
                                        stringByAppendingPathComponent:@"Documents"];
        
        NSString *filePath = [documentsDirectory
                              stringByAppendingPathComponent:@"Pedido.txt"];
        
        
        
        
        NSString *fileC22 =[NSString stringWithFormat:@"%@",nombre.text];
        
        NSString *pedido = [NSString stringWithFormat:@"Pedido de %@ \n\n Nombre: %@ \n Direccion: %@ \n Email: %@ \n Telefono: %@ \n CodigoPostal: %@ \n Tipo de envio: %@ \n Tipo de pago: %@ \n\n Carrito: \n %@\n\n Fin del perdido (Enviado desde Iphone)"  ,nombre.text,nombre.text,Direccion.text,Mail.text,telefono.text,cp.text,TipoEnvio.text,TipoPago.text,arrayLista];
        
        
        [pedido writeToFile:filePath atomically:YES
                   encoding:NSUTF16StringEncoding error:nil];
        
        
        //ENVIAR ARCHIVO
        
        NSData *data = [NSData dataWithContentsOfFile:
                        [filePath stringByExpandingTildeInPath]];
        
        PFFile *pedFile = [PFFile fileWithName:fileC22 data:data];
        PFObject *recipe = [PFObject objectWithClassName:@"Pedidos"];
        [recipe setObject:pedFile forKey:@"Pedido"];
        // Upload recipe to Parse
        
        [recipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            
            if (!error) {
                // Show success message
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pedido Enviado" message:@"Su pedido ha sido enviado con éxito" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alert show];
                 [alert dismissWithClickedButtonIndex:3 animated:YES];
                
                
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"No se ha podido enviar su pedido" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alert show];
                [alert dismissWithClickedButtonIndex:3 animated:YES];
            }
            
        }];
        
        
        
        
        
        
    } else {
        NSLog(@"Clicked button index other than 0");
        // Add another action here
    }
}



@end
