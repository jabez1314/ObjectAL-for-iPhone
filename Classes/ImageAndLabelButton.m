//
//  ImageAndTextButton.m
//  ObjectAL
//
//  Created by Karl Stenerud on 10-08-17.
//

#import "ImageAndLabelButton.h"


#pragma mark ImageAndLabelButton

@implementation ImageAndLabelButton

#pragma mark Object Management

+ (id) buttonWithImageFile:(NSString*) filename label:(CCLabel*) label target:(id) target selector:(SEL) selector
{
	return [[[self alloc] initWithImageFile:filename label:label target:target selector:selector] autorelease];
}

- (id) initWithImageFile:(NSString*) filename label:(CCLabel*) labelIn target:(id) targetIn selector:(SEL) selectorIn
{
	label = labelIn;
	CCSprite* sprite = [CCSprite spriteWithFile:filename];
	
	float maxHeight = sprite.contentSize.height;
	if(label.contentSize.height > maxHeight)
	{
		maxHeight = label.contentSize.height;
	}
	
	float halfHeight = maxHeight * 0.5;
	
	sprite.anchorPoint = ccp(0.5, 0.5);
	sprite.position = ccp(sprite.contentSize.width*0.5, halfHeight);
	label.anchorPoint = ccp(0.5, 0.5);
	label.position = ccp(sprite.position.x + sprite.contentSize.width*0.5 + label.contentSize.width*0.5, halfHeight);
	
	CCNode* node = [CCNode node];
	[node addChild:sprite];
	[node addChild:label];
	node.contentSize = CGSizeMake(label.position.x + label.contentSize.width*0.5, maxHeight);
	
	return [super initWithTouchablePortion:node target:targetIn selector:selectorIn];
}

@synthesize label;

@end
