//
//  ViewController.m
//  Algorhythm
//
//  Created by Mario Vizcaino on 11/12/15.
//  Copyright © 2015 AppTest. All rights reserved.
//

#import "PlaylistMasterViewController.h"
#import "PlaylistDetailViewController.h"
#import "Playlist.h"
@interface PlaylistMasterViewController ()

@end

@implementation PlaylistMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSUInteger index =0; index < self.playlistImageView.count; index++) {
        Playlist * playlist = [[Playlist alloc] initWithIndex:index];
        
        UIImageView * playlistImageView = self.playlistImageView[index];
        
        playlistImageView.image = playlist.playlistIcon;
        playlistImageView.backgroundColor = playlist.backgroundColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"showPlaylistDetail"]) {
        
        UIImageView * playlistImageview = (UIImageView *) [sender view];
        
        if ([ self.playlistImageView containsObject:playlistImageview]) {
            NSUInteger index = [self.playlistImageView indexOfObject:playlistImageview];
            PlaylistDetailViewController * playlistDetailController = (PlaylistDetailViewController *) segue.destinationViewController;
            playlistDetailController.playlist = [[Playlist alloc]initWithIndex:index];
        }
    }
}



- (IBAction)showPlaylistDetail:(id)sender {
    [self performSegueWithIdentifier:@"showPlaylistDetail" sender:sender];
    
}

@end
