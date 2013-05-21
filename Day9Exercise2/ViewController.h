//
//  ViewController.h
//  Day9Exercise2
//
//  Created by Raul Huerta on 26/04/2013.
//  Copyright (c) 2013 Unbounded Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import <QuartzCore/QuartzCore.h>

@class ViewController;

@protocol ViewControllerDelegate <NSObject>

-(void)saveMovie:(ViewController*)controller
     movieToSave:(Movie*)movie;
-(void)editMovie:(ViewController*)controller
movieToEdit:(Movie*)movie indexOfTheMovie: (int)index;

@end

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *movieTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *movieYearTextField;
@property (weak, nonatomic) IBOutlet UITextView *movieCastTextView;
@property (weak, nonatomic) IBOutlet UIButton *popAndDissmissButton;
@property BOOL editMode;
@property int editedMovieIndex;
@property (weak, nonatomic) Movie *movieEdited;
@property (weak,nonatomic) id<ViewControllerDelegate>delegate;

- (IBAction)popToRoot:(id)sender;

@end
