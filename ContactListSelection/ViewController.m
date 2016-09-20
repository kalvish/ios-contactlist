//
//  ViewController.m
//  ContactListSelection
//
//  Created by Vishwa Nawarathne on 9/15/16.
//  Copyright (c) 2016 IronOne. All rights reserved.
//

#import "ViewController.h"
#import "ContactObj.h"

@interface ViewController ()

@property (nonatomic, assign) ABAddressBookRef addressBook;
@property UITableView *tableView;
@end

@implementation ViewController

@synthesize arrayOfPeople = _arrayOfPeople;
//@synthesize people = _people;
@synthesize selectedPeople = _selectedPeople;

@synthesize addressBook = _addressBook;

@synthesize tableView = _tableView;

- (NSMutableSet *) selectedPeople {
    if (_selectedPeople == nil) {
        _selectedPeople = [[NSMutableSet alloc] init];
    }
    return _selectedPeople;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)
                                                          style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    // ABAddressBookCreateWithOptions is iOS 6 and up.
    CFErrorRef errorABAddressBookCreateWithOptions = nil;
    self.addressBook = ABAddressBookCreateWithOptions(NULL, &errorABAddressBookCreateWithOptions);
    //self.addressBook = ABAddressBookCreateWithOptions(NULL, &errorABAddressBookCreateWithOptions);
    if (errorABAddressBookCreateWithOptions) {
        // handle error
        NSError *errorToPrint = (__bridge NSError *)errorABAddressBookCreateWithOptions;
        NSLog(@"%@", errorToPrint);
        CFRelease(errorABAddressBookCreateWithOptions);
        return;
    }else{
        [self checkAddressBookAccess];
        //ABAddressBookRef addressBook = ABAddressBookCreate();
//        self.people = ABAddressBookCopyArrayOfAllPeople(self.addressBook);
//        self.arrayOfPeople = (__bridge_transfer NSArray*)ABAddressBookCopyArrayOfAllPeople(self.addressBook);
        
//        CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(self.addressBook);
//        CFMutableArrayRef peopleMutable = CFArrayCreateMutableCopy(kCFAllocatorDefault,
//                                                                   CFArrayGetCount(people),
//                                                                   people);
//        
//        CFArraySortValues(peopleMutable,
//                          CFRangeMake(0, CFArrayGetCount(peopleMutable)),
//                          (CFComparatorFunction) ABPersonComparePeopleByName,
//                          kABPersonSortByFirstName);
//        
//        // or to sort by the address book's choosen sorting technique
//        //
////         CFArraySortValues(peopleMutable,
////                           CFRangeMake(0, CFArrayGetCount(peopleMutable)),
////                           (CFComparatorFunction) ABPersonComparePeopleByName,
////                           (void*) ABPersonGetSortOrdering());
//        
//        CFRelease(people);
//        
//        // If you don't want to have to go through this ABRecordCopyValue logic
//        // in the rest of your app, rather than iterating through doing NSLog,
//        // build a new array as you iterate through the records.
//        
//        NSMutableArray *nsTempArr = [[NSMutableArray alloc] init];
//        for (CFIndex i = 0; i < CFArrayGetCount(peopleMutable); i++)
//        {
//            ABRecordRef record = CFArrayGetValueAtIndex(peopleMutable, i);
//            NSString *firstName = CFBridgingRelease(ABRecordCopyValue(record, kABPersonFirstNameProperty));
//            NSString *lastName = CFBridgingRelease(ABRecordCopyValue(record, kABPersonLastNameProperty));
//            ABMultiValueRef emailMultiValue = ABRecordCopyValue(record, kABPersonEmailProperty);
//            NSArray *emailAddresses = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);
//            CFRelease(emailMultiValue);
//            NSString * emailString = [emailAddresses objectAtIndex:0];
//            NSLog(@"person = %@, %@, %@", lastName, firstName, emailString);
//            ContactObj *temp = [[ContactObj alloc] init];
//            temp.firstName = firstName;
//            temp.lastName = lastName;
//            temp.email = emailString;
//            if(temp.firstName){
//                if(temp.lastName){
//                    temp.sortingString = [NSString stringWithFormat:@"%@ %@", temp.firstName, temp.lastName];
//                }else{
//                    temp.sortingString = temp.firstName;
//                }
//            }else if(temp.lastName){
//                temp.sortingString = temp.lastName;
//            }else if(temp.email){
//                temp.sortingString = temp.email;
//            }else {
//                continue;
//            }
//            
//            [nsTempArr addObject:temp];
//        }
//        
//        CFRelease(peopleMutable);
//        
//        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"sortingString" ascending:YES selector:@selector(caseInsensitiveCompare:)];
//        NSArray *bsortedArray=[nsTempArr sortedArrayUsingDescriptors:@[sort]];
//        //self.arrayOfPeople = [nsTempArr copy];
//        self.arrayOfPeople = bsortedArray;
//        nsTempArr = nil;
//        
//        [self.tableView reloadData];
    }


}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ContactCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    int index = indexPath.row;
//    ABRecordRef person = CFArrayGetValueAtIndex(self.people, index);
//    NSString* firstName = (__bridge_transfer NSString*)ABRecordCopyValue(person,
//                                                                         kABPersonFirstNameProperty);
//    NSString* lastName = (__bridge_transfer NSString*)ABRecordCopyValue(person,
//                                                                        kABPersonLastNameProperty);
//    ABMultiValueRef emailMultiValue = ABRecordCopyValue(person, kABPersonEmailProperty);
//    NSArray *emailAddresses = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);
//    CFRelease(emailMultiValue);
//    NSString * emailString = [emailAddresses objectAtIndex:0];
//    NSString *name = [NSString stringWithFormat:@"%@ %@ %@", firstName, lastName, emailString];
    ContactObj *tempObj = [self.arrayOfPeople objectAtIndex:index];
    cell.textLabel.text = tempObj.sortingString;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section     {
    return self.arrayOfPeople.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    id person = [self.arrayOfPeople objectAtIndex:indexPath.row];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectedPeople addObject:person];
    } else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.selectedPeople removeObject:person];
    }
    NSLog(@"%@", self.selectedPeople);
    
    NSArray *myArray = [self.selectedPeople allObjects];
    
    for (id object in myArray) {

//        ABRecordRef personTT = (__bridge ABRecordRef)object;
//        NSString* firstName = (__bridge_transfer NSString*)ABRecordCopyValue(personTT,
//                                                                             kABPersonFirstNameProperty);
//        NSString* lastName = (__bridge_transfer NSString*)ABRecordCopyValue(personTT,
//                                                                            kABPersonLastNameProperty);
//        ABMultiValueRef emailMultiValue = ABRecordCopyValue(personTT, kABPersonEmailProperty);
//        NSArray *emailAddresses = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);
//        CFRelease(emailMultiValue);
//        NSString* email = (__bridge_transfer NSString*)ABRecordCopyValue(personTT,
//                                                                         kABPersonEmailProperty);
        ContactObj *tempObj = (ContactObj *)object;
        NSString *name = [NSString stringWithFormat:@"%@ %@ %@", tempObj.firstName, tempObj.lastName, tempObj.email];
        NSLog(@"%@", name);
    }
    
   
   //NSString* firstName = (__bridge_transfer NSString*)ABRecordCopyValue((ABRecordRef)obj, kABPersonFirstNameProperty);
    //ABPersonRef *persone = self.selectedPeople
}

