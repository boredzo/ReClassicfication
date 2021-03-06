//
//  RCLAppDelegate.m
//  ReClassicfication
//
//  Created by Uli Kusterer on 20.02.13.
//  Copyright (c) 2013 Uli Kusterer. All rights reserved.
//

#import "RCLAppDelegate.h"
#import "FakeHandles.h"
#import "FakeResources.h"


@implementation RCLAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	Handle		theHand;
	long		theSize;
	char		num;
	
	InitFakeHandles( gMasterPointers );
	
	theHand = NewFakeHandle( 2 );
	
	(**(short**)theHand) = -1024;
	
	printf( "The number is: %d\n", (**(short**)theHand) );
	
	theSize = GetFakeHandleSize( theHand );
	printf( "Current Size: %ld\n", theSize );
	
	num = ((**(short**)theHand) & 0xFF00) >> 8;
	
	theSize -= 1;
	SetFakeHandleSize( theHand, theSize );
	theSize = GetFakeHandleSize( theHand );
	printf( "New Size: %ld\n", theSize );
	
	printf( "The number is: %d (%d)\n", (**(char**)theHand), num );
	
	
	FakeResFileOpen( "/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Resources/Extras2.rsrc", "r" );
}

@end
