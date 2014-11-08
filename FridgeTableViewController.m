//
//  FridgeTableViewController.m
//  MidtermStoryboard
//
//  Created by Calvin Nisbet on 2014-11-04.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "FridgeTableViewController.h"
#import "FridgeTableViewCell.h"
#import "Ingredient.h"

@interface FridgeTableViewController() <UISearchDisplayDelegate>



@property (weak , nonatomic) IBOutlet UIView *ingredientsFooter;
@property (nonatomic, strong) NSArray * ingredientList;
@property (nonatomic, strong) NSMutableArray * pickedIngredients;

@end

@implementation FridgeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView =  self.ingredientsFooter;
    self.ingredientList = @[@"apple", @"avocado", @"bacon", @"broccoli", @"butter", @"cauliflower", @"cheddar cheese", @"chicken", @"cinnamon", @"corn", @"crepes", @"cucumber", @"curry powder", @"eggs", @"flour", @"garlic", @"ginger", @"green peppers", @"ham", @"ice cream", @"kale", @"lemon juice", @"lettuce", @"mayonnaise", @"milk", @"mushroom", @"olive oil", @"onion", @"parmesan",    @"pork", @"potato", @"prawns", @"raspberries", @"rice", @"salmon", @"salsa", @"shrimp", @"spaghetti", @"spinach", @"sugar", @"taco", @"thyme", @"toast", @"tofu", @"tuna", @"turkey", @"zucchini"];
    self.pickedIngredients = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.ingredientList.count;
}


- (FridgeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FridgeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.ingredientLabel.text = self.ingredientList[indexPath.item];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

////-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
////    UIImage *footerImage = [UIImage imageNamed:@"gradient.png"];
////    UIImageView *imageView = [[UIImageView alloc]initWithImage:footerImage];
////    imageView.frame = CGRectMake(10, 10, 1, 30);
////    return imageView;
////    
////    return self.ingredientsFooter;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FridgeTableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    Ingredient * newIngredient = [[Ingredient alloc]init];
    newIngredient.name = cell.ingredientLabel.text;
    [self.pickedIngredients addObject:newIngredient];
    if(self.selectedOrExcluded == selected) {
        [self.delegate setSelectedIngredients:self.pickedIngredients];
    } else if(self.selectedOrExcluded == excluded) {
        [self.delegate setExcludedIngredients:self.pickedIngredients];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