#pragma mark Address Book Access
// Check the authorization status of our application for Address Book
-(void)checkAddressBookAccess
{
    switch (ABAddressBookGetAuthorizationStatus())
    {
            // Update our UI if the user has granted access to their Contacts
        case  kABAuthorizationStatusAuthorized:
            [self accessGrantedForAddressBook];
            break;
            // Prompt the user for access to Contacts if there is no definitive answer
        case  kABAuthorizationStatusNotDetermined :
            [self requestAddressBookAccess];
            break;
            // Display a message if the user has denied or restricted access to Contacts
        case  kABAuthorizationStatusDenied:
        case  kABAuthorizationStatusRestricted:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning"
                                                            message:@"Permission was not granted for Contacts."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}

// Prompt the user for access to their Address Book data
-(void)requestAddressBookAccess
{
    ViewController * __weak weakSelf = self;
    
    ABAddressBookRequestAccessWithCompletion(self.addressBook, ^(bool granted, CFErrorRef error)
                                             {
                                                 if (granted)
                                                 {
                                                     dispatch_async(dispatch_get_main_queue(), ^{
                                                         [weakSelf accessGrantedForAddressBook];
                                                         
                                                     });
                                                 }
                                             });
}

// This method is called when the user has granted access to their address book data.
-(void)accessGrantedForAddressBook
{
    // Load data from the plist file
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Menu" ofType:@"plist"];
//    self.menuArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
//    [self.tableView reloadData];
    
//    self.people = ABAddressBookCopyArrayOfAllPeople(self.addressBook);
//    self.arrayOfPeople = (__bridge_transfer NSArray*)ABAddressBookCopyArrayOfAllPeople(self.addressBook);
    
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(self.addressBook);
    CFMutableArrayRef peopleMutable = CFArrayCreateMutableCopy(kCFAllocatorDefault,
                                                               CFArrayGetCount(people),
                                                               people);
    
    CFArraySortValues(peopleMutable,
                      CFRangeMake(0, CFArrayGetCount(peopleMutable)),
                      (CFComparatorFunction) ABPersonComparePeopleByName,
                      kABPersonSortByFirstName);
    
    // or to sort by the address book's choosen sorting technique
    //
    // CFArraySortValues(peopleMutable,
    //                   CFRangeMake(0, CFArrayGetCount(peopleMutable)),
    //                   (CFComparatorFunction) ABPersonComparePeopleByName,
    //                   (void*) ABPersonGetSortOrdering());
    
    CFRelease(people);
    
    // If you don't want to have to go through this ABRecordCopyValue logic
    // in the rest of your app, rather than iterating through doing NSLog,
    // build a new array as you iterate through the records.
    
    NSMutableArray *nsTempArr = [[NSMutableArray alloc] init];
    for (CFIndex i = 0; i < CFArrayGetCount(peopleMutable); i++)
    {
        ABRecordRef record = CFArrayGetValueAtIndex(peopleMutable, i);
        NSString *firstName = CFBridgingRelease(ABRecordCopyValue(record, kABPersonFirstNameProperty));
        NSString *lastName = CFBridgingRelease(ABRecordCopyValue(record, kABPersonLastNameProperty));
        ABMultiValueRef emailMultiValue = ABRecordCopyValue(record, kABPersonEmailProperty);
        NSArray *emailAddresses = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);
        CFRelease(emailMultiValue);
        NSString * emailString = [emailAddresses objectAtIndex:0];
        NSLog(@"person = %@, %@, %@", lastName, firstName, emailString);
        ContactObj *temp = [[ContactObj alloc] init];
        temp.firstName = firstName;
        temp.lastName = lastName;
        temp.email = emailString;
        if(temp.firstName && temp.email){
            if(temp.lastName){
                temp.sortingString = [NSString stringWithFormat:@"%@ %@", temp.firstName, temp.lastName];
            }else{
                temp.sortingString = temp.firstName;
            }
        }else if(temp.lastName && temp.email){
            temp.sortingString = temp.lastName;
        }else if(temp.email){
            temp.sortingString = temp.email;
        }else {
            continue;
        }

        [nsTempArr addObject:temp];
    }
    
    CFRelease(peopleMutable);
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"sortingString" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    NSArray *bsortedArray=[nsTempArr sortedArrayUsingDescriptors:@[sort]];
    //self.arrayOfPeople = [nsTempArr copy];
    self.arrayOfPeople = bsortedArray;

    nsTempArr = nil;

    [self.tableView reloadData];
}


@end
