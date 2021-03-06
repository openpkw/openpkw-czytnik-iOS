//
//  ProtocolFilling+Descriptors.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFilling+Descriptors.h"

NSString *const kCellReuseIdForBoldSingleLineCenterCell = @"SingleLableBoldCenterCell";
NSString *const kCellReuseIdForButtonCell               = @"ButtonCell";
NSString *const kCellReuseIdForCountedTitleInputCell    = @"CountedTitleInputCell";
NSString *const kCellReuseIdForDoubleValueTextCell      = @"DoubleValueTextCell";
NSString *const kCellReuseIdForSingleLabelCenterCell    = @"SingleLabelCenterCell";
NSString *const kCellReuseIdForTitleInputCell           = @"TitleInputCell";
NSString *const kCellReuseIdForSingleLabelLeftCell      = @"SingleLabelLeftCell";


@implementation ProtocolFilling (Descriptors)

- (TableViewDescriptor *)setupTableDescriptor {
    TableViewDescriptor *tableDescriptor = [TableViewDescriptor tableViewDescriptor];
    
    [tableDescriptor addSectionDescriptor:[self basicInformationSection]];
    [tableDescriptor addSectionDescriptor:[self otherCommisonSection]];
    [tableDescriptor addSectionDescriptor:[self votesGeneralSection]];
    [tableDescriptor addSectionDescriptor:[self votesCandidatesSection]];
    
    return tableDescriptor;
}

- (SectionDescriptor *)basicInformationSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSArray *rows = @[
                      [RowDescriptor rowDescriptorWithDisplayText:@"Obwodowa Komisja Wyborcz Nr:"
                                                      cellReuseID:kCellReuseIdForBoldSingleLineCenterCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"Nr: 582"
                                                    secondaryText:@"146513-582"
                                                      cellReuseID:kCellReuseIdForDoubleValueTextCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"Przedszkole nr 55"
                                                      cellReuseID:kCellReuseIdForSingleLabelCenterCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"ul. Jana Cybisa 1, 02-784 Warszawa"
                                                      cellReuseID:kCellReuseIdForSingleLabelCenterCell]
                      
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)otherCommisonSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSArray *rows = @[
                      [RowDescriptor rowDescriptorWithDisplayText:@"Inna Komisja"
                                                      cellReuseID:kCellReuseIdForButtonCell]
                      
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)votesGeneralSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSArray *rows = @[
                      [RowDescriptor rowDescriptorWithDisplayText:@"I.1.Uprawnionych do głosowania"
                                                      cellReuseID:kCellReuseIdForTitleInputCell
                                                     keyboardType:UIKeyboardTypeNumberPad],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"I.4.Wydano kart do głosowania"
                                                      cellReuseID:kCellReuseIdForTitleInputCell
                                                     keyboardType:UIKeyboardTypeNumberPad],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"II.11. Kart ważnych"
                                                      cellReuseID:kCellReuseIdForTitleInputCell
                                                     keyboardType:UIKeyboardTypeNumberPad],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"II.12 Głosów nieważnych"
                                                      cellReuseID:kCellReuseIdForTitleInputCell
                                                     keyboardType:UIKeyboardTypeNumberPad],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"II.13. Głosów ważnych"
                                                      cellReuseID:kCellReuseIdForTitleInputCell
                                                     keyboardType:UIKeyboardTypeNumberPad]
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)votesCandidatesSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSMutableArray *rows = [NSMutableArray arrayWithCapacity:self.candidatesList.count + 1];
    
    [rows addObject:[RowDescriptor rowDescriptorWithDisplayText:@"II.14. Kandydaci otrzymali głosów ważnych"
                                                    cellReuseID:kCellReuseIdForDoubleValueTextCell]];
    
    for (Candidate *candidate in self.candidatesList) {
        [rows addObject:[RowDescriptor rowDescriptorWithDisplayText:candidate.cadidateName
                                                        cellReuseID:kCellReuseIdForCountedTitleInputCell
                                                       keyboardType:UIKeyboardTypeNumberPad]];
        
    }
    
    [section addRowsDescriptors:rows];
    
    return section;
}

@end
