//
//  ViewController.h
//  ContactListSelection
//
//  Created by Vishwa Nawarathne on 9/15/16.
//  Copyright (c) 2016 IronOne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *arrayOfPeople;

//@property (nonatomic, assign) CFArrayRef people;
@property (nonatomic, strong) NSMutableSet *selectedPeople;


@end

