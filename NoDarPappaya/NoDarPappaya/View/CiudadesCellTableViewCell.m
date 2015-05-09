//
//  CiudadesCellTableViewCell.m
//  NoDarPappaya
//
//  Created by Rodrigo Rodriguez Faerito on 9/05/15.
//  Copyright (c) 2015 Smart Data Ltda. All rights reserved.
//

#import "CiudadesCellTableViewCell.h"

@implementation CiudadesCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cargarFotoDesdeURL:(NSURL *)url{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: url];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.foto.image = [UIImage imageWithData: data];
        });
    });
}


@end
