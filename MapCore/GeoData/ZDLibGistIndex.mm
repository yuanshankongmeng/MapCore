//
//  LibGistIndex.m
//  ZDMapCore
//
//  Created by zhoudong on 11-2-28.
//  Copyright 2011 tg. All rights reserved.
//

#import "ZDLibGistIndex.h"

#import "gist_extensions.h"

@implementation ZDLibGistIndex

-(id)init
{
	if([super init])
	{
	}
	_index = new gist;
	return self;
}

-(void)dealloc
{
	delete _index;
	[super dealloc];
}

-(void)createGistIndexWithFile:(NSString *)file IndexType:(ZDGistIndexType)indexType
{
	gist* index;
	
	if(indexType == ZDGistRTree)
	{		
		index->create([file UTF8String], _gist_exts[0]);
	}
	
}

-(void)openIndexFile:(NSString *)file
{
	_index->open([file UTF8String]);
}

-(void)close
{
	_index->close();
}

-(void)insertPoint:(ZDSpatialIndexPoint)point withId:(long)Id
{
	double key1[] = {point.x, point.y};
	
	_index->insert((void*)key1, sizeof(double), (void*)Id, sizeof(long));
}

-(void)insertRectangle:(ZDSpatialIndexRectangle)rectangle withId:(long)Id
{
	double key1[] = {rectangle.LeftBottomPoint.x, rectangle.LeftBottomPoint.y,
					rectangle.RightTopPoint.x, rectangle.RightTopPoint.y};
	_index->insert((void*)key1, sizeof(double), (void*)Id, sizeof(long));
}

@end
