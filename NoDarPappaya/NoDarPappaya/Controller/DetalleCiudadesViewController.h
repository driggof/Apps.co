//
//  DetalleCiudadesViewController.h
//  NoDarPappaya
//
//  Created by Rodrigo Rodriguez Faerito on 9/05/15.
//  Copyright (c) 2015 Smart Data Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ciudades.h"

@interface DetalleCiudadesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *foto;
@property (weak, nonatomic)  Ciudades *player;

@end
