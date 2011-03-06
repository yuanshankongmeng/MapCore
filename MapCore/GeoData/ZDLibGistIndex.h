//
//  LibGistIndex.h
//  ZDMapCore
//
//  Created by zhoudong on 11-2-28.
//  Copyright 2011 tg. All rights reserved.
//

#import"Enums.h"
#import "gist.h"
#import"ZDSpatialIndexPoint.h"
#import"ZDSpatialIndexRectangle.h"

@interface ZDLibGistIndex : NSObject {

	gist* _index;
}

-(void) createGistIndexWithFile:(NSString* )file IndexType:(ZDGistIndexType)indexType;
-(void) openIndexFile:(NSString*)file;
-(void) close;
	

-(void) insertPoint:(ZDSpatialIndexPoint)point withId:(long)Id;
-(void) deletePoint:(ZDSpatialIndexPoint)point;

-(void) insertRectangle:(ZDSpatialIndexRectangle)rectangle withId:(long)Id;
-(void) deleteRectangle:(ZDSpatialIndexRectangle)rectangle;

-(NSMutableArray*) containsPoint:(ZDSpatialIndexPoint)point;
-(NSMutableArray*) containedByRectangle:(ZDSpatialIndexRectangle)rectangle;
-(NSMutableArray*) overlapWithRectangle:(ZDSpatialIndexRectangle)rectangle;
@end
