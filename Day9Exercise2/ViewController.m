//
//  ViewController.m
//  Day9Exercise2
//
//  Created by Raul Huerta on 26/04/2013.
//  Copyright (c) 2013 Unbounded Solutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize popAndDissmissButton;
@synthesize editMode;
@synthesize editedMovieIndex;

-(void)viewWillAppear:(BOOL)animated
{
    [self.popAndDissmissButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self setTitleOfTheButton];
    self.movieTitleTextField.text = self.movieEdited.title;
    self.movieYearTextField.text = self.movieEdited.year;
    self.movieCastTextView.text = self.movieEdited.cast;
    
    [[self.movieCastTextView layer]setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.movieCastTextView layer]setBorderWidth:1.0f];
    self.movieCastTextView.layer.cornerRadius = 5.0f;
    self.movieCastTextView.layer.masksToBounds = NO;
    self.movieCastTextView.layer.shadowColor =[[UIColor blackColor]CGColor];
    self.movieCastTextView.layer.shadowOpacity = 1.0f;
    self.movieCastTextView.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.movieCastTextView.layer.shadowRadius = 1.0f;
    self.movieCastTextView.layer.shouldRasterize =YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.movieTitleTextField.delegate = self;
    self.movieYearTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)setTitleOfTheButton
{
    if (editMode)
    {
        [self.popAndDissmissButton setTitle:@"Dissmiss" forState:UIControlStateNormal];
    }
    else
    {
        [self.popAndDissmissButton setTitle:@"Pop" forState:UIControlStateNormal];
    }
}

- (IBAction)popToRoot:(id)sender
{
    Movie *movie = [[Movie alloc]initWithTitle:self.movieTitleTextField.text year:self.movieYearTextField.text cast:self.movieCastTextView.text];
    
    
    if (editMode)
    {
        [self.delegate editMovie:self movieToEdit:movie indexOfTheMovie:editedMovieIndex];
    }
    else
    {
        [self.delegate saveMovie:self movieToSave:movie];
    }
        
    [self setTitleOfTheButton];
    [self.popAndDissmissButton reloadInputViews];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
