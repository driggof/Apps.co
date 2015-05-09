//
//  ListaCiudadesTableViewController.m
//  NoDarPappaya
//
//  Created by Rodrigo Rodriguez Faerito on 9/05/15.
//  Copyright (c) 2015 Smart Data Ltda. All rights reserved.
//

#import "ListaCiudadesTableViewController.h"
#import "CiudadesCellTableViewCell.h"
#import "Ciudades.h"
#import "DetalleCiudadesViewController.h"
#import <Parse/Parse.h>

@interface ListaCiudadesTableViewController (){
    NSArray *listaDeCiudades;
    Ciudades *ciudadSeleccionada;
}
@end

@implementation ListaCiudadesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor greenColor];
    self.refreshControl.tintColor  = [UIColor brownColor];
    [self.refreshControl addTarget:self
                            action:@selector(recargar)
                  forControlEvents:UIControlEventValueChanged];
    [self recargar];
    
}

-(void)recargar{
    PFQuery *consulta = [PFQuery queryWithClassName:@"ciudades"];
    [consulta findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        listaDeCiudades = objects;
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listaDeCiudades.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //configuracion de contenido en la celda
    CiudadesCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaIdentifier" forIndexPath:indexPath];
    
    Ciudades * ciudad = [self convertirDesdeDiccionario:[listaDeCiudades objectAtIndex:indexPath.row]];
    
    cell.nombre.text = ciudad.nombre;
    cell.foto.layer.cornerRadius = 44.0f;
    cell.foto.clipsToBounds = true;
    return cell;
}

-(Ciudades *)convertirDesdeDiccionario:(PFObject *) dictionary{
    Ciudades * ciudad = [[Ciudades alloc] init];
    ciudad.nombre = [dictionary objectForKey:@"nombre"];
    ciudad.fotoUrl = [NSURL URLWithString:[dictionary objectForKey:@"foto"]];
    return ciudad;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ciudadSeleccionada = [[Ciudades alloc] init];
    ciudadSeleccionada = [self convertirDesdeDiccionario:[listaDeCiudades objectAtIndex:indexPath.row]];
    [self performSegueWithIdentifier:@"detallesCiudadSegue" sender:self];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString: @"detallesCiudadSegue"]){
        [segue.destinationViewController setPlayer:ciudadSeleccionada];
    }
}

@end
