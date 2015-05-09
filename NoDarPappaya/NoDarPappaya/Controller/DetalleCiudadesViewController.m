//
//  DetalleCiudadesViewController.m
//  NoDarPappaya
//
//  Created by Rodrigo Rodriguez Faerito on 9/05/15.
//  Copyright (c) 2015 Smart Data Ltda. All rights reserved.
//

#import "DetalleCiudadesViewController.h"

@interface DetalleCiudadesViewController ()

@end

@implementation DetalleCiudadesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = self.player.nombre;
    self.title = self.player.nombre;
    
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: self.player.fotoUrl];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.foto.image = [UIImage imageWithData: data];
        });
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
