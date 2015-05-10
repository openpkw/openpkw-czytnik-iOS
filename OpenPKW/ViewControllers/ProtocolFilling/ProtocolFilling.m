//
//  ProtocolFilling.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFilling.h"

#import "Macros.h"
#import "ProtocolFilling+Descriptors.h"
#import "ProtocolFillingDataSource.h"

@interface ProtocolFilling ()

@property (nonatomic, strong) ProtocolFillingDataSource *dataSource;

@end

@implementation ProtocolFilling

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.candidatesList = [self setupTempCandidateList];
    self.dataSource = [[ProtocolFillingDataSource alloc] initWithTableDescriptor:[self setupTableDescriptor]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSectionsInTableView:tableView];
}


#pragma mark - Helper Methods

    
}

#pragma mark - Temporary Model Data Methods

- (NSArray *)setupTempCandidateList {
    
    return @[ [Candidate cadidateWithName:@"Jan Kowalski"],
              [Candidate cadidateWithName:@"Sierotka Marysia"],
              [Candidate cadidateWithName:@"Kuba Maliniak"],
              [Candidate cadidateWithName:@"Macko z Bogdanca"],
              [Candidate cadidateWithName:@"Jurand"] ];
}

@end
