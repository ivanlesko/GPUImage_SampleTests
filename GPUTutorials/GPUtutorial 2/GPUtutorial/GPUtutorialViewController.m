//
//  GPUtutorialViewController.m
//  GPUtutorial
//
//  Created by Nick Barrowclough on 3/26/13.
//  Copyright (c) 2013 iSoftware Developers. All rights reserved.
//

#import "GPUtutorialViewController.h"

@interface GPUtutorialViewController ()

@end

@implementation GPUtutorialViewController

@synthesize imageView, filtersTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    filterNames = [[NSMutableArray alloc] init];
    
    [self coolingLookup];
}


//get number of sections in tableView from challenges array
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of challenges
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return filterNames.count;
}


//setup cells in tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //setup cell
    static NSString *CellIdentifier = @"GPUTutorialCell";
    GPUtutorialCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *filteredDictionary = [filterNames objectAtIndex:indexPath.row];
    
    cell.imageFilename.text = [filteredDictionary objectForKey:@"filename"];
    cell.filteredImage.image = [filteredDictionary objectForKey:@"filteredImage"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *filteredDictionary = [filterNames objectAtIndex:indexPath.row];
    imageView.image = [filteredDictionary objectForKey:@"filteredImage"];
}

- (void) applyFilter:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self coolingLookup];
    }
    
}


- (IBAction)overlays:(id)sender {
    [filterNames removeAllObjects];
    [self overlayFilter1];
}

- (IBAction)filters:(id)sender {
    [filterNames removeAllObjects];
    [self coolingLookup];
}

- (IBAction)undo:(id)sender {
    imageView.image = [UIImage imageNamed:@"demo01.png"];
    [filterNames removeAllObjects];
    [self coolingLookup];
}


/*
 **********************************************************************************************
 FILTERS
 **********************************************************************************************
*/
- (void) coolingLookup {
    UIImage *filteredimage;
    NSString *filename = @"lookup_cooling.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    
    [self invertImage];
}

- (void) invertImage {
    UIImage *filteredimage;
    NSString *filename = @"lookup_invert.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self sepiaLookup];
}

- (void) sepiaLookup {
    UIImage *filteredimage;
    NSString *filename = @"lookup_sepia.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupVibrance];
}

- (void) lookupVibrance {
    UIImage *filteredimage;
    NSString *filename = @"lookup_vibrance.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupCooling2];
}

- (void) lookupCooling2 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_cooling2.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupSepia2];
}

- (void) lookupSepia2 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_sepia2.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupInfrared];
}

- (void) lookupInfrared {
    UIImage *filteredimage;
    NSString *filename = @"lookup_infrared.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupHighkey];
}

- (void) lookupHighkey {
    UIImage *filteredimage;
    NSString *filename = @"lookup_highkey.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter1];
}

- (void) lookupFilter1 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter1.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupWarming];
}

- (void) lookupWarming {
    UIImage *filteredimage;
    NSString *filename = @"lookup_warming.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter2];
}

- (void) lookupFilter2 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter2.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter3];
    
}

- (void) lookupFilter3 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter3.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter4];
}

- (void) lookupFilter4 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter4.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter5];
}

- (void) lookupFilter5 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter5.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupNeutralDensity];
}

- (void) lookupNeutralDensity {
    UIImage *filteredimage;
    NSString *filename = @"lookup_neutralDensity.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupBlackWhite];
}

- (void) lookupBlackWhite {
    UIImage *filteredimage;
    NSString *filename = @"lookup_blackWhite.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [filtersTable reloadData];
}





/*
 **********************************************************************************************
 OVERLAYS
 **********************************************************************************************
 */
- (void) overlayFilter1 {
    NSString *filename = @"fujiFrame.png";
    
    GPUImageMultiplyBlendFilter *overlayBlendFilter = [[GPUImageMultiplyBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter2];
}

- (void) overlayFilter2 {
    NSString *filename = @"grunge1.png";
    
    GPUImageMultiplyBlendFilter *overlayBlendFilter = [[GPUImageMultiplyBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter3];
}

- (void) overlayFilter3 {
    NSString *filename = @"grunge2.png";
    
    GPUImageMultiplyBlendFilter *overlayBlendFilter = [[GPUImageMultiplyBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter4];
}

- (void) overlayFilter4 {
    NSString *filename = @"grunge3.png";
    
    GPUImageMultiplyBlendFilter *overlayBlendFilter = [[GPUImageMultiplyBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter5];
}

- (void) overlayFilter5 {
    NSString *filename = @"grunge4.png";
    
    GPUImageColorBurnBlendFilter *overlayBlendFilter = [[GPUImageColorBurnBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter6];
}

- (void) overlayFilter6 {
    NSString *filename = @"grunge5.png";
    
    GPUImageLinearBurnBlendFilter *overlayBlendFilter = [[GPUImageLinearBurnBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter7];
}

- (void) overlayFilter7 {
    NSString *filename = @"grunge6.png";
    
    GPUImageOverlayBlendFilter *overlayBlendFilter = [[GPUImageOverlayBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter8];
}

- (void) overlayFilter8 {
    NSString *filename = @"grunge7.png";
    
    GPUImageOverlayBlendFilter *overlayBlendFilter = [[GPUImageOverlayBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter9];
}

- (void) overlayFilter9 {
    NSString *filename = @"grunge8.png";
    
    GPUImageColorBurnBlendFilter *overlayBlendFilter = [[GPUImageColorBurnBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter10];
}

- (void) overlayFilter10 {
    NSString *filename = @"crackedWall.png";
    
    GPUImageOverlayBlendFilter *overlayBlendFilter = [[GPUImageOverlayBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter11];
}

- (void) overlayFilter11 {
    NSString *filename = @"cornerEdges.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter12];
}

- (void) overlayFilter12 {
    NSString *filename = @"grunge10.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter13];
}

- (void) overlayFilter13 {
    NSString *filename = @"grunge11.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter14];
}

- (void) overlayFilter14 {
    NSString *filename = @"grunge12.png";
    
    GPUImageOverlayBlendFilter *overlayBlendFilter = [[GPUImageOverlayBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter15];
}

- (void) overlayFilter15 {
    NSString *filename = @"grunge13.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter16];
}

- (void) overlayFilter16 {
    NSString *filename = @"35mmOverlay.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter17];
}

- (void) overlayFilter17 {
    NSString *filename = @"35mmOverlay2.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self overlayFilter18];
}

- (void) overlayFilter18 {
    NSString *filename = @"grunge14.png";
    
    GPUImageNormalBlendFilter *overlayBlendFilter = [[GPUImageNormalBlendFilter alloc] init];
    GPUImagePicture *pic1 = [[GPUImagePicture alloc] initWithImage:imageView.image];
    GPUImagePicture *pic2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    
    [pic1 addTarget:overlayBlendFilter];
    [pic1 processImage];
    [pic2 addTarget:overlayBlendFilter];
    [pic2 processImage];
    
    UIImage *blendedImage = [overlayBlendFilter imageFromCurrentlyProcessedOutputWithOrientation:imageView.image.imageOrientation];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:blendedImage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [filtersTable reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
