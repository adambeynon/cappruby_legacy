@STATIC;1.0;p;15;_CPCornerView.ji;8;CPView.jc;461;
var _1=objj_allocateClassPair(CPView,"_CPCornerView"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5)){
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(CPColor,"purpleColor"));
}
return _3;
}
})]);
p;18;_CPDisplayServer.jc;1205;
var _1=[],_2={},_3=[],_4={},_5=objj_msgSend(CPRunLoop,"mainRunLoop");
_CPDisplayServerAddDisplayObject=function(_6){
var _7=objj_msgSend(_6,"UID");
if(typeof _2[_7]!=="undefined"){
return;
}
var _8=_1.length;
_2[_7]=_8;
_1[_8]=_6;
};
_CPDisplayServerAddLayoutObject=function(_9){
var _a=objj_msgSend(_9,"UID");
if(typeof _4[_a]!=="undefined"){
return;
}
var _b=_3.length;
_4[_a]=_b;
_3[_b]=_9;
};
var _c=objj_allocateClassPair(CPObject,"_CPDisplayServer"),_d=_c.isa;
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_d,[new objj_method(sel_getUid("run"),function(_e,_f){
with(_e){
while(_3.length||_1.length){
var _10=0;
for(;_10<_3.length;++_10){
var _11=_3[_10];
delete _4[objj_msgSend(_11,"UID")];
objj_msgSend(_11,"layoutIfNeeded");
}
_3=[];
_4={};
_10=0;
for(;_10<_1.length;++_10){
if(_3.length){
break;
}
var _11=_1[_10];
delete _2[objj_msgSend(_11,"UID")];
objj_msgSend(_11,"displayIfNeeded");
}
if(_10===_1.length){
_1=[];
_2={};
}else{
_1=_1.splice(0,_10);
}
}
objj_msgSend(_5,"performSelector:target:argument:order:modes:",sel_getUid("run"),_e,nil,0,[CPDefaultRunLoopMode]);
}
})]);
objj_msgSend(_CPDisplayServer,"run");
p;21;_CPImageAndTextView.jI;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;7026;
CPTopVerticalTextAlignment=1,CPCenterVerticalTextAlignment=2,CPBottomVerticalTextAlignment=3;
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6,_8=1<<7,_9=1<<8,_a=1<<9,_b=1<<10;
var _c=3,_d=5;
var _e=objj_allocateClassPair(CPView,"_CPImageAndTextView"),_f=_e.isa;
class_addIvars(_e,[new objj_ivar("_alignment"),new objj_ivar("_verticalAlignment"),new objj_ivar("_lineBreakMode"),new objj_ivar("_textColor"),new objj_ivar("_font"),new objj_ivar("_textShadowColor"),new objj_ivar("_textShadowOffset"),new objj_ivar("_imagePosition"),new objj_ivar("_imageScaling"),new objj_ivar("_image"),new objj_ivar("_text"),new objj_ivar("_textSize"),new objj_ivar("_flags")]);
objj_registerClassPair(_e);
objj_addClassForBundle(_e,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_e,[new objj_method(sel_getUid("initWithFrame:control:"),function(_10,_11,_12,_13){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPView")},"initWithFrame:",_12);
if(_10){
_textShadowOffset={width:0,height:0};
objj_msgSend(_10,"setVerticalAlignment:",CPTopVerticalTextAlignment);
if(_13){
objj_msgSend(_10,"setLineBreakMode:",objj_msgSend(_13,"lineBreakMode"));
objj_msgSend(_10,"setTextColor:",objj_msgSend(_13,"textColor"));
objj_msgSend(_10,"setAlignment:",objj_msgSend(_13,"alignment"));
objj_msgSend(_10,"setVerticalAlignment:",objj_msgSend(_13,"verticalAlignment"));
objj_msgSend(_10,"setFont:",objj_msgSend(_13,"font"));
objj_msgSend(_10,"setImagePosition:",objj_msgSend(_13,"imagePosition"));
objj_msgSend(_10,"setImageScaling:",objj_msgSend(_13,"imageScaling"));
}else{
objj_msgSend(_10,"setLineBreakMode:",CPLineBreakByClipping);
objj_msgSend(_10,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_10,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_10,"setImagePosition:",CPNoImage);
objj_msgSend(_10,"setImageScaling:",CPScaleNone);
}
_textSize=NULL;
}
return _10;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(_14,"initWithFrame:control:",_16,nil);
}
}),new objj_method(sel_getUid("setAlignment:"),function(_17,_18,_19){
with(_17){
if(_alignment===_19){
return;
}
_alignment=_19;
}
}),new objj_method(sel_getUid("alignment"),function(_1a,_1b){
with(_1a){
return _alignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_1c,_1d,_1e){
with(_1c){
if(_verticalAlignment===_1e){
return;
}
_verticalAlignment=_1e;
_flags|=_5;
objj_msgSend(_1c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_1f,_20){
with(_1f){
return _verticalAlignment;
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_21,_22,_23){
with(_21){
if(_lineBreakMode===_23){
return;
}
_lineBreakMode=_23;
_flags|=_6;
objj_msgSend(_21,"setNeedsLayout");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_24,_25){
with(_24){
return _lineBreakMode;
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_26,_27,_28){
with(_26){
if(_imagePosition==_28){
return;
}
_imagePosition=_28;
_flags|=_a;
objj_msgSend(_26,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imagePosition"),function(_29,_2a){
with(_29){
return _imagePosition;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_2b,_2c,_2d){
with(_2b){
if(_imageScaling==_2d){
return;
}
_imageScaling=_2d;
_flags|=_b;
objj_msgSend(_2b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imageScaling"),function(_2e,_2f){
with(_2e){
return _imageScaling;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_30,_31,_32){
with(_30){
if(_textColor===_32){
return;
}
_textColor=_32;
}
}),new objj_method(sel_getUid("textColor"),function(_33,_34){
with(_33){
return _textColor;
}
}),new objj_method(sel_getUid("setFont:"),function(_35,_36,_37){
with(_35){
if(_font===_37){
return;
}
_font=_37;
_flags|=_8;
_textSize=NULL;
objj_msgSend(_35,"setNeedsLayout");
}
}),new objj_method(sel_getUid("font"),function(_38,_39){
with(_38){
return _font;
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_3a,_3b,_3c){
with(_3a){
if(_textShadowColor===_3c){
return;
}
_textShadowColor=_3c;
_flags|=_9;
objj_msgSend(_3a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_3d,_3e){
with(_3d){
return _textShadowColor;
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_3f,_40,_41){
with(_3f){
if((_textShadowOffset.width==_41.width&&_textShadowOffset.height==_41.height)){
return;
}
_textShadowOffset={width:_41.width,height:_41.height};
objj_msgSend(_3f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_42,_43){
with(_42){
return _textShadowOffset;
}
}),new objj_method(sel_getUid("setImage:"),function(_44,_45,_46){
with(_44){
if(_image==_46){
return;
}
_image=_46;
_flags|=_2;
objj_msgSend(_44,"setNeedsLayout");
}
}),new objj_method(sel_getUid("image"),function(_47,_48){
with(_47){
return _image;
}
}),new objj_method(sel_getUid("setText:"),function(_49,_4a,_4b){
with(_49){
if(_text===_4b){
return;
}
_text=_4b;
_flags|=_3;
_textSize=NULL;
objj_msgSend(_49,"setNeedsLayout");
}
}),new objj_method(sel_getUid("text"),function(_4c,_4d){
with(_4c){
return _text;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(_4e,"bounds").size,_51={origin:{x:0,y:0},size:{width:_50.width,height:_50.height}};
if(hasDOMImageElement){
if(!_52){
var _52=_DOMImageElement.style;
}
if(_flags&_2){
_DOMImageElement.src=objj_msgSend(_image,"filename");
}
var _53=_50.width/2,_54=_50.height/2,_55=objj_msgSend(_image,"size"),_56=_55.width,_57=_55.height;
if(_imageScaling===CPScaleToFit){
_56=_50.width;
_57=_50.height;
}else{
if(_imageScaling===CPScaleProportionally){
var _58=MIN(MIN(_50.width,_56)/_56,MIN(_50.height,_57)/_57);
_56*=_58;
_57*=_58;
}
}
if(_imagePosition===CPImageBelow){
_51.size.height=_50.height-_57-_d;
}else{
if(_imagePosition===CPImageAbove){
_51.origin.y+=_57+_d;
_51.size.height=_50.height-_57-_d;
}else{
if(_imagePosition===CPImageLeft){
_51.origin.x=_56+_c;
_51.size.width-=_56+_c;
}else{
if(_imagePosition===CPImageRight){
_51.size.width-=_56+_c;
}else{
if(_imagePosition===CPImageOnly){
}
}
}
}
}
}
_flags=0;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_59,_5a){
with(_59){
var _5b=CGSizeMakeZero();
if((_imagePosition!==CPNoImage)&&_image){
var _5c=objj_msgSend(_image,"size");
_5b.width+=_5c.width;
_5b.height+=_5c.height;
}
if((_imagePosition!==CPImageOnly)&&objj_msgSend(_text,"length")>0){
if(!_textSize){
_textSize=objj_msgSend(_text,"sizeWithFont:",_font?_font:objj_msgSend(CPFont,"systemFontOfSize:",12));
}
if(_imagePosition===CPImageLeft||_imagePosition===CPImageRight){
_5b.width+=_textSize.width+_c;
_5b.height=MAX(_5b.height,_textSize.height);
}else{
if(_imagePosition===CPImageAbove||_imagePosition===CPImageBelow){
_5b.width=MAX(_5b.width,_textSize.width);
_5b.height+=_textSize.height+_d;
}else{
_5b.width=MAX(_5b.width,_textSize.width);
_5b.height=MAX(_5b.height,_textSize.height);
}
}
}
objj_msgSend(_59,"setFrameSize:",_5b);
}
})]);
p;8;AppKit.ji;9;CALayer.ji;9;CPAlert.ji;13;CPAnimation.ji;15;CPApplication.ji;14;CPBezierPath.ji;7;CPBox.ji;10;CPButton.ji;13;CPButtonBar.ji;12;CPCheckBox.ji;7;CPCib.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;14;CPCibLoading.ji;22;CPCibOutletConnector.ji;12;CPClipView.ji;22;CPCollectionViewItem.ji;18;CPCollectionView.ji;9;CPColor.ji;14;CPColorPanel.ji;13;CPColorWell.ji;17;CPCompatibility.ji;11;CPControl.ji;10;CPCookie.ji;12;CPDocument.ji;22;CPDocumentController.ji;9;CPEvent.ji;14;CPFlashMovie.ji;13;CPFlashView.ji;8;CPFont.ji;15;CPFontManager.ji;12;CPGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPMenu.ji;12;CPMenuItem.ji;13;CPOpenPanel.ji;9;CPPanel.ji;14;CPPasteboard.ji;15;CPPopUpButton.ji;21;CPProgressIndicator.ji;9;CPRadio.ji;13;CPResponder.ji;15;CPSearchField.ji;14;CPScrollView.ji;12;CPScroller.ji;19;CPSecureTextField.ji;20;CPSegmentedControl.ji;10;CPShadow.ji;10;CPSlider.ji;13;CPSplitView.ji;11;CPTabView.ji;15;CPTableColumn.ji;13;CPTableView.ji;13;CPTextField.ji;11;CPToolbar.ji;15;CPToolbarItem.ji;8;CPView.ji;18;CPViewController.ji;11;CPWebView.ji;10;CPWindow.ji;20;CPWindowController.jp;17;CPAccordionView.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;32;Foundation/CPKeyValueObserving.jI;23;Foundation/CPIndexSet.jI;21;Foundation/CPString.jI;15;AppKit/CPView.jc;10068;
var _1=objj_allocateClassPair(CPObject,"CPAccordionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_view"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return _identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_5,_6,_7){
with(_5){
_identifier=_7;
}
}),new objj_method(sel_getUid("view"),function(_8,_9){
with(_8){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_a,_b,_c){
with(_a){
_view=_c;
}
}),new objj_method(sel_getUid("label"),function(_d,_e){
with(_d){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_f,_10,_11){
with(_f){
_label=_11;
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPObject")},"init");
if(_14){
objj_msgSend(_14,"setIdentifier:",_16);
}
return _14;
}
})]);
var _1=objj_allocateClassPair(CPView,"CPAccordionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_dirtyItemIndex"),new objj_ivar("_itemHeaderPrototype"),new objj_ivar("_items"),new objj_ivar("_itemViews"),new objj_ivar("_expandedItemIndexes")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPView")},"initWithFrame:",_19);
if(_17){
_items=[];
_itemViews=[];
_expandedItemIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(_17,"setItemHeaderPrototype:",objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:100,height:24}}));
}
return _17;
}
}),new objj_method(sel_getUid("setItemHeaderPrototype:"),function(_1a,_1b,_1c){
with(_1a){
_itemHeaderPrototype=_1c;
}
}),new objj_method(sel_getUid("itemHeaderPrototype"),function(_1d,_1e){
with(_1d){
return _itemHeaderPrototype;
}
}),new objj_method(sel_getUid("items"),function(_1f,_20){
with(_1f){
return _items;
}
}),new objj_method(sel_getUid("addItem:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"insertItem:atIndex:",_23,_items.length);
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_24,_25,_26,_27){
with(_24){
objj_msgSend(_expandedItemIndexes,"addIndex:",_27);
var _28=objj_msgSend(objj_msgSend(_CPAccordionItemView,"alloc"),"initWithAccordionView:",_24);
objj_msgSend(_28,"setIndex:",_27);
objj_msgSend(_28,"setLabel:",objj_msgSend(_26,"label"));
objj_msgSend(_28,"setContentView:",objj_msgSend(_26,"view"));
objj_msgSend(_24,"addSubview:",_28);
objj_msgSend(_items,"insertObject:atIndex:",_26,_27);
objj_msgSend(_itemViews,"insertObject:atIndex:",_28,_27);
objj_msgSend(_24,"_invalidateItemsStartingAtIndex:",_27);
objj_msgSend(_24,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeItem:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2b));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_expandedItemIndexes,"removeIndex:",_2e);
objj_msgSend(_itemViews[_2e],"removeFromSuperview");
objj_msgSend(_items,"removeObjectAtIndex:",_2e);
objj_msgSend(_itemViews,"removeObjectAtIndex:",_2e);
objj_msgSend(_2c,"_invalidateItemsStartingAtIndex:",_2e);
objj_msgSend(_2c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeAllItems"),function(_2f,_30){
with(_2f){
var _31=_items.length;
while(_31--){
objj_msgSend(_2f,"removeItemAtIndex:",_31);
}
}
}),new objj_method(sel_getUid("expandItemAtIndex:"),function(_32,_33,_34){
with(_32){
if(!objj_msgSend(_itemViews[_34],"isCollapsed")){
return;
}
objj_msgSend(_expandedItemIndexes,"addIndex:",_34);
objj_msgSend(_itemViews[_34],"setCollapsed:",NO);
objj_msgSend(_32,"_invalidateItemsStartingAtIndex:",_34);
}
}),new objj_method(sel_getUid("collapseItemAtIndex:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_itemViews[_37],"isCollapsed")){
return;
}
objj_msgSend(_expandedItemIndexes,"removeIndex:",_37);
objj_msgSend(_itemViews[_37],"setCollapsed:",YES);
objj_msgSend(_35,"_invalidateItemsStartingAtIndex:",_37);
}
}),new objj_method(sel_getUid("toggleItemAtIndex:"),function(_38,_39,_3a){
with(_38){
var _3b=_itemViews[_3a];
if(objj_msgSend(_3b,"isCollapsed")){
objj_msgSend(_38,"expandItemAtIndex:",_3a);
}else{
objj_msgSend(_38,"collapseItemAtIndex:",_3a);
}
}
}),new objj_method(sel_getUid("expandedItemIndexes"),function(_3c,_3d){
with(_3c){
return _expandedItemIndexes;
}
}),new objj_method(sel_getUid("collapsedItemIndexes"),function(_3e,_3f){
with(_3e){
var _40=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_items.length));
objj_msgSend(_40,"removeIndexes:",_expandedIndexes);
return _40;
}
}),new objj_method(sel_getUid("_invalidateItemsStartingAtIndex:"),function(_41,_42,_43){
with(_41){
if(_dirtyItemIndex===CPNotFound){
_dirtyItemIndex=_43;
}
_dirtyItemIndex=MIN(_dirtyItemIndex,_43);
objj_msgSend(_41,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_44,_45,_46){
with(_44){
var _47=(objj_msgSend(_44,"frame").size.width);
objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPView")},"setFrameSize:",_46);
if(_47!==(objj_msgSend(_44,"frame").size.width)){
objj_msgSend(_44,"_invalidateItemsStartingAtIndex:",0);
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_48,_49){
with(_48){
if(_items.length<=0){
return objj_msgSend(_48,"setFrameSize:",{width:(objj_msgSend(_48,"frame").size.width),height:0});
}
if(_dirtyItemIndex===CPNotFound){
return;
}
_dirtyItemIndex=MIN(_dirtyItemIndex,_items.length-1);
var _4a=_dirtyItemIndex,_4b=_itemViews.length,_4c=(objj_msgSend(_48,"bounds").size.width),y=_4a>0?CGRectGetMaxY(objj_msgSend(_itemViews[_4a-1],"frame")):0;
_dirtyItemIndex=CPNotFound;
for(;_4a<_4b;++_4a){
var _4d=_itemViews[_4a];
objj_msgSend(_4d,"setFrameY:width:",y,_4c);
y=CGRectGetMaxY(objj_msgSend(_4d,"frame"));
}
objj_msgSend(_48,"setFrameSize:",{width:(objj_msgSend(_48,"frame").size.width),height:y});
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPAccordionItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_accordionView"),new objj_ivar("_isCollapsed"),new objj_ivar("_index"),new objj_ivar("_headerView"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isCollapsed"),function(_4e,_4f){
with(_4e){
return _isCollapsed;
}
}),new objj_method(sel_getUid("setCollapsed:"),function(_50,_51,_52){
with(_50){
_isCollapsed=_52;
}
}),new objj_method(sel_getUid("index"),function(_53,_54){
with(_53){
return _index;
}
}),new objj_method(sel_getUid("setIndex:"),function(_55,_56,_57){
with(_55){
_index=_57;
}
}),new objj_method(sel_getUid("initWithAccordionView:"),function(_58,_59,_5a){
with(_58){
_58=objj_msgSendSuper({receiver:_58,super_class:objj_getClass("CPView")},"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
if(_58){
_accordionView=_5a;
_isCollapsed=NO;
var _5b=objj_msgSend(_58,"bounds");
_headerView=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",objj_msgSend(_accordionView,"itemHeaderPrototype")));
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setTarget:"))&&objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_headerView,"setTarget:",_58);
objj_msgSend(_headerView,"setAction:",sel_getUid("toggle:"));
}
objj_msgSend(_58,"addSubview:",_headerView);
}
return _58;
}
}),new objj_method(sel_getUid("toggle:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_accordionView,"toggleItemAtIndex:",objj_msgSend(_5c,"index"));
}
}),new objj_method(sel_getUid("setLabel:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setTitle:"))){
objj_msgSend(_headerView,"setTitle:",_61);
}else{
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setLabel:"))){
objj_msgSend(_headerView,"setLabel:",_61);
}else{
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_headerView,"setStringValue:",_61);
}
}
}
}
}),new objj_method(sel_getUid("setContentView:"),function(_62,_63,_64){
with(_62){
if(_contentView===_64){
return;
}
objj_msgSend(_contentView,"removeObserver:forKeyPath:",_62,"frame");
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_64;
objj_msgSend(_contentView,"addObserver:forKeyPath:options:context:",_62,"frame",0,NULL);
objj_msgSend(_62,"addSubview:",_contentView);
objj_msgSend(_accordionView,"_invalidateItemsStartingAtIndex:",objj_msgSend(_62,"index"));
}
}),new objj_method(sel_getUid("setFrameY:width:"),function(_65,_66,aY,_67){
with(_65){
var _68=(objj_msgSend(_headerView,"frame").size.height);
objj_msgSend(_headerView,"setFrameSize:",{width:_67,height:_68});
objj_msgSend(_contentView,"setFrameOrigin:",{x:0,y:_68});
if(objj_msgSend(_65,"isCollapsed")){
objj_msgSend(_65,"setFrame:",{origin:{x:0,y:aY},size:{width:_67,height:_68}});
}else{
var _69=(objj_msgSend(_contentView,"frame").size.height);
objj_msgSend(_contentView,"setFrameSize:",{width:_67,height:_69});
objj_msgSend(_65,"setFrame:",{origin:{x:0,y:aY},size:{width:_67,height:_69+_68}});
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6a,_6b,_6c){
with(_6a){
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_6d,_6e,_6f,_70,_71,_72){
with(_6d){
if(_6f==="frame"&&!CGRectEqualToRect(objj_msgSend(_71,"objectForKey:",CPKeyValueChangeOldKey),objj_msgSend(_71,"objectForKey:",CPKeyValueChangeNewKey))){
objj_msgSend(_accordionView,"_invalidateItemsStartingAtIndex:",objj_msgSend(_6d,"index"));
}
}
})]);
p;9;CPAlert.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPColor.jI;15;AppKit/CPFont.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jI;16;AppKit/CPPanel.jI;20;AppKit/CPTextField.jc;5789;
CPWarningAlertStyle=0;
CPInformationalAlertStyle=1;
CPCriticalAlertStyle=2;
var _1,_2,_3;
var _4=objj_allocateClassPair(CPObject,"CPAlert"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_alertPanel"),new objj_ivar("_messageLabel"),new objj_ivar("_alertImageView"),new objj_ivar("_alertStyle"),new objj_ivar("_windowTitle"),new objj_ivar("_windowStyle"),new objj_ivar("_buttonCount"),new objj_ivar("_buttons"),new objj_ivar("_delegate")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init")){
_buttonCount=0;
_buttons=objj_msgSend(CPArray,"array");
_alertStyle=CPWarningAlertStyle;
objj_msgSend(_6,"setWindowStyle:",nil);
}
return _6;
}
}),new objj_method(sel_getUid("setWindowStyle:"),function(_8,_9,_a){
with(_8){
_windowStyle=_a;
_alertPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,110),_a?_a|CPTitledWindowMask:CPTitledWindowMask);
objj_msgSend(_alertPanel,"setFloatingPanel:",YES);
objj_msgSend(_alertPanel,"center");
objj_msgSend(_messageLabel,"setTextColor:",(_a&CPHUDBackgroundWindowMask)?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(CPColor,"blackColor"));
var _b=objj_msgSend(_buttons,"count");
for(var i=0;i<_b;i++){
var _c=_buttons[i];
objj_msgSend(_c,"setFrameSize:",CGSizeMake(objj_msgSend(_c,"frame").size.width,(_a==CPHUDBackgroundWindowMask)?20:24));
objj_msgSend(_c,"setBezelStyle:",(_a&CPHUDBackgroundWindowMask)?CPHUDBezelStyle:CPRoundedBezelStyle);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_c);
}
if(!_messageLabel){
var _d=objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"bounds");
_messageLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(57,10,CGRectGetWidth(_d)-73,62));
objj_msgSend(_messageLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",13));
objj_msgSend(_messageLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_messageLabel,"setAlignment:",CPJustifiedTextAlignment);
_alertImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(15,12,32,32));
}
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_messageLabel);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_alertImageView);
}
}),new objj_method(sel_getUid("setTitle:"),function(_e,_f,_10){
with(_e){
_windowTitle=_10;
}
}),new objj_method(sel_getUid("title"),function(_11,_12){
with(_11){
return _windowTitle;
}
}),new objj_method(sel_getUid("windowStyle"),function(_13,_14){
with(_13){
return _windowStyle;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_15,_16,_17){
with(_15){
_delegate=_17;
}
}),new objj_method(sel_getUid("delegate"),function(_18,_19){
with(_18){
return _delegate;
}
}),new objj_method(sel_getUid("setAlertStyle:"),function(_1a,_1b,_1c){
with(_1a){
_alertStyle=_1c;
}
}),new objj_method(sel_getUid("alertStyle"),function(_1d,_1e){
with(_1d){
return _alertStyle;
}
}),new objj_method(sel_getUid("setMessageText:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_messageLabel,"setStringValue:",_21);
}
}),new objj_method(sel_getUid("messageText"),function(_22,_23){
with(_22){
return objj_msgSend(_messageLabel,"stringValue");
}
}),new objj_method(sel_getUid("addButtonWithTitle:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"bounds"),_28=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(CGRectGetWidth(_27)-((_buttonCount+1)*90),CGRectGetHeight(_27)-34,80,(_windowStyle==CPHUDBackgroundWindowMask)?20:24));
objj_msgSend(_28,"setTitle:",_26);
objj_msgSend(_28,"setTarget:",_24);
objj_msgSend(_28,"setTag:",_buttonCount);
objj_msgSend(_28,"setAction:",sel_getUid("_notifyDelegate:"));
objj_msgSend(_28,"setBezelStyle:",(_windowStyle==CPHUDBackgroundWindowMask)?CPHUDBezelStyle:CPRoundRectBezelStyle);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_28);
if(_buttonCount==0){
objj_msgSend(_alertPanel,"setDefaultButton:",_28);
}
_buttonCount++;
objj_msgSend(_buttons,"addObject:",_28);
}
}),new objj_method(sel_getUid("runModal"),function(_29,_2a){
with(_29){
var _2b;
switch(_alertStyle){
case CPWarningAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_1);
_2b="Warning";
break;
case CPInformationalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_2);
_2b="Information";
break;
case CPCriticalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_3);
_2b="Error";
break;
}
objj_msgSend(_alertPanel,"setTitle:",_windowTitle?_windowTitle:_2b);
objj_msgSend(CPApp,"runModalForWindow:",_alertPanel);
}
}),new objj_method(sel_getUid("_notifyDelegate:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(CPApp,"abortModal");
objj_msgSend(_alertPanel,"close");
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("alertDidEnd:returnCode:"))){
objj_msgSend(_delegate,"alertDidEnd:returnCode:",_2c,objj_msgSend(_2e,"tag"));
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_2f,_30){
with(_2f){
if(_2f!=CPAlert){
return;
}
var _31=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_2f,"class"));
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPAlert/dialog-warning.png"),CGSizeMake(32,32));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPAlert/dialog-information.png"),CGSizeMake(32,32));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPAlert/dialog-error.png"),CGSizeMake(32,32));
}
})]);
p;13;CPAnimation.jI;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;5384;
CPAnimationEaseInOut=0;
CPAnimationEaseIn=1;
CPAnimationEaseOut=2;
CPAnimationLinear=3;
ACTUAL_FRAME_RATE=0;
var _1=objj_allocateClassPair(CPObject,"CPAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_lastTime"),new objj_ivar("_duration"),new objj_ivar("_animationCurve"),new objj_ivar("_timingFunction"),new objj_ivar("_frameRate"),new objj_ivar("_progress"),new objj_ivar("_delegate"),new objj_ivar("_timer")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithDuration:animationCurve:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_progress=0;
_duration=MAX(0,_5);
_frameRate=60;
objj_msgSend(_3,"setAnimationCurve:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_7,_8,_9){
with(_7){
switch(_9){
case CPAnimationEaseInOut:
timingFunctionName=kCAMediaTimingFunctionEaseInEaseOut;
break;
case CPAnimationEaseIn:
timingFunctionName=kCAMediaTimingFunctionEaseIn;
break;
case CPAnimationEaseOut:
timingFunctionName=kCAMediaTimingFunctionEaseOut;
break;
case CPAnimationLinear:
timingFunctionName=kCAMediaTimingFunctionLinear;
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid value provided for animation curve");
break;
}
_animationCurve=_9;
_timingFunction=objj_msgSend(CAMediaTimingFunction,"functionWithName:",timingFunctionName);
}
}),new objj_method(sel_getUid("animationCurve"),function(_a,_b){
with(_a){
return _animationCurve;
}
}),new objj_method(sel_getUid("setDuration:"),function(_c,_d,_e){
with(_c){
if(_e<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"aDuration can't be negative");
}
_duration=_e;
}
}),new objj_method(sel_getUid("duration"),function(_f,_10){
with(_f){
return _duration;
}
}),new objj_method(sel_getUid("setFrameRate:"),function(_11,_12,_13){
with(_11){
if(_13<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"frameRate can't be negative");
}
_frameRate=_13;
}
}),new objj_method(sel_getUid("frameRate"),function(_14,_15){
with(_14){
return _frameRate;
}
}),new objj_method(sel_getUid("delegate"),function(_16,_17){
with(_16){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_18,_19,_1a){
with(_18){
_delegate=_1a;
}
}),new objj_method(sel_getUid("startAnimation"),function(_1b,_1c){
with(_1b){
if(_timer||_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationShouldStart:"))&&!objj_msgSend(_delegate,"animationShouldStart:",_1b)){
return;
}
if(_progress===1){
_progress=0;
}
ACTUAL_FRAME_RATE=0;
_lastTime=new Date();
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_1b,sel_getUid("animationTimerDidFire:"),nil,YES);
}
}),new objj_method(sel_getUid("animationTimerDidFire:"),function(_1d,_1e,_1f){
with(_1d){
var _20=new Date(),_21=MIN(1,objj_msgSend(_1d,"currentProgress")+(_20-_lastTime)/(_duration*1000));
_lastTime=_20;
++ACTUAL_FRAME_RATE;
objj_msgSend(_1d,"setCurrentProgress:",_21);
if(_21===1){
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_1d);
}
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_22,_23){
with(_22){
if(!_timer){
return;
}
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidStop:"))){
objj_msgSend(_delegate,"animationDidStop:",_22);
}
}
}),new objj_method(sel_getUid("isAnimating"),function(_24,_25){
with(_24){
return _timer;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_26,_27,_28){
with(_26){
_progress=_28;
}
}),new objj_method(sel_getUid("currentProgress"),function(_29,_2a){
with(_29){
return _progress;
}
}),new objj_method(sel_getUid("currentValue"),function(_2b,_2c){
with(_2b){
var t=objj_msgSend(_2b,"currentProgress");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animation:valueForProgress:"))){
return objj_msgSend(_delegate,"animation:valueForProgress:",_2b,t);
}
var c1=[],c2=[];
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",1,c1);
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",2,c2);
return _2d(t,c1[0],c1[1],c2[0],c2[1],_duration);
}
})]);
var _2d=_2d=function(t,p1x,p1y,p2x,p2y,_2e){
var ax=0,bx=0,cx=0,ay=0,by=0,cy=0;
sampleCurveX=function(t){
return ((ax*t+bx)*t+cx)*t;
};
sampleCurveY=function(t){
return ((ay*t+by)*t+cy)*t;
};
sampleCurveDerivativeX=function(t){
return (3*ax*t+2*bx)*t+cx;
};
solveEpsilon=function(_2f){
return 1/(200*_2f);
};
solve=function(x,_30){
return sampleCurveY(solveCurveX(x,_30));
};
solveCurveX=function(x,_31){
var t0,t1,t2,x2,d2,i;
fabs=function(n){
if(n>=0){
return n;
}else{
return 0-n;
}
};
for(t2=x,i=0;i<8;i++){
x2=sampleCurveX(t2)-x;
if(fabs(x2)<_31){
return t2;
}
d2=sampleCurveDerivativeX(t2);
if(fabs(d2)<0.000001){
break;
}
t2=t2-x2/d2;
}
t0=0;
t1=1;
t2=x;
if(t2<t0){
return t0;
}
if(t2>t1){
return t1;
}
while(t0<t1){
x2=sampleCurveX(t2);
if(fabs(x2-x)<_31){
return t2;
}
if(x>x2){
t0=t2;
}else{
t1=t2;
}
t2=(t1-t0)*0.5+t0;
}
return t2;
};
cx=3*p1x;
bx=3*(p2x-p1x)-cx;
ax=1-cx-bx;
cy=3*p1y;
by=3*(p2y-p1y)-cy;
ay=1-cy-by;
return solve(t,solveEpsilon(_2e));
};
p;15;CPApplication.jI;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;20966;
var _1="CPMainCibFile",_2="Main cib file base name";
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPApplicationWillTerminateNotification="CPApplicationWillTerminateNotification";
CPTerminateNow=YES;
CPTerminateCancel=NO;
CPTerminateLater=-1;
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _3=objj_allocateClassPair(CPResponder,"CPApplication"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_finishedLaunching"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
_mainMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_mainMenu,"setAutoenablesItems:",NO);
var _7=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_8=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"N");
objj_msgSend(_8,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_8,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_8);
var _9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"O");
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_9,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_9);
var _a=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),nil);
objj_msgSend(_b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"S"));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),nil));
objj_msgSend(_b,"setSubmenu:",_a);
objj_msgSend(_mainMenu,"addItem:",_b);
var _c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_e,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_f,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_d,"addItem:",_e);
objj_msgSend(_d,"addItem:",_f);
objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"X")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"C")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"V"));
objj_msgSend(_c,"setSubmenu:",_d);
objj_msgSend(_c,"setHidden:",YES);
objj_msgSend(_mainMenu,"addItem:",_c);
objj_msgSend(_mainMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
return _5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_10,_11,_12){
with(_10){
if(_delegate==_12){
return;
}
var _13=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationWillFinishLaunchingNotification,_10);
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationDidFinishLaunchingNotification,_10);
}
_delegate=_12;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationWillFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationWillFinishLaunching:"),CPApplicationWillFinishLaunchingNotification,_10);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationDidFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationDidFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,_10);
}
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_19,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _1a=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_1a){
var _1b=objj_getClass(_1a);
if(_1b){
if(objj_msgSend(_documentController,"class")==_1b){
objj_msgSend(_16,"setDelegate:",_documentController);
}else{
objj_msgSend(_16,"setDelegate:",objj_msgSend(objj_msgSend(_1b,"alloc"),"init"));
}
}
}
var _1c=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_16);
var _1d=window.cpOpeningFilename&&window.cpOpeningFilename(),_1e=!!_documentController;
if(objj_msgSend(_1d,"length")){
_1e=!objj_msgSend(_16,"_openFile:",_1d);
}
if(_1e&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldOpenUntitledFile:"))){
_1e=objj_msgSend(_delegate,"applicationShouldOpenUntitledFile:",_16);
}
if(_1e){
objj_msgSend(_documentController,"newDocument:",_16);
}
objj_msgSend(_documentController,"_updateRecentDocumentsMenu");
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_16);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
_finishedLaunching=YES;
}
}),new objj_method(sel_getUid("terminate:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(objj_msgSend(CPDocumentController,"sharedDocumentController"),"closeAllDocumentsWithDelegate:didCloseAllSelector:contextInfo:",_1f,sel_getUid("_documentController:didCloseAll:context:"),nil);
}
}),new objj_method(sel_getUid("_documentController:didCloseAll:context:"),function(_22,_23,_24,_25,_26){
with(_22){
if(_25){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldTerminate:"))){
objj_msgSend(_22,"replyToApplicationShouldTerminate:",objj_msgSend(_delegate,"applicationShouldTerminate:",_22));
}else{
objj_msgSend(_22,"replyToApplicationShouldTerminate:",YES);
}
}
}
}),new objj_method(sel_getUid("replyToApplicationShouldTerminate:"),function(_27,_28,_29){
with(_27){
if(_29==CPTerminateNow){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPApplicationWillTerminateNotification,_27);
objj_msgSend(CPPlatform,"terminateApplication");
}
}
}),new objj_method(sel_getUid("activateIgnoringOtherApps:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(CPPlatform,"activateIgnoringOtherApps:",_2c);
}
}),new objj_method(sel_getUid("run"),function(_2d,_2e){
with(_2d){
objj_msgSend(_2d,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"runModalSession:",objj_msgSend(_2f,"beginModalSessionForWindow:",_31));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_32,_33,_34){
with(_32){
if(!_currentSession){
return;
}
_currentSession._state=_34;
_currentSession=_currentSession._previous;
objj_msgSend(_32,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_35,_36){
with(_35){
var _37=_eventListeners.length;
while(_37--){
if(_eventListeners[_37]._callback===_38){
_eventListeners.splice(_37,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_39,_3a){
with(_39){
objj_msgSend(_39,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_3b,_3c){
with(_3b){
objj_msgSend(_3b,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_3d,_3e,_3f){
with(_3d){
return _40(_3f,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_41,_42,_43){
with(_41){
_43._previous=_currentSession;
_currentSession=_43;
var _44=_43._window;
objj_msgSend(_44,"center");
objj_msgSend(_44,"makeKeyAndOrderFront:",_41);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_38,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_45,_46){
with(_45){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_47,_48,_49){
with(_47){
return objj_msgSend(objj_msgSend(_47,"keyWindow"),"performKeyEquivalent:",_49)||objj_msgSend(_mainMenu,"performKeyEquivalent:",_49);
}
}),new objj_method(sel_getUid("sendEvent:"),function(_4a,_4b,_4c){
with(_4a){
_currentEvent=_4c;
if(objj_msgSend(_4c,"_couldBeKeyEquivalent")&&objj_msgSend(_4a,"_handleKeyEquivalent:",_4c)){
objj_msgSend(objj_msgSend(objj_msgSend(_4c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_4c,"type"))){
_eventListeners.pop()._callback(_4c);
}
return;
}
objj_msgSend(objj_msgSend(_4c,"window"),"sendEvent:",_4c);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_4d,_4e,_4f){
with(_4d){
if(objj_msgSend(_delegate,"respondsToSelector:",_4f)){
objj_msgSend(_delegate,"performSelector:",_4f);
}else{
objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_4f);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_50,_51){
with(_50){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_52,_53){
with(_52){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_54,_55,_56){
with(_54){
return _windows[_56];
}
}),new objj_method(sel_getUid("windows"),function(_57,_58){
with(_57){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_59,_5a){
with(_59){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_5b,_5c,_5d){
with(_5b){
if(objj_msgSend(_5d,"_menuName")==="CPMainMenu"){
if(_mainMenu===_5d){
return;
}
_mainMenu=_5d;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
window.cpSetMainMenu(_mainMenu);
}
}else{
objj_msgSend(_5d,"_setMenuName:","CPMainMenu");
}
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_5e);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_64,_65,_66){
with(_64){
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_67,_68,_69,_6a){
with(_67){
if(!_69){
return NO;
}
if(objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPResponder")},"tryToPerform:with:",_69,_6a)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_69)){
objj_msgSend(_delegate,"performSelector:withObject:",_69,_6a);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_6b,_6c,_6d,_6e,_6f){
with(_6b){
var _70=objj_msgSend(_6b,"targetForAction:to:from:",_6d,_6e,_6f);
if(!_70){
return NO;
}
objj_msgSend(_70,"performSelector:withObject:",_6d,_6f);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_71,_72,_73,_74,_75){
with(_71){
if(!_73){
return nil;
}
if(_74){
return _74;
}
return objj_msgSend(_71,"targetForAction:",_73);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_76,_77,_78,_79){
with(_76){
var _7a=objj_msgSend(_78,"firstResponder"),_7b=YES;
while(_7a){
if(objj_msgSend(_7a,"respondsToSelector:",_79)){
return _7a;
}
if(_7a==_78){
_7b=NO;
}
_7a=objj_msgSend(_7a,"nextResponder");
}
if(_7b&&objj_msgSend(_78,"respondsToSelector:",_79)){
return _78;
}
var _7c=objj_msgSend(_78,"delegate");
if(objj_msgSend(_7c,"respondsToSelector:",_79)){
return _7c;
}
var _7d=objj_msgSend(_78,"windowController");
if(objj_msgSend(_7d,"respondsToSelector:",_79)){
return _7d;
}
var _7e=objj_msgSend(_7d,"document");
if(_7e!=_7c&&objj_msgSend(_7e,"respondsToSelector:",_79)){
return _7e;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_7f,_80,_81){
with(_7f){
if(!_81){
return nil;
}
var _82=objj_msgSend(_7f,"_targetForWindow:action:",objj_msgSend(_7f,"keyWindow"),_81);
if(_82){
return _82;
}
_82=objj_msgSend(_7f,"_targetForWindow:action:",objj_msgSend(_7f,"mainWindow"),_81);
if(_82){
return _82;
}
if(objj_msgSend(_7f,"respondsToSelector:",_81)){
return _7f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_81)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_81)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_83,_84,_85,_86,_87,_88,_89){
with(_83){
_eventListeners.push(_8a(_86,_85));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_8b,_8c,_8d,_8e,_8f,_90,_91,_92){
with(_8b){
_eventListeners.push(_8a(_8f,function(_93){
objj_msgSend(_8d,_8e,_93);
}));
}
}),new objj_method(sel_getUid("currentEvent"),function(_94,_95){
with(_94){
return _currentEvent;
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_96,_97,_98,_99,_9a,_9b,_9c){
with(_96){
var _9d=objj_msgSend(_98,"styleMask");
if(!(_9d&CPDocModalWindowMask)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Currently only CPDocModalWindowMask style mask is supported for attached sheets");
return;
}
objj_msgSend(_99,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_98,_9a,_9b,_9c);
}
}),new objj_method(sel_getUid("endSheet:returnCode:"),function(_9e,_9f,_a0,_a1){
with(_9e){
var _a2=objj_msgSend(_windows,"count");
while(--_a2>=0){
var _a3=objj_msgSend(_windows,"objectAtIndex:",_a2);
var _a4=_a3._sheetContext;
if(_a4!=nil&&_a4["sheet"]===_a0){
_a4["returnCode"]=_a1;
objj_msgSend(_a3,"_detachSheetWindow");
return;
}
}
}
}),new objj_method(sel_getUid("endSheet:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSend(_a5,"endSheet:returnCode:",_a7,0);
}
}),new objj_method(sel_getUid("arguments"),function(_a8,_a9){
with(_a8){
if(_fullArgsString!=window.location.hash){
objj_msgSend(_a8,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_aa,_ab,_ac){
with(_aa){
if(!_ac||_ac.length==0){
_args=[];
window.location.hash="#";
return;
}
if(objj_msgSend(_ac,"class")!=CPArray){
_ac=objj_msgSend(CPArray,"arrayWithObject:",_ac);
}
_args=_ac;
var _ad=objj_msgSend(_args,"copy");
for(var i=0,_ae=_ad.length;i<_ae;i++){
_ad[i]=encodeURIComponent(_ad[i]);
}
var _af=objj_msgSend(_ad,"componentsJoinedByString:","/");
window.location.hash="#"+_af;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_b0,_b1){
with(_b0){
_fullArgsString=window.location.hash;
var _b2=_fullArgsString.replace("#","").split("/").slice(0);
for(var i=0,_b3=_b2.length;i<_b3;i++){
_b2[i]=decodeURIComponent(_b2[i]);
}
_args=_b2;
}
}),new objj_method(sel_getUid("namedArguments"),function(_b4,_b5){
with(_b4){
return _namedArgs;
}
}),new objj_method(sel_getUid("_openFile:"),function(_b6,_b7,_b8){
with(_b6){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("application:openFile:"))){
return objj_msgSend(_delegate,"application:openFile:",_b6,_b8);
}else{
return objj_msgSend(_documentController,"openDocumentWithContentsOfURL:display:error:",_b8,YES,NULL);
}
}
}),new objj_method(sel_getUid("_didResignActive"),function(_b9,_ba){
with(_b9){
if(_b9._activeMenu){
objj_msgSend(_b9._activeMenu,"cancelTracking");
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedApplication"),function(_bb,_bc){
with(_bb){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _40=function(_bd,_be){
return {_window:_bd,_state:CPRunContinuesResponse,_previous:nil};
};
var _8a=function(_bf,_c0){
return {_mask:_bf,_callback:_c0};
};
var _38=function(_c1){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_38,CPAnyEventMask,nil,0,NO);
var _c2=objj_msgSend(_c1,"window"),_c3=CPApp._currentSession;
if(_c2==_c3._window||objj_msgSend(_c2,"worksWhenModal")){
objj_msgSend(_c2,"sendEvent:",_c1);
}
};
CPApplicationMain=function(_c4,_c5){
var _c6=objj_msgSend(CPBundle,"mainBundle"),_c7=objj_msgSend(_c6,"principalClass");
if(!_c7){
_c7=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_c7,"sharedApplication");
if(!_c4){
var _c4=objj_msgSend(CPApp,"arguments");
if(objj_msgSend(_c4,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
}
if(!_c5){
var _c8=window.location.search.substring(1).split("&");
_c5=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_c8.length;i++){
var _c9=_c8[i].indexOf("=");
if(_c9==-1){
objj_msgSend(_c5,"setObject:forKey:","",_c8[i]);
}else{
objj_msgSend(_c5,"setObject:forKey:",_c8[i].substring(_c9+1),_c8[i].substring(0,_c9));
}
}
}
CPApp._args=_c4;
CPApp._namedArgs=_c5;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _ca=nil;
var _3=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("actions"),function(_cb,_cc){
with(_cb){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_cd,_ce){
with(_cd){
if(!_ca){
_ca=objj_msgSend(_cd,"actions");
}
while(_ca.length){
var _cf=_ca.shift();
if(objj_msgSend(_cd,_cf)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_d0,_d1){
with(_d0){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_d2,_d3){
with(_d2){
var _d4=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:","Aristo.blend"));
objj_msgSend(_d4,"loadWithDelegate:",_d2);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(_d5,_d6,_d7){
with(_d5){
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo"));
objj_msgSend(_d5,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(_d8,_d9){
with(_d8){
var _da=objj_msgSend(CPBundle,"mainBundle"),_db=objj_msgSend(_da,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_da,"objectForInfoDictionaryKey:",_2);
if(_db){
objj_msgSend(_da,"loadCibFile:externalNameTable:loadDelegate:",_db,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),_d8);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_dc,_dd,_de){
with(_dc){
objj_msgSend(_dc,"performActions");
}
})]);
p;14;CPBezierPath.jI;26;AppKit/CPGraphicsContext.jI;21;Foundation/CPObject.jc;4365;
var _1=1;
var _2=objj_allocateClassPair(CPObject,"CPBezierPath"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_path"),new objj_ivar("_lineWidth")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init")){
_path=CGPathCreateMutable();
_lineWidth=objj_msgSend(objj_msgSend(_4,"class"),"defaultLineWidth");
}
return _4;
}
}),new objj_method(sel_getUid("moveToPoint:"),function(_6,_7,_8){
with(_6){
CGPathMoveToPoint(_path,nil,_8.x,_8.y);
}
}),new objj_method(sel_getUid("lineToPoint:"),function(_9,_a,_b){
with(_9){
CGPathAddLineToPoint(_path,nil,_b.x,_b.y);
}
}),new objj_method(sel_getUid("curveToPoint:controlPoint1:controlPoint2:"),function(_c,_d,_e,_f,_10){
with(_c){
CGPathAddCurveToPoint(_path,nil,_f.x,_f.y,_10.x,_10.y,_e.x,_e.y);
}
}),new objj_method(sel_getUid("closePath"),function(_11,_12){
with(_11){
CGPathCloseSubpath(_path);
}
}),new objj_method(sel_getUid("stroke"),function(_13,_14){
with(_13){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(ctx);
CGContextAddPath(ctx,_path);
CGContextSetLineWidth(ctx,objj_msgSend(_13,"lineWidth"));
CGContextClosePath(ctx);
CGContextStrokePath(ctx);
}
}),new objj_method(sel_getUid("fill"),function(_15,_16){
with(_15){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(ctx);
CGContextAddPath(ctx,_path);
CGContextSetLineWidth(ctx,objj_msgSend(_15,"lineWidth"));
CGContextClosePath(ctx);
CGContextFillPath(ctx);
}
}),new objj_method(sel_getUid("lineWidth"),function(_17,_18){
with(_17){
return _lineWidth;
}
}),new objj_method(sel_getUid("setLineWidth:"),function(_19,_1a,_1b){
with(_19){
_lineWidth=_1b;
}
}),new objj_method(sel_getUid("elementCount"),function(_1c,_1d){
with(_1c){
return _path.count;
}
}),new objj_method(sel_getUid("isEmpty"),function(_1e,_1f){
with(_1e){
return CGPathIsEmpty(_path);
}
}),new objj_method(sel_getUid("currentPoint"),function(_20,_21){
with(_20){
return CGPathGetCurrentPoint(_path);
}
}),new objj_method(sel_getUid("appendBezierPathWithPoints:count:"),function(_22,_23,_24,_25){
with(_22){
CGPathAddLines(_path,nil,_24,_25);
}
}),new objj_method(sel_getUid("appendBezierPathWithRect:"),function(_26,_27,_28){
with(_26){
CGPathAddRect(_path,nil,_28);
}
}),new objj_method(sel_getUid("appendBezierPathWithOvalInRect:"),function(_29,_2a,_2b){
with(_29){
CGPathAddPath(_path,nil,CGPathWithEllipseInRect(_2b));
}
}),new objj_method(sel_getUid("appendBezierPathWithRoundedRect:xRadius:yRadius:"),function(_2c,_2d,_2e,_2f,_30){
with(_2c){
CGPathAddPath(_path,nil,CGPathWithRoundedRectangleInRect(_2e,_2f,_30,YES,YES,YES,YES));
}
}),new objj_method(sel_getUid("appendBezierPath:"),function(_31,_32,_33){
with(_31){
CGPathAddPath(_path,nil,_33._path);
}
}),new objj_method(sel_getUid("removeAllPoints"),function(_34,_35){
with(_34){
_path=CGPathCreateMutable();
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bezierPath"),function(_36,_37){
with(_36){
return objj_msgSend(objj_msgSend(_36,"alloc"),"init");
}
}),new objj_method(sel_getUid("bezierPathWithOvalInRect:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(_38,"bezierPath");
objj_msgSend(_3b,"appendBezierPathWithOvalInRect:",_3a);
return _3b;
}
}),new objj_method(sel_getUid("bezierPathWithRect:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_3c,"bezierPath");
objj_msgSend(_3f,"appendBezierPathWithRect:",_3e);
return _3f;
}
}),new objj_method(sel_getUid("defaultLineWidth"),function(_40,_41){
with(_40){
return _1;
}
}),new objj_method(sel_getUid("setDefaultLineWidth:"),function(_42,_43,_44){
with(_42){
_1=_44;
}
}),new objj_method(sel_getUid("fillRect:"),function(_45,_46,_47){
with(_45){
objj_msgSend(objj_msgSend(_45,"bezierPathWithRect:",_47),"fill");
}
}),new objj_method(sel_getUid("strokeRect:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(objj_msgSend(_48,"bezierPathWithRect:",_4a),"stroke");
}
}),new objj_method(sel_getUid("strokeLineFromPoint:toPoint:"),function(_4b,_4c,_4d,_4e){
with(_4b){
var _4f=objj_msgSend(_4b,"bezierPath");
objj_msgSend(_4f,"moveToPoint:",_4d);
objj_msgSend(_4f,"lineToPoint:",_4e);
objj_msgSend(_4f,"stroke");
}
})]);
p;7;CPBox.ji;8;CPView.jc;5852;
CPNoBorder=0;
CPLineBorder=1;
CPBezelBorder=2;
CPGrooveBorder=3;
var _1=objj_allocateClassPair(CPView,"CPBox"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_borderType"),new objj_ivar("_borderColor"),new objj_ivar("_fillColor"),new objj_ivar("_cornerRadius"),new objj_ivar("_borderWidth"),new objj_ivar("_contentMargin"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_fillColor=objj_msgSend(CPColor,"clearColor");
_borderColor=objj_msgSend(CPColor,"blackColor");
_borderWidth=1;
_contentMargin=CGSizeMake(0,0);
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
}
return _3;
}
}),new objj_method(sel_getUid("borderRect"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"bounds");
}
}),new objj_method(sel_getUid("borderType"),function(_8,_9){
with(_8){
return _borderType;
}
}),new objj_method(sel_getUid("setBorderType:"),function(_a,_b,_c){
with(_a){
_borderType=_c;
objj_msgSend(_a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderColor"),function(_d,_e){
with(_d){
return _borderColor;
}
}),new objj_method(sel_getUid("setBorderColor:"),function(_f,_10,_11){
with(_f){
if(objj_msgSend(_11,"isEqual:",_borderColor)){
return;
}
_borderColor=_11;
objj_msgSend(_f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderWidth"),function(_12,_13){
with(_12){
return _borderWidth;
}
}),new objj_method(sel_getUid("setBorderWidth:"),function(_14,_15,_16){
with(_14){
if(_16===_borderWidth){
return;
}
_borderWidth=_16;
objj_msgSend(_14,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("cornerRadius"),function(_17,_18){
with(_17){
return _cornerRadius;
}
}),new objj_method(sel_getUid("setCornerRadius:"),function(_19,_1a,_1b){
with(_19){
if(_1b===_cornerRadius){
return;
}
_cornerRadius=_1b;
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("fillColor"),function(_1c,_1d){
with(_1c){
return _fillColor;
}
}),new objj_method(sel_getUid("setFillColor:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_20,"isEqual:",_fillColor)){
return;
}
_fillColor=_20;
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("contentView"),function(_21,_22){
with(_21){
return _contentView;
}
}),new objj_method(sel_getUid("setContentView:"),function(_23,_24,_25){
with(_23){
if(_25===_contentView){
return;
}
objj_msgSend(_25,"setFrame:",CGRectInset(objj_msgSend(_23,"bounds"),_contentMargin.width+_borderWidth,_contentMargin.height+_borderWidth));
objj_msgSend(_23,"replaceSubview:with:",_contentView,_25);
_contentView=_25;
}
}),new objj_method(sel_getUid("contentViewMargins"),function(_26,_27){
with(_26){
return _contentMargin;
}
}),new objj_method(sel_getUid("setContentViewMargins:"),function(_28,_29,_2a){
with(_28){
if(_2a.width<0||_2a.height<0){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"Margins must be positive");
}
_contentMargin=CGSizeMakeCopy(_2a);
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameFromContentFrame:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"setFrame:",CGRectInset(_2d,-(_contentMargin.width+_borderWidth),-(_contentMargin.height+_borderWidth)));
objj_msgSend(_2b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(_contentView,"frame");
objj_msgSend(_2e,"setFrameSize:",CGSizeMake(_30.size.width+_contentMargin.width*2,_30.size.height+_contentMargin.height*2));
objj_msgSend(_contentView,"setFrameOrigin:",CGPointMake(_contentMargin.width,_contentMargin.height));
}
}),new objj_method(sel_getUid("drawRect:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"bounds"),_35=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_36=_borderWidth/2,_37=CGRectMake(_34.origin.x+_36,_34.origin.y+_36,_34.size.width-_borderWidth,_34.size.height-_borderWidth),_38=CGRectMake(_34.origin.x+_36,_34.origin.y+_36,_34.size.width-_borderWidth,_34.size.height-_borderWidth);
CGContextSetFillColor(_35,objj_msgSend(_31,"fillColor"));
CGContextSetStrokeColor(_35,objj_msgSend(_31,"borderColor"));
CGContextSetLineWidth(_35,_borderWidth);
switch(_borderType){
case CPLineBorder:
CGContextFillRoundedRectangleInRect(_35,_38,_cornerRadius,YES,YES,YES,YES);
CGContextStrokeRoundedRectangleInRect(_35,_37,_cornerRadius,YES,YES,YES,YES);
break;
case CPBezelBorder:
CGContextFillRoundedRectangleInRect(_35,_38,_cornerRadius,YES,YES,YES,YES);
CGContextSetStrokeColor(_35,objj_msgSend(CPColor,"colorWithWhite:alpha:",190/255,1));
CGContextBeginPath(_35);
CGContextMoveToPoint(_35,_37.origin.x,_37.origin.y);
CGContextAddLineToPoint(_35,CGRectGetMinX(_37),CGRectGetMaxY(_37)),CGContextAddLineToPoint(_35,CGRectGetMaxX(_37),CGRectGetMaxY(_37)),CGContextAddLineToPoint(_35,CGRectGetMaxX(_37),CGRectGetMinY(_37)),CGContextStrokePath(_35);
CGContextSetStrokeColor(_35,objj_msgSend(CPColor,"colorWithWhite:alpha:",142/255,1));
CGContextBeginPath(_35);
CGContextMoveToPoint(_35,_34.origin.x,_37.origin.y);
CGContextAddLineToPoint(_35,CGRectGetMaxX(_34),CGRectGetMinY(_37));
CGContextStrokePath(_35);
break;
default:
break;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("boxEnclosingView:"),function(_39,_3a,_3b){
with(_39){
var box=objj_msgSend(objj_msgSend(_39,"alloc"),"initWithFrame:",CGRectMakeZero()),_3c=objj_msgSend(_3b,"superview");
objj_msgSend(box,"setFrameFromContentFrame:",objj_msgSend(_3b,"frame"));
objj_msgSend(_3c,"replaceSubview:with:",_3b,box);
objj_msgSend(box,"setContentView:",_3b);
return box;
}
})]);
p;10;CPButton.ji;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;15891;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
CPNoImage=0;
CPImageOnly=1;
CPImageLeft=2;
CPImageRight=3;
CPImageBelow=4;
CPImageAbove=5;
CPImageOverlaps=6;
CPOnState=1;
CPOffState=0;
CPMixedState=-1;
CPRoundedBezelStyle=1;
CPRegularSquareBezelStyle=2;
CPThickSquareBezelStyle=3;
CPThickerSquareBezelStyle=4;
CPDisclosureBezelStyle=5;
CPShadowlessSquareBezelStyle=6;
CPCircularBezelStyle=7;
CPTexturedSquareBezelStyle=8;
CPHelpButtonBezelStyle=9;
CPSmallSquareBezelStyle=10;
CPTexturedRoundedBezelStyle=11;
CPRoundRectBezelStyle=12;
CPRecessedBezelStyle=13;
CPRoundedDisclosureBezelStyle=14;
CPHUDBezelStyle=-1;
CPMomentaryLightButton=0;
CPPushOnPushOffButton=1;
CPToggleButton=2;
CPSwitchButton=3;
CPRadioButton=4;
CPMomentaryChangeButton=5;
CPOnOffButton=6;
CPMomentaryPushInButton=7;
CPMomentaryPushButton=0;
CPMomentaryLight=7;
CPNoButtonMask=0;
CPContentsButtonMask=1;
CPPushInButtonMask=2;
CPGrayButtonMask=4;
CPBackgroundButtonMask=8;
CPNoCellMask=CPNoButtonMask;
CPContentsCellMask=CPContentsButtonMask;
CPPushInCellMask=CPPushInButtonMask;
CPChangeGrayCellMask=CPGrayButtonMask;
CPChangeBackgroundCellMask=CPBackgroundButtonMask;
CPButtonStateMixed=CPThemeState("mixed");
var _1=objj_allocateClassPair(CPControl,"CPButton"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_allowsMixedState"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_showsStateBy"),new objj_ivar("_highlightsBy"),new objj_ivar("_imageDimsWhenDisabled"),new objj_ivar("_bezelStyle"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPScaleNone,"image-scaling");
_controlSize=CPRegularControlSize;
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_6,_7){
with(_6){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_8,_9,_a){
with(_8){
_a=!!_a;
if(_allowsMixedState===_a){
return;
}
_allowsMixedState=_a;
if(!_allowsMixedState){
objj_msgSend(_8,"unsetThemeState:",CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_b,_c,_d){
with(_b){
if(!_d||_d===""||(objj_msgSend(_d,"intValue")===0)){
_d=CPOffState;
}else{
if(!objj_msgSend(_d,"isKindOfClass:",objj_msgSend(CPNumber,"class"))){
_d=CPOnState;
}else{
if(_d>CPOnState){
_d=CPOnState;
}else{
if(_d<CPOffState){
if(objj_msgSend(_b,"allowsMixedState")){
_d=CPMixedState;
}else{
_d=CPOnState;
}
}
}
}
}
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPControl")},"setObjectValue:",_d);
switch(objj_msgSend(_b,"objectValue")){
case CPMixedState:
objj_msgSend(_b,"unsetThemeState:",CPThemeStateSelected);
objj_msgSend(_b,"setThemeState:",CPButtonStateMixed);
break;
case CPOnState:
objj_msgSend(_b,"unsetThemeState:",CPButtonStateMixed);
objj_msgSend(_b,"setThemeState:",CPThemeStateSelected);
break;
case CPOffState:
objj_msgSend(_b,"unsetThemeState:",CPThemeStateSelected|CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("nextState"),function(_e,_f){
with(_e){
if(objj_msgSend(_e,"allowsMixedState")){
var _10=objj_msgSend(_e,"state");
return _10-((_10===-1)?-2:1);
}
return 1-objj_msgSend(_e,"state");
}
}),new objj_method(sel_getUid("setNextState"),function(_11,_12){
with(_11){
objj_msgSend(_11,"setState:",objj_msgSend(_11,"nextState"));
}
}),new objj_method(sel_getUid("setState:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"setIntValue:",_15);
}
}),new objj_method(sel_getUid("state"),function(_16,_17){
with(_16){
return objj_msgSend(_16,"intValue");
}
}),new objj_method(sel_getUid("setTitle:"),function(_18,_19,_1a){
with(_18){
if(_title===_1a){
return;
}
_title=_1a;
objj_msgSend(_18,"setNeedsLayout");
objj_msgSend(_18,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("title"),function(_1b,_1c){
with(_1b){
return _title;
}
}),new objj_method(sel_getUid("setAlternateTitle:"),function(_1d,_1e,_1f){
with(_1d){
if(_alternateTitle===_1f){
return;
}
_alternateTitle=_1f;
objj_msgSend(_1d,"setNeedsLayout");
objj_msgSend(_1d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateTitle"),function(_20,_21){
with(_20){
return _alternateTitle;
}
}),new objj_method(sel_getUid("setImage:"),function(_22,_23,_24){
with(_22){
if(_image===_24){
return;
}
_image=_24;
objj_msgSend(_22,"setNeedsLayout");
objj_msgSend(_22,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("image"),function(_25,_26){
with(_25){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_27,_28,_29){
with(_27){
if(_alternateImage===_29){
return;
}
_alternateImage=_29;
objj_msgSend(_27,"setNeedsLayout");
objj_msgSend(_27,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateImage"),function(_2a,_2b){
with(_2a){
return _alternateImage;
}
}),new objj_method(sel_getUid("setShowsStateBy:"),function(_2c,_2d,_2e){
with(_2c){
if(_showsStateBy===_2e){
return;
}
_showsStateBy=_2e;
objj_msgSend(_2c,"setNeedsDisplay:",YES);
objj_msgSend(_2c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("showsStateBy"),function(_2f,_30){
with(_2f){
return _showsStateBy;
}
}),new objj_method(sel_getUid("setHighlightsBy:"),function(_31,_32,_33){
with(_31){
if(_highlightsBy===_33){
return;
}
_highlightsBy=_33;
if(objj_msgSend(_31,"hasThemeState:",CPThemeStateHighlighted)){
objj_msgSend(_31,"setNeedsDisplay:",YES);
objj_msgSend(_31,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("setButtonType:"),function(_34,_35,_36){
with(_34){
switch(_36){
case CPMomentaryLightButton:
objj_msgSend(_34,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryPushInButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryChangeButton:
objj_msgSend(_34,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPPushOnPushOffButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPOnOffButton:
objj_msgSend(_34,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPToggleButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPContentsCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPContentsCellMask);
break;
case CPSwitchButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
case CPRadioButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown button type.");
}
objj_msgSend(_34,"setImageDimsWhenDisabled:",YES);
}
}),new objj_method(sel_getUid("setImageDimsWhenDisabled:"),function(_37,_38,_39){
with(_37){
_39=!!_39;
if(_imageDimsWhenDisabled===_39){
return;
}
_imageDimsWhenDisabled=_39;
if(_imageDimsWhenDisabled){
objj_msgSend(_37,"setNeedsDisplay:",YES);
objj_msgSend(_37,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("imageDimsWhenDisabled"),function(_3a,_3b){
with(_3a){
return _imageDimsWhenDisabled;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"highlight:",YES);
return objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPControl")},"startTrackingAt:",_3e);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_3f,_40,_41,_42,_43){
with(_3f){
objj_msgSend(_3f,"highlight:",NO);
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPControl")},"stopTracking:at:mouseIsUp:",_41,_42,_43);
if(_43&&CGRectContainsPoint(objj_msgSend(_3f,"bounds"),_42)){
objj_msgSend(_3f,"setNextState");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_44,_45,_46){
with(_44){
var _47=objj_msgSend(_44,"currentValueForThemeAttribute:","content-inset");
if(((_47).top===0&&(_47).right===0&&(_47).bottom===0&&(_47).left===0)){
return _46;
}
_46.origin.x+=_47.left;
_46.origin.y+=_47.top;
_46.size.width-=_47.left+_47.right;
_46.size.height-=_47.top+_47.bottom;
return _46;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_48,_49,_4a){
with(_48){
if(!objj_msgSend(_48,"isBordered")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4b=objj_msgSend(_48,"currentValueForThemeAttribute:","bezel-inset");
if(((_4b).top===0&&(_4b).right===0&&(_4b).bottom===0&&(_4b).left===0)){
return _4a;
}
_4a.origin.x+=_4b.left;
_4a.origin.y+=_4b.top;
_4a.size.width-=_4b.left+_4b.right;
_4a.size.height-=_4b.top+_4b.bottom;
return _4a;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend((objj_msgSend(_4c,"title")||" "),"sizeWithFont:",objj_msgSend(_4c,"currentValueForThemeAttribute:","font")),_4f=objj_msgSend(_4c,"currentValueForThemeAttribute:","content-inset"),_50=objj_msgSend(_4c,"currentValueForThemeAttribute:","min-size"),_51=objj_msgSend(_4c,"currentValueForThemeAttribute:","max-size");
_4e.width=MAX(_4e.width+_4f.left+_4f.right,_50.width);
_4e.height=MAX(_4e.height+_4f.top+_4f.bottom,_50.height);
if(_51.width>=0){
_4e.width=MIN(_4e.width,_51.width);
}
if(_51.height>=0){
_4e.height=MIN(_4e.height,_51.height);
}
objj_msgSend(_4c,"setFrameSize:",_4e);
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_52,_53,_54){
with(_52){
if(_54==="bezel-view"){
return objj_msgSend(_52,"bezelRectForBounds:",objj_msgSend(_52,"bounds"));
}else{
if(_54==="content-view"){
return objj_msgSend(_52,"contentRectForBounds:",objj_msgSend(_52,"bounds"));
}
}
return objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_54);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_55,_56,_57){
with(_55){
if(_57==="bezel-view"){
var _58=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_58,"setHitTests:",NO);
return _58;
}else{
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_57);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_59,_5a){
with(_59){
var _5b=objj_msgSend(_59,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_5b){
objj_msgSend(_5b,"setBackgroundColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","bezel-color"));
}
var _5c=objj_msgSend(_59,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_5c){
objj_msgSend(_5c,"setText:",(objj_msgSend(_59,"hasThemeState:",CPThemeStateHighlighted)&&_alternateTitle)?_alternateTitle:_title);
objj_msgSend(_5c,"setImage:",(objj_msgSend(_59,"hasThemeState:",CPThemeStateHighlighted)&&_alternateImage)?_alternateImage:_image);
objj_msgSend(_5c,"setFont:",objj_msgSend(_59,"currentValueForThemeAttribute:","font"));
objj_msgSend(_5c,"setTextColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_5c,"setAlignment:",objj_msgSend(_59,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_5c,"setVerticalAlignment:",objj_msgSend(_59,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_5c,"setLineBreakMode:",objj_msgSend(_59,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_5c,"setTextShadowColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_5c,"setTextShadowOffset:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-shadow-offset"));
objj_msgSend(_5c,"setImagePosition:",objj_msgSend(_59,"currentValueForThemeAttribute:","image-position"));
objj_msgSend(_5c,"setImageScaling:",objj_msgSend(_59,"currentValueForThemeAttribute:","image-scaling"));
}
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(_5d,_5e,_5f){
with(_5d){
if(_5f){
objj_msgSend(_5d,"setThemeState:",CPThemeStateDefault);
}else{
objj_msgSend(_5d,"unsetThemeState:",CPThemeStateDefault);
}
}
}),new objj_method(sel_getUid("setBordered:"),function(_60,_61,_62){
with(_60){
if(_62){
objj_msgSend(_60,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_60,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_63,_64){
with(_63){
return objj_msgSend(_63,"hasThemeState:",CPThemeStateBordered);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("buttonWithTitle:"),function(_65,_66,_67){
with(_65){
return objj_msgSend(_65,"buttonWithTitle:theme:",_67,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("buttonWithTitle:theme:"),function(_68,_69,_6a,_6b){
with(_68){
var _6c=objj_msgSend(objj_msgSend(_68,"alloc"),"init");
objj_msgSend(_6c,"setTheme:",_6b);
objj_msgSend(_6c,"setTitle:",_6a);
objj_msgSend(_6c,"sizeToFit");
return _6c;
}
}),new objj_method(sel_getUid("themeClass"),function(_6d,_6e){
with(_6d){
return "button";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_6f,_70){
with(_6f){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setBezelStyle:"),function(_71,_72,_73){
with(_71){
}
}),new objj_method(sel_getUid("bezelStyle"),function(_74,_75){
with(_74){
}
})]);
var _76="CPButtonImageKey",_77="CPButtonAlternateImageKey",_78="CPButtonTitleKey",_79="CPButtonAlternateTitleKey",_7a="CPButtonIsBorderedKey";
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
_7b=objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPControl")},"initWithCoder:",_7d);
if(_7b){
_controlSize=CPRegularControlSize;
objj_msgSend(_7b,"setImage:",objj_msgSend(_7d,"decodeObjectForKey:",_76));
objj_msgSend(_7b,"setAlternateImage:",objj_msgSend(_7d,"decodeObjectForKey:",_77));
objj_msgSend(_7b,"setTitle:",objj_msgSend(_7d,"decodeObjectForKey:",_78));
objj_msgSend(_7b,"setAlternateTitle:",objj_msgSend(_7d,"decodeObjectForKey:",_79));
objj_msgSend(_7b,"setNeedsLayout");
objj_msgSend(_7b,"setNeedsDisplay:",YES);
}
return _7b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7e,_7f,_80){
with(_7e){
objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_80);
objj_msgSend(_80,"encodeObject:forKey:",_image,_76);
objj_msgSend(_80,"encodeObject:forKey:",_alternateImage,_77);
objj_msgSend(_80,"encodeObject:forKey:",_title,_78);
objj_msgSend(_80,"encodeObject:forKey:",_alternateTitle,_79);
}
})]);
i;12;CPCheckBox.ji;9;CPRadio.jp;13;CPButtonBar.jI;15;AppKit/CPView.jc;1693;
var _1=objj_allocateClassPair(CPControl,"CPButtonBar"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_3,_4,_5){
with(_3){
if(_5==="bezel-view"){
return objj_msgSend(_3,"bounds");
}
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_5);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6,_7,_8){
with(_6){
if(_8==="bezel-view"){
var _9=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_9,"setHitTests:",NO);
return _9;
}
return objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_8);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_a,_b){
with(_a){
var _c=objj_msgSend(_a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"");
if(_c){
objj_msgSend(_c,"setBackgroundColor:",objj_msgSend(_a,"currentValueForThemeAttribute:","bezel-color"));
}
}
}),new objj_method(sel_getUid("addSubview:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPControl")},"addSubview:",_f);
objj_msgSend(_f,"setAutoresizingMask:",CPViewMinXMargin);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_10,_11){
with(_10){
return "button-bar";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_12,_13){
with(_12){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil],["bezel-color"]);
}
})]);
p;12;CPCheckBox.ji;10;CPButton.jc;1040;
var _1=objj_allocateClassPair(CPButton,"CPCheckBox"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("checkBoxWithTitle:theme:"),function(_6,_7,_8,_9){
with(_6){
return objj_msgSend(_6,"buttonWithTitle:theme:",_8,_9);
}
}),new objj_method(sel_getUid("checkBoxWithTitle:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"buttonWithTitle:",_c);
}
}),new objj_method(sel_getUid("themeClass"),function(_d,_e){
with(_d){
return "check-box";
}
})]);
p;12;CPClipView.ji;8;CPView.jc;4242;
var _1=objj_allocateClassPair(CPView,"CPClipView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_documentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setDocumentView:"),function(_3,_4,_5){
with(_3){
if(_documentView==_5){
return;
}
var _6=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_documentView){
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewBoundsDidChangeNotification,_documentView);
objj_msgSend(_documentView,"removeFromSuperview");
}
_documentView=_5;
if(_documentView){
objj_msgSend(_3,"addSubview:",_documentView);
objj_msgSend(_documentView,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_documentView,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewFrameChanged:"),CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewBoundsChanged:"),CPViewBoundsDidChangeNotification,_documentView);
}
}
}),new objj_method(sel_getUid("documentView"),function(_7,_8){
with(_7){
return _documentView;
}
}),new objj_method(sel_getUid("constrainScrollPoint:"),function(_9,_a,_b){
with(_9){
if(!_documentView){
return {x:0,y:0};
}
var _c=objj_msgSend(_documentView,"frame");
_b.x=MAX(0,MIN(_b.x,MAX((_c.size.width)-(_bounds.size.width),0)));
_b.y=MAX(0,MIN(_b.y,MAX((_c.size.height)-(_bounds.size.height),0)));
return _b;
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_d,_e,_f){
with(_d){
if((_bounds.origin.x==_f.x&&_bounds.origin.y==_f.y)){
return;
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"setBoundsOrigin:",_f);
var _10=objj_msgSend(_d,"superview");
if(objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_10,"reflectScrolledClipView:",_d);
}
}
}),new objj_method(sel_getUid("scrollToPoint:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setBoundsOrigin:",objj_msgSend(_11,"constrainScrollPoint:",_13));
}
}),new objj_method(sel_getUid("viewBoundsChanged:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("viewFrameChanged:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPView")},"resizeSubviewsWithOldSize:",_1c);
objj_msgSend(_1a,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("_constrainScrollPoint"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"bounds").origin;
objj_msgSend(_1d,"scrollToPoint:",_1f);
if(!CGPointEqualToPoint(_1f,objj_msgSend(_1d,"bounds").origin)){
return;
}
var _20=objj_msgSend(_1d,"superview");
if(objj_msgSend(_20,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_20,"reflectScrolledClipView:",_1d);
}
}
}),new objj_method(sel_getUid("autoscroll:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(_21,"bounds"),_25=objj_msgSend(_21,"convertPoint:fromView:",objj_msgSend(_23,"locationInWindow"),nil);
if(CPRectContainsPoint(_24,_25)){
return NO;
}
var _26=CGRectMakeZero();
_26.origin=_25;
_26.size=CPSizeMake(10,10);
return objj_msgSend(_documentView,"scrollRectToVisible:",_26);
}
})]);
var _27="CPScrollViewDocumentView";
var _1=objj_getClass("CPClipView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPClipView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_28,_29,_2a){
with(_28){
if(_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPView")},"initWithCoder:",_2a)){
objj_msgSend(_28,"setDocumentView:",objj_msgSend(_2a,"decodeObjectForKey:",_27));
}
return _28;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPView")},"encodeWithCoder:",_2d);
objj_msgSend(_2d,"encodeObject:forKey:",_documentView,_27);
}
})]);
p;18;CPCollectionView.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;8;CPView.ji;22;CPCollectionViewItem.jc;12968;
var _1=objj_allocateClassPair(CPView,"CPCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_items"),new objj_ivar("_itemData"),new objj_ivar("_itemPrototype"),new objj_ivar("_itemForDragging"),new objj_ivar("_cachedItems"),new objj_ivar("_maxNumberOfRows"),new objj_ivar("_maxNumberOfColumns"),new objj_ivar("_minItemSize"),new objj_ivar("_maxItemSize"),new objj_ivar("_backgroundColors"),new objj_ivar("_tileWidth"),new objj_ivar("_isSelectable"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_selectionIndexes"),new objj_ivar("_itemSize"),new objj_ivar("_horizontalMargin"),new objj_ivar("_verticalMargin"),new objj_ivar("_numberOfRows"),new objj_ivar("_numberOfColumns"),new objj_ivar("_delegate"),new objj_ivar("_mouseDownEvent")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=CGSizeMakeZero();
_maxItemSize=CGSizeMakeZero();
objj_msgSend(_3,"setBackgroundColors:",nil);
_verticalMargin=5;
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
_isSelectable=YES;
}
return _3;
}
}),new objj_method(sel_getUid("setItemPrototype:"),function(_6,_7,_8){
with(_6){
_cachedItems=[];
_itemData=nil;
_itemForDragging=nil;
_itemPrototype=_8;
objj_msgSend(_6,"reloadContent");
}
}),new objj_method(sel_getUid("itemPrototype"),function(_9,_a){
with(_9){
return _itemPrototype;
}
}),new objj_method(sel_getUid("newItemForRepresentedObject:"),function(_b,_c,_d){
with(_b){
var _e=nil;
if(_cachedItems.length){
_e=_cachedItems.pop();
}else{
if(!_itemData){
if(_itemPrototype){
_itemData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_itemPrototype);
}
}
_e=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_itemData);
}
objj_msgSend(_e,"setRepresentedObject:",_d);
objj_msgSend(objj_msgSend(_e,"view"),"setFrameSize:",_itemSize);
return _e;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_f,_10){
with(_f){
return YES;
}
}),new objj_method(sel_getUid("isFirstResponder"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"window"),"firstResponder")===_11;
}
}),new objj_method(sel_getUid("setContent:"),function(_13,_14,_15){
with(_13){
if(_content==_15){
return;
}
_content=_15;
objj_msgSend(_13,"reloadContent");
}
}),new objj_method(sel_getUid("content"),function(_16,_17){
with(_16){
return _content;
}
}),new objj_method(sel_getUid("items"),function(_18,_19){
with(_18){
return _items;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_1a,_1b,_1c){
with(_1a){
if(_isSelectable==_1c){
return;
}
_isSelectable=_1c;
if(!_isSelectable){
var _1d=CPNotFound;
while((_1d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_1d))!=CPNotFound){
objj_msgSend(_items[_1d],"setSelected:",NO);
}
}
}
}),new objj_method(sel_getUid("isSelectable"),function(_1e,_1f){
with(_1e){
return _isSelectable;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_20,_21,_22){
with(_20){
_allowsEmptySelection=_22;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_23,_24){
with(_23){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_25,_26,_27){
with(_25){
_allowsMultipleSelection=_27;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_28,_29){
with(_28){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_2a,_2b,_2c){
with(_2a){
if(_selectionIndexes==_2c||!_isSelectable){
return;
}
var _2d=CPNotFound;
while((_2d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2d))!=CPNotFound){
objj_msgSend(_items[_2d],"setSelected:",NO);
}
_selectionIndexes=_2c;
var _2d=CPNotFound;
while((_2d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2d))!=CPNotFound){
objj_msgSend(_items[_2d],"setSelected:",YES);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionViewDidChangeSelection:"))){
objj_msgSend(_delegate,"collectionViewDidChangeSelection:",_2a);
}
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_2e,_2f){
with(_2e){
return _selectionIndexes;
}
}),new objj_method(sel_getUid("reloadContent"),function(_30,_31){
with(_30){
var _32=_items.length;
while(_32--){
objj_msgSend(objj_msgSend(_items[_32],"view"),"removeFromSuperview");
_cachedItems.push(_items[_32]);
}
_items=[];
if(!_itemPrototype||!_content){
return;
}
var _33=0;
_32=_content.length;
for(;_33<_32;++_33){
_items.push(objj_msgSend(_30,"newItemForRepresentedObject:",_content[_33]));
objj_msgSend(_30,"addSubview:",objj_msgSend(_items[_33],"view"));
}
objj_msgSend(_30,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_34,_35){
with(_34){
var _36=CGRectGetWidth(objj_msgSend(_34,"bounds"));
if(!objj_msgSend(_content,"count")||_36==_tileWidth){
return;
}
var _37=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_36/_37.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _38=_36-_numberOfColumns*_37.width,_39=NO;
if(_38>0&&_37.width<_maxItemSize.width){
_37.width=MIN(_maxItemSize.width,_37.width+FLOOR(_38/_numberOfColumns));
}
if(_maxNumberOfColumns==1&&_37.width<_maxItemSize.width&&_37.width<_36){
_37.width=MIN(_maxItemSize.width,_36);
}
if(!CGSizeEqualToSize(_itemSize,_37)){
_itemSize=_37;
_39=YES;
}
var _3a=0,_3b=_items.length;
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_3b=MIN(_3b,_maxNumberOfColumns*_maxNumberOfRows);
}
_numberOfRows=CEIL(_3b/_numberOfColumns);
_horizontalMargin=FLOOR((_36-_numberOfColumns*_37.width)/(_numberOfColumns+1));
var x=_horizontalMargin,y=-_37.height;
for(;_3a<_3b;++_3a){
if(_3a%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_37.height;
}
var _3c=objj_msgSend(_items[_3a],"view");
objj_msgSend(_3c,"setFrameOrigin:",CGPointMake(x,y));
if(_39){
objj_msgSend(_3c,"setFrameSize:",_itemSize);
}
x+=_37.width+_horizontalMargin;
}
_tileWidth=_36;
objj_msgSend(_34,"setFrameSize:",CGSizeMake(_36,y+_37.height+_verticalMargin));
_tileWidth=-1;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_3d,"tile");
}
}),new objj_method(sel_getUid("setMaxNumberOfRows:"),function(_40,_41,_42){
with(_40){
if(_maxNumberOfRows==_42){
return;
}
_maxNumberOfRows=_42;
objj_msgSend(_40,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfRows"),function(_43,_44){
with(_43){
return _maxNumberOfRows;
}
}),new objj_method(sel_getUid("setMaxNumberOfColumns:"),function(_45,_46,_47){
with(_45){
if(_maxNumberOfColumns==_47){
return;
}
_maxNumberOfColumns=_47;
objj_msgSend(_45,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfColumns"),function(_48,_49){
with(_48){
return _maxNumberOfColumns;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_4a,_4b){
with(_4a){
return _numberOfRows;
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_4c,_4d){
with(_4c){
return _numberOfColumns;
}
}),new objj_method(sel_getUid("setMinItemSize:"),function(_4e,_4f,_50){
with(_4e){
if(CGSizeEqualToSize(_minItemSize,_50)){
return;
}
_minItemSize=CGSizeMakeCopy(_50);
objj_msgSend(_4e,"tile");
}
}),new objj_method(sel_getUid("minItemSize"),function(_51,_52){
with(_51){
return _minItemSize;
}
}),new objj_method(sel_getUid("setMaxItemSize:"),function(_53,_54,_55){
with(_53){
if(CGSizeEqualToSize(_maxItemSize,_55)){
return;
}
_maxItemSize=CGSizeMakeCopy(_55);
objj_msgSend(_53,"tile");
}
}),new objj_method(sel_getUid("maxItemSize"),function(_56,_57){
with(_56){
return _maxItemSize;
}
}),new objj_method(sel_getUid("setBackgroundColors:"),function(_58,_59,_5a){
with(_58){
if(_backgroundColors===_5a){
return;
}
_backgroundColors=_5a;
if(!_backgroundColors){
_backgroundColors=objj_msgSend(CPColor,"whiteColor");
}
if(objj_msgSend(_backgroundColors,"count")===1){
objj_msgSend(_58,"setBackgroundColor:",_backgroundColors[0]);
}else{
objj_msgSend(_58,"setBackgroundColor:",nil);
}
objj_msgSend(_58,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("backgroundColors"),function(_5b,_5c){
with(_5b){
return _backgroundColors;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_5d,_5e,_5f){
with(_5d){
if(objj_msgSend(_selectionIndexes,"count")&&objj_msgSend(_5f,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"))){
objj_msgSend(_delegate,"collectionView:didDoubleClickOnItemAtIndex:",_5d,objj_msgSend(_selectionIndexes,"firstIndex"));
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_60,_61,_62){
with(_60){
_mouseDownEvent=_62;
var _63=objj_msgSend(_60,"convertPoint:fromView:",objj_msgSend(_62,"locationInWindow"),nil),row=FLOOR(_63.y/(_itemSize.height+_verticalMargin)),_64=FLOOR(_63.x/(_itemSize.width+_horizontalMargin)),_65=row*_numberOfColumns+_64;
if(_65>=0&&_65<_items.length){
objj_msgSend(_60,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_65));
}else{
if(_allowsEmptySelection){
objj_msgSend(_60,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_66,_67,_68){
with(_66){
if(!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:dragTypesForItemsAtIndexes:"))){
return;
}
if(!objj_msgSend(_selectionIndexes,"count")){
return;
}
var _69=objj_msgSend(_delegate,"collectionView:dragTypesForItemsAtIndexes:",_66,_selectionIndexes);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",_69,_66);
var _6a=objj_msgSend(_66,"convertPoint:fromView:",objj_msgSend(_68,"locationInWindow"),nil);
if(!_itemForDragging){
_itemForDragging=objj_msgSend(_66,"newItemForRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}else{
objj_msgSend(_itemForDragging,"setRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}
var _6b=objj_msgSend(_itemForDragging,"view");
objj_msgSend(_6b,"setFrameSize:",_itemSize);
objj_msgSend(_6b,"setAlphaValue:",0.7);
objj_msgSend(_66,"dragView:at:offset:event:pasteboard:source:slideBack:",_6b,objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes,"firstIndex")],"view"),"frame").origin,CGSizeMakeZero(),_mouseDownEvent,nil,_66,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_6c,_6d,_6e,_6f){
with(_6c){
objj_msgSend(_6e,"setData:forType:",objj_msgSend(_delegate,"collectionView:dataForItemsAtIndexes:forType:",_6c,_selectionIndexes,_6f),_6f);
}
}),new objj_method(sel_getUid("setVerticalMargin:"),function(_70,_71,_72){
with(_70){
if(_verticalMargin==_72){
return;
}
_verticalMargin=_72;
objj_msgSend(_70,"tile");
}
}),new objj_method(sel_getUid("verticalMargin"),function(_73,_74){
with(_73){
return _verticalMargin;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_75,_76,_77){
with(_75){
_delegate=_77;
}
}),new objj_method(sel_getUid("delegate"),function(_78,_79){
with(_78){
return _delegate;
}
})]);
var _7a="CPCollectionViewMinItemSizeKey",_7b="CPCollectionViewMaxItemSizeKey",_7c="CPCollectionViewVerticalMarginKey",_7d="CPCollectionViewSelectableKey",_7e="CPCollectionViewBackgroundColorsKey";
var _1=objj_getClass("CPCollectionView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCollectionView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7f,_80,_81){
with(_7f){
_7f=objj_msgSendSuper({receiver:_7f,super_class:objj_getClass("CPView")},"initWithCoder:",_81);
if(_7f){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=objj_msgSend(_81,"decodeSizeForKey:",_7a)||CGSizeMakeZero();
_maxItemSize=objj_msgSend(_81,"decodeSizeForKey:",_7b)||CGSizeMakeZero();
_verticalMargin=objj_msgSend(_81,"decodeFloatForKey:",_7c);
_isSelectable=objj_msgSend(_81,"decodeBoolForKey:",_7d);
objj_msgSend(_7f,"setBackgroundColors:",objj_msgSend(_81,"decodeObjectForKey:",_7e));
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
}
return _7f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_82,_83,_84){
with(_82){
objj_msgSendSuper({receiver:_82,super_class:objj_getClass("CPView")},"encodeWithCoder:",_84);
if(!CGSizeEqualToSize(_minItemSize,CGSizeMakeZero())){
objj_msgSend(_84,"encodeSize:forKey:",_minItemSize,_7a);
}
if(!CGSizeEqualToSize(_maxItemSize,CGSizeMakeZero())){
objj_msgSend(_84,"encodeSize:forKey:",_maxItemSize,_7b);
}
objj_msgSend(_84,"encodeBool:forKey:",_isSelectable,_7d);
objj_msgSend(_84,"encodeFloat:forKey:",_verticalMargin,_7c);
objj_msgSend(_84,"encodeObject:forKey:",_backgroundColors,_7e);
}
})]);
p;22;CPCollectionViewItem.ji;18;CPViewController.jc;1163;
var _1=objj_allocateClassPair(CPViewController,"CPCollectionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isSelected")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPViewController")},"setRepresentedObject:",_5);
var _6=objj_msgSend(_3,"view");
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("setRepresentedObject:"))){
objj_msgSend(_6,"setRepresentedObject:",objj_msgSend(_3,"representedObject"));
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_7,_8,_9){
with(_7){
_9=!!_9;
if(_isSelected===_9){
return;
}
_isSelected=_9;
var _a=objj_msgSend(_7,"view");
if(objj_msgSend(_a,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_a,"setSelected:",objj_msgSend(_7,"isSelected"));
}
}
}),new objj_method(sel_getUid("isSelected"),function(_b,_c){
with(_b){
return _isSelected;
}
}),new objj_method(sel_getUid("collectionView"),function(_d,_e){
with(_d){
return objj_msgSend(_view,"superview");
}
})]);
p;9;CPColor.jI;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;14542;
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2;
var _8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,_15,_16,_17;
var _18=objj_allocateClassPair(CPObject,"CPColor"),_19=_18.isa;
class_addIvars(_18,[new objj_ivar("_components"),new objj_ivar("_patternImage"),new objj_ivar("_cssString")]);
objj_registerClassPair(_18);
objj_addClassForBundle(_18,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_18,[new objj_method(sel_getUid("_initWithCSSString:"),function(_1a,_1b,_1c){
with(_1a){
if(_1c.indexOf("rgb")==CPNotFound){
return nil;
}
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
var _1d=_1c.indexOf("(");
var _1e=_1c.substring(_1d+1).split(",");
_components=[parseInt(_1e[0],10)/255,parseInt(_1e[1],10)/255,parseInt(_1e[2],10)/255,_1e[3]?parseInt(_1e[3],10)/255:1];
_cssString=_1c;
return _1a;
}
}),new objj_method(sel_getUid("_initWithRGBA:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("CPObject")},"init");
if(_1f){
_components=_21;
if(!CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1&&window.Base64&&window.CRC32){
var _22=[137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,1,0,0,0,1,8,3,0,0,0,40,203,52,187,0,0,3,0,80,76,84,69,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,137,153,85,0,0,0,1,116,82,78,83,0,64,230,216,102,0,0,0,16,73,68,65,84,120,218,98,96,0,0,0,0,255,255,3,0,0,2,0,1,36,127,36,241,0,0,0,0,73,69,78,68,174,66,96,130,255];
var _23=41;
var _24=42;
var _25=43;
var _26=821;
var _27=809;
var _28=822;
var _29=37;
var _2a=817;
_22[_23]=Math.round(_components[0]*255);
_22[_24]=Math.round(_components[1]*255);
_22[_25]=Math.round(_components[2]*255);
_22[_26]=Math.round(_components[3]*255);
var _2b=integerToBytes(CRC32.getCRC(_22,_29,4+768),4);
var _2c=integerToBytes(CRC32.getCRC(_22,_2a,4+1),4);
for(var i=0;i<4;i++){
_22[_27+i]=_2b[i];
_22[_28+i]=_2c[i];
}
var _2d=Base64.encode(_22);
_cssString="url(\"data:image/png;base64,"+_2d+"\")";
}else{
var _2e=CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1;
_cssString=(_2e?"rgba(":"rgb(")+parseInt(_components[0]*255)+", "+parseInt(_components[1]*255)+", "+parseInt(_components[2]*255)+(_2e?(", "+_components[3]):"")+")";
}
}
return _1f;
}
}),new objj_method(sel_getUid("_initWithPatternImage:"),function(_2f,_30,_31){
with(_2f){
_2f=objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("CPObject")},"init");
if(_2f){
_patternImage=_31;
_cssString="url(\""+objj_msgSend(_patternImage,"filename")+"\")";
}
return _2f;
}
}),new objj_method(sel_getUid("patternImage"),function(_32,_33){
with(_32){
return _patternImage;
}
}),new objj_method(sel_getUid("alphaComponent"),function(_34,_35){
with(_34){
return _components[3];
}
}),new objj_method(sel_getUid("blueComponent"),function(_36,_37){
with(_36){
return _components[2];
}
}),new objj_method(sel_getUid("greenComponent"),function(_38,_39){
with(_38){
return _components[1];
}
}),new objj_method(sel_getUid("redComponent"),function(_3a,_3b){
with(_3a){
return _components[0];
}
}),new objj_method(sel_getUid("components"),function(_3c,_3d){
with(_3c){
return _components;
}
}),new objj_method(sel_getUid("colorWithAlphaComponent:"),function(_3e,_3f,_40){
with(_3e){
var _41=_components.slice();
_41[_41.length-1]=_40;
return objj_msgSend(objj_msgSend(objj_msgSend(_3e,"class"),"alloc"),"_initWithRGBA:",_41);
}
}),new objj_method(sel_getUid("hsbComponents"),function(_42,_43){
with(_42){
var red=ROUND(_components[_1]*255),_44=ROUND(_components[_2]*255),_45=ROUND(_components[_3]*255);
var max=MAX(red,_44,_45),min=MIN(red,_44,_45),_46=max-min;
var _47=max/255,_48=(max!=0)?_46/max:0;
var hue;
if(_48==0){
hue=0;
}else{
var rr=(max-red)/_46;
var gr=(max-_44)/_46;
var br=(max-_45)/_46;
if(red==max){
hue=br-gr;
}else{
if(_44==max){
hue=2+rr-br;
}else{
hue=4+gr-rr;
}
}
hue/=6;
if(hue<0){
hue++;
}
}
return [ROUND(hue*360),ROUND(_48*100),ROUND(_47*100)];
}
}),new objj_method(sel_getUid("cssString"),function(_49,_4a){
with(_49){
return _cssString;
}
}),new objj_method(sel_getUid("hexString"),function(_4b,_4c){
with(_4b){
return rgbToHex(objj_msgSend(_4b,"redComponent"),objj_msgSend(_4b,"greenComponent"),objj_msgSend(_4b,"blueComponent"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_4d,_4e,_4f){
with(_4d){
if(!_4f){
return NO;
}
if(_4f===_4d){
return YES;
}
return objj_msgSend(_4f,"isKindOfClass:",CPColor)&&objj_msgSend(_4f,"cssString")===objj_msgSend(_4d,"cssString");
}
}),new objj_method(sel_getUid("description"),function(_50,_51){
with(_50){
return objj_msgSendSuper({receiver:_50,super_class:objj_getClass("CPObject")},"description")+" "+objj_msgSend(_50,"cssString");
}
})]);
class_addMethods(_19,[new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"),function(_52,_53,red,_54,_55,_56){
with(_52){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[red,_54,_55,_56]);
}
}),new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"),function(_57,_58,red,_59,_5a,_5b){
with(_57){
return objj_msgSend(_57,"colorWithRed:green:blue:alpha:",red,_59,_5a,_5b);
}
}),new objj_method(sel_getUid("colorWithWhite:alpha:"),function(_5c,_5d,_5e,_5f){
with(_5c){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[_5e,_5e,_5e,_5f]);
}
}),new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"),function(_60,_61,_62,_63){
with(_60){
return objj_msgSend(_60,"colorWithWhite:alpha:",_62,_63);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:"),function(_64,_65,hue,_66,_67){
with(_64){
return objj_msgSend(_64,"colorWithHue:saturation:brightness:alpha:",hue,_66,_67,1);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"),function(_68,_69,hue,_6a,_6b,_6c){
with(_68){
if(_6a===0){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_6b/100,_6c);
}
var f=hue%60,p=(_6b*(100-_6a))/10000,q=(_6b*(6000-_6a*f))/600000,t=(_6b*(6000-_6a*(60-f)))/600000,b=_6b/100;
switch(FLOOR(hue/60)){
case 0:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,t,p,_6c);
case 1:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",q,b,p,_6c);
case 2:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,b,t,_6c);
case 3:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,q,b,_6c);
case 4:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",t,p,b,_6c);
case 5:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,p,q,_6c);
}
}
}),new objj_method(sel_getUid("colorWithHexString:"),function(_6d,_6e,hex){
with(_6d){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",hexToRGB(hex));
}
}),new objj_method(sel_getUid("blackColor"),function(_6f,_70){
with(_6f){
if(!_8){
_8=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1]);
}
return _8;
}
}),new objj_method(sel_getUid("blueColor"),function(_71,_72){
with(_71){
if(!_b){
_b=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,1,1]);
}
return _b;
}
}),new objj_method(sel_getUid("darkGrayColor"),function(_73,_74){
with(_73){
if(!_f){
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1/3,1);
}
return _f;
}
}),new objj_method(sel_getUid("grayColor"),function(_75,_76){
with(_75){
if(!_d){
_d=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1);
}
return _d;
}
}),new objj_method(sel_getUid("greenColor"),function(_77,_78){
with(_77){
if(!_a){
_a=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,0,1]);
}
return _a;
}
}),new objj_method(sel_getUid("lightGrayColor"),function(_79,_7a){
with(_79){
if(!_e){
_e=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",2/3,1);
}
return _e;
}
}),new objj_method(sel_getUid("redColor"),function(_7b,_7c){
with(_7b){
if(!_9){
_9=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,0,1]);
}
return _9;
}
}),new objj_method(sel_getUid("whiteColor"),function(_7d,_7e){
with(_7d){
if(!_10){
_10=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,1,1]);
}
return _10;
}
}),new objj_method(sel_getUid("yellowColor"),function(_7f,_80){
with(_7f){
if(!_c){
_c=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,0,1]);
}
return _c;
}
}),new objj_method(sel_getUid("brownColor"),function(_81,_82){
with(_81){
if(!_11){
_11=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.6,0.4,0.2,1]);
}
return _11;
}
}),new objj_method(sel_getUid("cyanColor"),function(_83,_84){
with(_83){
if(!_12){
_12=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,1,1]);
}
return _12;
}
}),new objj_method(sel_getUid("magentaColor"),function(_85,_86){
with(_85){
if(!_13){
_13=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,1,1]);
}
return _13;
}
}),new objj_method(sel_getUid("orangeColor"),function(_87,_88){
with(_87){
if(!_14){
_14=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0.5,0,1]);
}
return _14;
}
}),new objj_method(sel_getUid("purpleColor"),function(_89,_8a){
with(_89){
if(!_15){
_15=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.5,0,0.5,1]);
}
return _15;
}
}),new objj_method(sel_getUid("shadowColor"),function(_8b,_8c){
with(_8b){
if(!_16){
_16=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1/3]);
}
return _16;
}
}),new objj_method(sel_getUid("clearColor"),function(_8d,_8e){
with(_8d){
if(!_17){
_17=objj_msgSend(_8d,"colorWithCalibratedWhite:alpha:",0,0);
}
return _17;
}
}),new objj_method(sel_getUid("alternateSelectedControlColor"),function(_8f,_90){
with(_8f){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.22,0.46,0.84,1]);
}
}),new objj_method(sel_getUid("secondarySelectedControlColor"),function(_91,_92){
with(_91){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.83,0.83,0.83,1]);
}
}),new objj_method(sel_getUid("colorWithPatternImage:"),function(_93,_94,_95){
with(_93){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",_95);
}
}),new objj_method(sel_getUid("colorWithCSSString:"),function(_96,_97,_98){
with(_96){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_98);
}
})]);
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("set"),function(_99,_9a){
with(_99){
objj_msgSend(_99,"setFill");
objj_msgSend(_99,"setStroke");
}
}),new objj_method(sel_getUid("setFill"),function(_9b,_9c){
with(_9b){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(ctx,_9b);
}
}),new objj_method(sel_getUid("setStroke"),function(_9d,_9e){
with(_9d){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(ctx,_9d);
}
})]);
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_19,[new objj_method(sel_getUid("randomColor"),function(_9f,_a0){
with(_9f){
return objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",RAND(),RAND(),RAND(),1);
}
})]);
var _a1="CPColorComponentsKey",_a2="CPColorPatternImageKey";
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("initWithCoder:"),function(_a3,_a4,_a5){
with(_a3){
if(objj_msgSend(_a5,"containsValueForKey:",_a2)){
return objj_msgSend(_a3,"_initWithPatternImage:",objj_msgSend(_a5,"decodeObjectForKey:",_a2));
}
return objj_msgSend(_a3,"_initWithRGBA:",objj_msgSend(_a5,"decodeObjectForKey:",_a1));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
if(_patternImage){
objj_msgSend(_a8,"encodeObject:forKey:",_patternImage,_a2);
}else{
objj_msgSend(_a8,"encodeObject:forKey:",_components,_a1);
}
}
})]);
var _a9="0123456789ABCDEF";
hexToRGB=function(hex){
if(hex.length==3){
hex=hex.charAt(0)+hex.charAt(0)+hex.charAt(1)+hex.charAt(1)+hex.charAt(2)+hex.charAt(2);
}
if(hex.length!=6){
return null;
}
hex=hex.toUpperCase();
for(var i=0;i<hex.length;i++){
if(_a9.indexOf(hex.charAt(i))==-1){
return null;
}
}
var red=(_a9.indexOf(hex.charAt(0))*16+_a9.indexOf(hex.charAt(1)))/255;
var _aa=(_a9.indexOf(hex.charAt(2))*16+_a9.indexOf(hex.charAt(3)))/255;
var _ab=(_a9.indexOf(hex.charAt(4))*16+_a9.indexOf(hex.charAt(5)))/255;
return [red,_aa,_ab,1];
};
integerToBytes=function(_ac,_ad){
if(!_ad){
_ad=(_ac==0)?1:Math.round((Math.log(_ac)/Math.log(2))/8+0.5);
}
var _ae=new Array(_ad);
for(var i=_ad-1;i>=0;i--){
_ae[i]=_ac&255;
_ac=_ac>>8;
}
return _ae;
};
rgbToHex=function(r,g,b){
return byteToHex(r)+byteToHex(g)+byteToHex(b);
};
byteToHex=function(n){
if(!n||isNaN(n)){
return "00";
}
n=ROUND(MIN(255,MAX(0,256*n)));
return _a9.charAt((n-n%16)/16)+_a9.charAt(n%16);
};
p;14;CPColorPanel.ji;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;8;CPView.jc;16229;
CPColorPanelColorDidChangeNotification="CPColorPanelColorDidChangeNotification";
var _1=20,_2=32,_3=14,_4=32,_5=12;
var _6=nil,_7=[];
CPWheelColorPickerMode=1;
CPSliderColorPickerMode=2;
CPColorPickerViewWidth=265,CPColorPickerViewHeight=370;
var _8=objj_allocateClassPair(CPPanel,"CPColorPanel"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_toolbar"),new objj_ivar("_swatchView"),new objj_ivar("_previewView"),new objj_ivar("_opacitySlider"),new objj_ivar("_colorPickers"),new objj_ivar("_currentView"),new objj_ivar("_activePicker"),new objj_ivar("_color"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_mode")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_a,_b){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",CGRectMake(500,50,219,370),(CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
if(_a){
objj_msgSend(objj_msgSend(_a,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.95,1));
objj_msgSend(_a,"setTitle:","Color Panel");
objj_msgSend(_a,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_a,"setFloatingPanel:",YES);
objj_msgSend(_a,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_a,"setMinSize:",CGSizeMake(219,342));
objj_msgSend(_a,"setMaxSize:",CGSizeMake(323,537));
}
return _a;
}
}),new objj_method(sel_getUid("setColor:"),function(_c,_d,_e){
with(_c){
_color=_e;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
objj_msgSend(CPApp,"sendAction:to:from:",sel_getUid("changeColor:"),nil,_c);
if(_target&&_action){
objj_msgSend(CPApp,"sendAction:to:from:",_action,_target,_c);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPColorPanelColorDidChangeNotification,_c);
objj_msgSend(_activePicker,"setColor:",_color);
objj_msgSend(_opacitySlider,"setFloatValue:",objj_msgSend(_color,"alphaComponent"));
}
}),new objj_method(sel_getUid("setColor:updatePicker:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(_f,"setColor:",_11);
if(_12){
objj_msgSend(_activePicker,"setColor:",_color);
}
}
}),new objj_method(sel_getUid("color"),function(_13,_14){
with(_13){
return _color;
}
}),new objj_method(sel_getUid("opacity"),function(_15,_16){
with(_15){
return objj_msgSend(_opacitySlider,"floatValue");
}
}),new objj_method(sel_getUid("setTarget:"),function(_17,_18,_19){
with(_17){
_target=_19;
}
}),new objj_method(sel_getUid("target"),function(_1a,_1b){
with(_1a){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1c,_1d,_1e){
with(_1c){
_action=_1e;
}
}),new objj_method(sel_getUid("action"),function(_1f,_20){
with(_1f){
return _action;
}
}),new objj_method(sel_getUid("setMode:"),function(_21,_22,_23){
with(_21){
_mode=_23;
}
}),new objj_method(sel_getUid("_setPicker:"),function(_24,_25,_26){
with(_24){
var _27=_colorPickers[objj_msgSend(_26,"tag")],_28=objj_msgSend(_27,"provideNewView:",NO);
if(!_28){
_28=objj_msgSend(_27,"provideNewView:",YES);
}
if(_28==_currentView){
return;
}
if(_currentView){
objj_msgSend(_28,"setFrame:",objj_msgSend(_currentView,"frame"));
}else{
var _29=(_2+10+_1+5+_3+32),_2a=objj_msgSend(objj_msgSend(_24,"contentView"),"bounds");
objj_msgSend(_28,"setFrameSize:",CPSizeMake(_2a.size.width-10,_2a.size.height-_29));
objj_msgSend(_28,"setFrameOrigin:",CPPointMake(5,_29));
}
objj_msgSend(_currentView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_24,"contentView"),"addSubview:",_28);
_currentView=_28;
_activePicker=_27;
objj_msgSend(_27,"setColor:",objj_msgSend(_24,"color"));
}
}),new objj_method(sel_getUid("mode"),function(_2b,_2c){
with(_2b){
return _mode;
}
}),new objj_method(sel_getUid("orderFront:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"_loadContentsIfNecessary");
objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPPanel")},"orderFront:",_2f);
}
}),new objj_method(sel_getUid("_loadContentsIfNecessary"),function(_30,_31){
with(_30){
if(_toolbar){
return;
}
if(!_color){
_color=objj_msgSend(CPColor,"whiteColor");
}
_colorPickers=[];
var _32=objj_msgSend(_7,"count");
for(var i=0;i<_32;i++){
var _33=_7[i],_34=objj_msgSend(objj_msgSend(_33,"alloc"),"initWithPickerMask:colorPanel:",0,_30);
_colorPickers.push(_34);
}
var _35=objj_msgSend(_30,"contentView"),_36=objj_msgSend(_35,"bounds");
_toolbar=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,6,CGRectGetWidth(_36),_2));
objj_msgSend(_toolbar,"setAutoresizingMask:",CPViewWidthSizable);
var _37=_32*_4+(_32-1)*_5,_38=(CGRectGetWidth(_36)-_37)/2,_39=nil;
for(var i=0;i<_32;i++){
var _3a=objj_msgSend(_colorPickers[i],"provideNewButtonImage"),_3b=objj_msgSend(_colorPickers[i],"provideNewAlternateButtonImage"),_3c=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_38+i*(_4+_5),0,_4,_4));
objj_msgSend(_3c,"setTag:",i);
objj_msgSend(_3c,"setTarget:",_30);
objj_msgSend(_3c,"setAction:",sel_getUid("_setPicker:"));
objj_msgSend(_3c,"setBordered:",NO);
objj_msgSend(_3c,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_3c,"setImage:",_3a);
objj_msgSend(_3c,"setAlternateImage:",_3b);
objj_msgSend(_toolbar,"addSubview:",_3c);
if(!_39){
_39=_3c;
}
}
var _3d=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10,CGRectGetWidth(_36)-86,_1));
_previewView=objj_msgSend(objj_msgSend(_CPColorPanelPreview,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_3d,"bounds"),2,2));
objj_msgSend(_previewView,"setColorPanel:",_30);
objj_msgSend(_previewView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3d,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,1));
objj_msgSend(_3d,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3d,"addSubview:",_previewView);
var _3e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+10,60,15));
objj_msgSend(_3e,"setStringValue:","Preview:");
objj_msgSend(_3e,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_3e,"setAlignment:",CPRightTextAlignment);
var _3f=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10+_1+5,CGRectGetWidth(_36)-86,_3+2));
objj_msgSend(_3f,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,1));
objj_msgSend(_3f,"setAutoresizingMask:",CPViewWidthSizable);
_swatchView=objj_msgSend(objj_msgSend(_CPColorPanelSwatches,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_3f,"bounds"),1,1));
objj_msgSend(_swatchView,"setColorPanel:",_30);
objj_msgSend(_swatchView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3f,"addSubview:",_swatchView);
var _40=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+8+_1+6,60,15));
objj_msgSend(_40,"setStringValue:","Swatches:");
objj_msgSend(_40,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_40,"setAlignment:",CPRightTextAlignment);
var _41=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+_1+35,60,20));
objj_msgSend(_41,"setStringValue:","Opacity:");
objj_msgSend(_41,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_41,"setAlignment:",CPRightTextAlignment);
_opacitySlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CGRectMake(76,_2+_1+34,CGRectGetWidth(_36)-86,20));
objj_msgSend(_opacitySlider,"setMinValue:",0);
objj_msgSend(_opacitySlider,"setMaxValue:",1);
objj_msgSend(_opacitySlider,"setTarget:",_30);
objj_msgSend(_opacitySlider,"setAction:",sel_getUid("setOpacity:"));
objj_msgSend(_35,"addSubview:",_toolbar);
objj_msgSend(_35,"addSubview:",_3d);
objj_msgSend(_35,"addSubview:",_3e);
objj_msgSend(_35,"addSubview:",_3f);
objj_msgSend(_35,"addSubview:",_40);
objj_msgSend(_35,"addSubview:",_41);
objj_msgSend(_35,"addSubview:",_opacitySlider);
_target=nil;
_action=nil;
_activePicker=nil;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
if(_39){
objj_msgSend(_30,"_setPicker:",_39);
}
}
}),new objj_method(sel_getUid("setOpacity:"),function(_42,_43,_44){
with(_42){
var _45=objj_msgSend(objj_msgSend(_42,"color"),"components"),_46=objj_msgSend(_44,"floatValue");
objj_msgSend(_42,"setColor:updatePicker:",objj_msgSend(_color,"colorWithAlphaComponent:",_46),YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("provideColorPickerClass:"),function(_47,_48,_49){
with(_47){
_7.push(_49);
}
}),new objj_method(sel_getUid("sharedColorPanel"),function(_4a,_4b){
with(_4a){
if(!_6){
_6=objj_msgSend(objj_msgSend(CPColorPanel,"alloc"),"init");
}
return _6;
}
}),new objj_method(sel_getUid("setPickerMode:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_4f,"setMode:",_4e);
}
})]);
CPColorDragType="CPColorDragType";
var _50="CPColorPanelSwatchesCookie";
var _8=objj_allocateClassPair(CPView,"_CPColorPanelSwatches"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_swatches"),new objj_ivar("_dragColor"),new objj_ivar("_colorPanel"),new objj_ivar("_swatchCookie")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_51,_52,_53){
with(_51){
_51=objj_msgSendSuper({receiver:_51,super_class:objj_getClass("CPView")},"initWithFrame:",_53);
objj_msgSend(_51,"setBackgroundColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_51,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
var _54=objj_msgSend(CPColor,"whiteColor");
_swatchCookie=objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:",_50);
var _55=objj_msgSend(_51,"startingColorList");
_swatches=[];
for(var i=0;i<50;i++){
var _56=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(13*i+1,1,12,12)),_57=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_56,"bounds"),1,1));
objj_msgSend(_56,"setBackgroundColor:",_54);
objj_msgSend(_57,"setBackgroundColor:",(i<_55.length)?_55[i]:_54);
objj_msgSend(_56,"addSubview:",_57);
objj_msgSend(_51,"addSubview:",_56);
_swatches.push(_56);
}
return _51;
}
}),new objj_method(sel_getUid("isOpaque"),function(_58,_59){
with(_58){
return YES;
}
}),new objj_method(sel_getUid("startingColorList"),function(_5a,_5b){
with(_5a){
var _5c=objj_msgSend(_swatchCookie,"value");
if(_5c==""){
return [objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPColor,"darkGrayColor"),objj_msgSend(CPColor,"grayColor"),objj_msgSend(CPColor,"lightGrayColor"),objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"redColor"),objj_msgSend(CPColor,"greenColor"),objj_msgSend(CPColor,"blueColor"),objj_msgSend(CPColor,"yellowColor")];
}
var _5c=eval(_5c);
var _5d=[];
for(var i=0;i<_5c.length;i++){
_5d.push(objj_msgSend(CPColor,"colorWithHexString:",_5c[i]));
}
return _5d;
}
}),new objj_method(sel_getUid("saveColorList"),function(_5e,_5f){
with(_5e){
var _60=[];
for(var i=0;i<_swatches.length;i++){
_60.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i],"subviews")[0],"backgroundColor"),"hexString"));
}
var _61=new Date();
_61.setYear(2019);
objj_msgSend(_swatchCookie,"setValue:expires:domain:",JSON.stringify(_60),_61,nil);
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_62,_63,_64){
with(_62){
_colorPanel=_64;
}
}),new objj_method(sel_getUid("colorPanel"),function(_65,_66){
with(_65){
return _colorPanel;
}
}),new objj_method(sel_getUid("colorAtIndex:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(objj_msgSend(_swatches[_69],"subviews")[0],"backgroundColor");
}
}),new objj_method(sel_getUid("setColor:atIndex:"),function(_6a,_6b,_6c,_6d){
with(_6a){
objj_msgSend(objj_msgSend(_swatches[_6d],"subviews")[0],"setBackgroundColor:",_6c);
objj_msgSend(_6a,"saveColorList");
}
}),new objj_method(sel_getUid("mouseUp:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_6e,"convertPoint:fromView:",objj_msgSend(_70,"locationInWindow"),nil);
if(_71.x>objj_msgSend(_6e,"bounds").size.width-1||_71.x<1){
return NO;
}
objj_msgSend(_colorPanel,"setColor:updatePicker:",objj_msgSend(_6e,"colorAtIndex:",FLOOR(_71.x/13)),YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_72,"convertPoint:fromView:",objj_msgSend(_74,"locationInWindow"),nil);
if(_75.x>objj_msgSend(_72,"bounds").size.width-1||_75.x<1){
return NO;
}
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_72);
var _76=_swatches[FLOOR(_75.x/13)];
_dragColor=objj_msgSend(objj_msgSend(_76,"subviews")[0],"backgroundColor");
var _77=CPRectCreateCopy(objj_msgSend(_76,"bounds"));
var _78=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_77);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_77,1,1));
objj_msgSend(_78,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",_dragColor);
objj_msgSend(_78,"addSubview:",dragFillView);
objj_msgSend(_72,"dragView:at:offset:event:pasteboard:source:slideBack:",_78,CPPointMake(_75.x-_77.size.width/2,_75.y-_77.size.height/2),CPPointMake(0,0),_74,nil,_72,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_79,_7a,_7b,_7c){
with(_79){
if(_7c==CPColorDragType){
objj_msgSend(_7b,"setData:forType:",_dragColor,_7c);
}
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_7d,_7e,_7f){
with(_7d){
var _80=objj_msgSend(_7d,"convertPoint:fromView:",objj_msgSend(_7f,"draggingLocation"),nil),_81=objj_msgSend(_7f,"draggingPasteboard"),_82=nil;
if(!objj_msgSend(_81,"availableTypeFromArray:",[CPColorDragType])||_80.x>objj_msgSend(_7d,"bounds").size.width-1||_80.x<1){
return NO;
}
objj_msgSend(_7d,"setColor:atIndex:",objj_msgSend(_81,"dataForType:",CPColorDragType),FLOOR(_80.x/13));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPColorPanelPreview"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_colorPanel")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_83,_84,_85){
with(_83){
_83=objj_msgSendSuper({receiver:_83,super_class:objj_getClass("CPView")},"initWithFrame:",_85);
objj_msgSend(_83,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
return _83;
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_86,_87,_88){
with(_86){
_colorPanel=_88;
}
}),new objj_method(sel_getUid("colorPanel"),function(_89,_8a){
with(_89){
return _colorPanel;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(_8d,"draggingPasteboard");
if(!objj_msgSend(_8e,"availableTypeFromArray:",[CPColorDragType])){
return NO;
}
var _8f=objj_msgSend(_8e,"dataForType:",CPColorDragType);
objj_msgSend(_colorPanel,"setColor:updatePicker:",_8f,YES);
}
}),new objj_method(sel_getUid("isOpaque"),function(_90,_91){
with(_90){
return YES;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_92,_93,_94){
with(_92){
var _95=objj_msgSend(_92,"convertPoint:fromView:",objj_msgSend(_94,"locationInWindow"),nil);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_92);
var _96=CPRectMake(0,0,15,15);
var _97=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_96);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_96,1,1));
objj_msgSend(_97,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",objj_msgSend(_92,"backgroundColor"));
objj_msgSend(_97,"addSubview:",dragFillView);
objj_msgSend(_92,"dragView:at:offset:event:pasteboard:source:slideBack:",_97,CPPointMake(_95.x-_96.size.width/2,_95.y-_96.size.height/2),CPPointMake(0,0),_94,nil,_92,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_98,_99,_9a,_9b){
with(_98){
if(_9b==CPColorDragType){
objj_msgSend(_9a,"setData:forType:",objj_msgSend(_98,"backgroundColor"),_9b);
}
}
})]);
i;15;CPColorPicker.ji;21;CPSliderColorPicker.jc;155;
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPColorWheelColorPicker);
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPSliderColorPicker);
p;15;CPColorPicker.jI;21;Foundation/CPObject.ji;14;CPColorPanel.jc;10196;
var _1=objj_allocateClassPair(CPObject,"CPColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_mask")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
_panel=_6;
_mask=_5;
return _3;
}
}),new objj_method(sel_getUid("colorPanel"),function(_7,_8){
with(_7){
return _panel;
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_9,_a){
with(_9){
return nil;
}
}),new objj_method(sel_getUid("setMode:"),function(_b,_c,_d){
with(_b){
return;
}
}),new objj_method(sel_getUid("setColor:"),function(_e,_f,_10){
with(_e){
return;
}
})]);
var _1=objj_allocateClassPair(CPColorPicker,"CPColorWheelColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_pickerView"),new objj_ivar("_brightnessSlider"),new objj_ivar("_hueSaturationView"),new objj_ivar("_cachedColor")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPColorPicker")},"initWithPickerMask:colorPanel:",_13,_14);
}
}),new objj_method(sel_getUid("initView"),function(_15,_16){
with(_15){
aFrame=CPRectMake(0,0,CPColorPickerViewWidth,CPColorPickerViewHeight);
_pickerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",aFrame);
objj_msgSend(_pickerView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CGRectMake(0,(aFrame.size.height-34),aFrame.size.width,15));
objj_msgSend(_brightnessSlider,"setValue:forThemeAttribute:",15,"track-width");
objj_msgSend(_brightnessSlider,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPColorPicker,"class")),"pathForResource:","brightness_bar.png"))),"track-color");
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setFloatValue:",100);
objj_msgSend(_brightnessSlider,"setTarget:",_15);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("brightnessSliderDidChange:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
_hueSaturationView=objj_msgSend(objj_msgSend(__CPColorWheel,"alloc"),"initWithFrame:",CPRectMake(0,0,aFrame.size.width,aFrame.size.height-38));
objj_msgSend(_hueSaturationView,"setDelegate:",_15);
objj_msgSend(_hueSaturationView,"setAutoresizingMask:",(CPViewWidthSizable|CPViewHeightSizable));
objj_msgSend(_pickerView,"addSubview:",_hueSaturationView);
objj_msgSend(_pickerView,"addSubview:",_brightnessSlider);
}
}),new objj_method(sel_getUid("brightnessSliderDidChange:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"updateColor");
}
}),new objj_method(sel_getUid("colorWheelDidChange:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"updateColor");
}
}),new objj_method(sel_getUid("updateColor"),function(_1d,_1e){
with(_1d){
var hue=objj_msgSend(_hueSaturationView,"angle"),_1f=objj_msgSend(_hueSaturationView,"distance"),_20=objj_msgSend(_brightnessSlider,"floatValue");
objj_msgSend(_hueSaturationView,"setWheelBrightness:",_20/100);
objj_msgSend(_brightnessSlider,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hue,_1f,100));
var _21=objj_msgSend(_1d,"colorPanel"),_22=objj_msgSend(_21,"opacity");
_cachedColor=objj_msgSend(CPColor,"colorWithHue:saturation:brightness:alpha:",hue,_1f,_20,_22);
objj_msgSend(objj_msgSend(_1d,"colorPanel"),"setColor:",_cachedColor);
}
}),new objj_method(sel_getUid("supportsMode:"),function(_23,_24,_25){
with(_23){
return (_25==CPWheelColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("currentMode"),function(_26,_27){
with(_26){
return CPWheelColorPickerMode;
}
}),new objj_method(sel_getUid("provideNewView:"),function(_28,_29,_2a){
with(_28){
if(_2a){
objj_msgSend(_28,"initView");
}
return _pickerView;
}
}),new objj_method(sel_getUid("setColor:"),function(_2b,_2c,_2d){
with(_2b){
if(objj_msgSend(_2d,"isEqual:",_cachedColor)){
return;
}
var hsb=objj_msgSend(_2d,"hsbComponents");
objj_msgSend(_hueSaturationView,"setPositionToColor:",_2d);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
objj_msgSend(_hueSaturationView,"setWheelBrightness:",hsb[2]/100);
objj_msgSend(_brightnessSlider,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hsb[0],hsb[1],100));
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_2e,_2f){
with(_2e){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_30,_31){
with(_30){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button_h.png"),CGSizeMake(32,32));
}
})]);
var _1=objj_allocateClassPair(CPView,"__CPColorWheel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_wheelImage"),new objj_ivar("_blackWheelImage"),new objj_ivar("_crosshair"),new objj_ivar("_delegate"),new objj_ivar("_angle"),new objj_ivar("_distance"),new objj_ivar("_radius")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_32,_33,_34){
with(_32){
_32=objj_msgSendSuper({receiver:_32,super_class:objj_getClass("CPView")},"initWithFrame:",_34);
var _35=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel.png");
_wheelImage=new Image();
_wheelImage.src=_35;
_wheelImage.style.position="absolute";
_35=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_black.png");
_blackWheelImage=new Image();
_blackWheelImage.src=_35;
_blackWheelImage.style.opacity="0";
_blackWheelImage.style.filter="alpha(opacity=0)";
_blackWheelImage.style.position="absolute";
_DOMElement.appendChild(_wheelImage);
_DOMElement.appendChild(_blackWheelImage);
objj_msgSend(_32,"setWheelSize:",_34.size);
_crosshair=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(_radius-2,_radius-2,4,4));
objj_msgSend(_crosshair,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
var _36=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_crosshair,"bounds"),1,1));
objj_msgSend(_36,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_crosshair,"addSubview:",_36);
objj_msgSend(_32,"addSubview:",_crosshair);
return _32;
}
}),new objj_method(sel_getUid("setWheelBrightness:"),function(_37,_38,_39){
with(_37){
_blackWheelImage.style.opacity=1-_39;
_blackWheelImage.style.filter="alpha(opacity="+(1-_39)*100+")";
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("CPView")},"setFrameSize:",_3c);
objj_msgSend(_3a,"setWheelSize:",_3c);
}
}),new objj_method(sel_getUid("setWheelSize:"),function(_3d,_3e,_3f){
with(_3d){
var min=MIN(_3f.width,_3f.height);
_blackWheelImage.style.width=min;
_blackWheelImage.style.height=min;
_blackWheelImage.width=min;
_blackWheelImage.height=min;
_blackWheelImage.style.top=(_3f.height-min)/2+"px";
_blackWheelImage.style.left=(_3f.width-min)/2+"px";
_wheelImage.style.width=min;
_wheelImage.style.height=min;
_wheelImage.width=min;
_wheelImage.height=min;
_wheelImage.style.top=(_3f.height-min)/2+"px";
_wheelImage.style.left=(_3f.width-min)/2+"px";
_radius=min/2;
objj_msgSend(_3d,"setAngle:distance:",objj_msgSend(_3d,"degreesToRadians:",_angle),(_distance/100)*_radius);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_40,_41,_42){
with(_40){
_delegate=_42;
}
}),new objj_method(sel_getUid("delegate"),function(_43,_44){
with(_43){
return _delegate;
}
}),new objj_method(sel_getUid("angle"),function(_45,_46){
with(_45){
return _angle;
}
}),new objj_method(sel_getUid("distance"),function(_47,_48){
with(_47){
return _distance;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_49,"reposition:",_4b);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"reposition:",_4e);
}
}),new objj_method(sel_getUid("reposition:"),function(_4f,_50,_51){
with(_4f){
var _52=objj_msgSend(_4f,"bounds"),_53=objj_msgSend(_4f,"convertPoint:fromView:",objj_msgSend(_51,"locationInWindow"),nil);
var _54=CGRectGetMidX(_52);
var _55=CGRectGetMidY(_52);
var _56=MIN(SQRT((_53.x-_54)*(_53.x-_54)+(_53.y-_55)*(_53.y-_55)),_radius);
var _57=ATAN2(_53.y-_55,_53.x-_54);
objj_msgSend(_4f,"setAngle:distance:",_57,_56);
objj_msgSend(_delegate,"colorWheelDidChange:",_4f);
}
}),new objj_method(sel_getUid("setAngle:distance:"),function(_58,_59,_5a,_5b){
with(_58){
var _5c=objj_msgSend(_58,"bounds");
var _5d=CGRectGetMidX(_5c);
var _5e=CGRectGetMidY(_5c);
_angle=objj_msgSend(_58,"radiansToDegrees:",_5a);
_distance=(_5b/_radius)*100;
objj_msgSend(_crosshair,"setFrameOrigin:",CPPointMake(COS(_5a)*_5b+_5d-2,SIN(_5a)*_5b+_5e-2));
}
}),new objj_method(sel_getUid("setPositionToColor:"),function(_5f,_60,_61){
with(_5f){
var hsb=objj_msgSend(_61,"hsbComponents"),_62=objj_msgSend(_5f,"bounds");
var _63=objj_msgSend(_5f,"degreesToRadians:",hsb[0]),_64=(hsb[1]/100)*_radius;
objj_msgSend(_5f,"setAngle:distance:",_63,_64);
}
}),new objj_method(sel_getUid("radiansToDegrees:"),function(_65,_66,_67){
with(_65){
return ((-_67/PI)*180+360)%360;
}
}),new objj_method(sel_getUid("degreesToRadians:"),function(_68,_69,_6a){
with(_68){
return -(((_6a-360)/180)*PI);
}
})]);
p;13;CPColorWell.jI;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jc;5916;
var _1="_CPColorWellDidBecomeExclusiveNotification";
var _2=objj_allocateClassPair(CPControl,"CPColorWell"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_active"),new objj_ivar("_bordered"),new objj_ivar("_color"),new objj_ivar("_wellView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPControl")},"initWithFrame:",_6);
if(_4){
_active=NO;
_bordered=YES;
_color=objj_msgSend(CPColor,"whiteColor");
objj_msgSend(_4,"drawBezelWithHighlight:",NO);
objj_msgSend(_4,"drawWellInside:",CGRectInset(objj_msgSend(_4,"bounds"),3,3));
objj_msgSend(_4,"_registerForNotifications");
}
return _4;
}
}),new objj_method(sel_getUid("_registerForNotifications"),function(_7,_8){
with(_7){
var _9=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_9,"addObserver:selector:name:object:",_7,sel_getUid("colorWellDidBecomeExclusive:"),_1,nil);
objj_msgSend(_9,"addObserver:selector:name:object:",_7,sel_getUid("colorPanelWillClose:"),CPWindowWillCloseNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isBordered"),function(_a,_b){
with(_a){
return _bordered;
}
}),new objj_method(sel_getUid("setBordered:"),function(_c,_d,_e){
with(_c){
if(_bordered==_e){
return;
}
_bordered=_e;
objj_msgSend(_c,"drawWellInside:",CGRectInset(objj_msgSend(_c,"bounds"),3,3));
}
}),new objj_method(sel_getUid("color"),function(_f,_10){
with(_f){
return _color;
}
}),new objj_method(sel_getUid("setColor:"),function(_11,_12,_13){
with(_11){
if(_color==_13){
return;
}
_color=_13;
objj_msgSend(_11,"drawWellInside:",CGRectInset(objj_msgSend(_11,"bounds"),3,3));
}
}),new objj_method(sel_getUid("takeColorFrom:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"setColor:",objj_msgSend(_16,"color"));
}
}),new objj_method(sel_getUid("activate:"),function(_17,_18,_19){
with(_17){
if(_19){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_17);
}
if(objj_msgSend(_17,"isActive")){
return;
}
_active=YES;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_17,sel_getUid("colorPanelDidChangeColor:"),CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("deactivate"),function(_1a,_1b){
with(_1a){
if(!objj_msgSend(_1a,"isActive")){
return;
}
_active=NO;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1a,CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isActive"),function(_1c,_1d){
with(_1c){
return _active;
}
}),new objj_method(sel_getUid("drawBezelWithHighlight:"),function(_1e,_1f,_20){
with(_1e){
}
}),new objj_method(sel_getUid("drawWellInside:"),function(_21,_22,_23){
with(_21){
if(!_wellView){
_wellView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_23);
objj_msgSend(_wellView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_21,"addSubview:",_wellView);
}else{
objj_msgSend(_wellView,"setFrame:",_23);
}
objj_msgSend(_wellView,"setBackgroundColor:",_color);
}
}),new objj_method(sel_getUid("colorPanelDidChangeColor:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"takeColorFrom:",objj_msgSend(_26,"object"));
objj_msgSend(_24,"sendAction:to:",objj_msgSend(_24,"action"),objj_msgSend(_24,"target"));
}
}),new objj_method(sel_getUid("colorWellDidBecomeExclusive:"),function(_27,_28,_29){
with(_27){
if(_27!=objj_msgSend(_29,"object")){
objj_msgSend(_27,"deactivate");
}
}
}),new objj_method(sel_getUid("colorPanelWillClose:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"deactivate");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"drawBezelWithHighlight:",YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"drawBezelWithHighlight:",CGRectContainsPoint(objj_msgSend(_30,"bounds"),objj_msgSend(_30,"convertPoint:fromView:",objj_msgSend(_32,"locationInWindow"),nil)));
}
}),new objj_method(sel_getUid("mouseUp:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"drawBezelWithHighlight:",NO);
if(!CGRectContainsPoint(objj_msgSend(_33,"bounds"),objj_msgSend(_33,"convertPoint:fromView:",objj_msgSend(_35,"locationInWindow"),nil))){
return;
}
objj_msgSend(_33,"activate:",YES);
var _36=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_36,"setColor:",_color);
objj_msgSend(_36,"orderFront:",_33);
}
})]);
var _37="CPColorWellColorKey",_38="CPColorWellBorderedKey";
var _2=objj_getClass("CPColorWell");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColorWell\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPControl")},"initWithCoder:",_3b);
if(_39){
_active=NO;
_bordered=objj_msgSend(_3b,"decodeObjectForKey:",_38);
_color=objj_msgSend(_3b,"decodeObjectForKey:",_37);
objj_msgSend(_39,"drawBezelWithHighlight:",NO);
objj_msgSend(_39,"drawWellInside:",CGRectInset(objj_msgSend(_39,"bounds"),3,3));
objj_msgSend(_39,"_registerForNotifications");
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_wellView);
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_3e);
_subviews=_3f;
objj_msgSend(_3e,"encodeObject:forKey:",_color,_37);
objj_msgSend(_3e,"encodeObject:forKey:",_bordered,_38);
}
})]);
p;17;CPCompatibility.ji;9;CPEvent.jc;3168;
CPUnknownBrowserEngine=0;
CPGeckoBrowserEngine=1;
CPInternetExplorerBrowserEngine=2;
CPKHTMLBrowserEngine=3;
CPOperaBrowserEngine=4;
CPWebKitBrowserEngine=5;
CPCSSRGBAFeature=1<<5;
CPHTMLCanvasFeature=1<<6;
CPHTMLContentEditableFeature=1<<7;
CPHTMLDragAndDropFeature=1<<8;
CPJavascriptInnerTextFeature=1<<9;
CPJavascriptTextContentFeature=1<<10;
CPJavascriptClipboardEventsFeature=1<<11;
CPJavascriptClipboardAccessFeature=1<<12;
CPJavaScriptCanvasDrawFeature=1<<13;
CPJavaScriptCanvasTransformFeature=1<<14;
CPVMLFeature=1<<15;
CPJavascriptRemedialKeySupport=1<<16;
CPJavaScriptShadowFeature=1<<20;
CPJavaScriptNegativeMouseWheelValues=1<<22;
CPJavaScriptMouseWheelValues_8_15=1<<23;
CPOpacityRequiresFilterFeature=1<<24;
CPInputTypeCanBeChangedFeature=1<<25;
var _1="",_2=CPUnknownBrowserEngine,_3=0;
_3|=CPInputTypeCanBeChangedFeature;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
_1=window.navigator.userAgent;
}
if(window.opera){
_2=CPOperaBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
}else{
if(window.attachEvent){
_2=CPInternetExplorerBrowserEngine;
_3|=CPVMLFeature;
_3|=CPJavascriptRemedialKeySupport;
_3|=CPJavaScriptShadowFeature;
_3|=CPOpacityRequiresFilterFeature;
_3&=~CPInputTypeCanBeChangedFeature;
}else{
if(_1.indexOf("AppleWebKit/")!=-1){
_2=CPWebKitBrowserEngine;
_3|=CPCSSRGBAFeature;
_3|=CPHTMLContentEditableFeature;
_3|=CPHTMLDragAndDropFeature;
_3|=CPJavascriptClipboardEventsFeature;
_3|=CPJavascriptClipboardAccessFeature;
_3|=CPJavaScriptShadowFeature;
var _4=_1.indexOf("AppleWebKit/")+"AppleWebKit/".length,_5=_1.indexOf(" ",_4),_6=_1.substring(_4,_5),_7=_6.indexOf("."),_8=parseInt(_6.substring(0,_7)),_9=parseInt(_6.substr(_7+1));
if((_1.indexOf("Safari")!==CPNotFound&&(_8>525||(_8===525&&_9>14)))||_1.indexOf("Chrome")!==CPNotFound){
_3|=CPJavascriptRemedialKeySupport;
}
}else{
if(_1.indexOf("KHTML")!=-1){
_2=CPKHTMLBrowserEngine;
}else{
if(_1.indexOf("Gecko")!==-1){
_2=CPGeckoBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
var _a=_1.indexOf("Firefox"),_b=(_a===-1)?2:parseFloat(_1.substring(_a+"Firefox".length+1));
if(_b>=3){
_3|=CPCSSRGBAFeature;
}
if(_b<3){
_3|=CPJavaScriptMouseWheelValues_8_15;
}
}
}
}
}
}
if(typeof document!="undefined"){
var _c=document.createElement("canvas");
if(_c&&_c.getContext){
_3|=CPHTMLCanvasFeature;
var _d=document.createElement("canvas").getContext("2d");
if(_d&&_d.setTransform&&_d.transform){
_3|=CPJavaScriptCanvasTransformFeature;
}
}
var _e=document.createElement("div");
if(_e.innerText!=undefined){
_3|=CPJavascriptInnerTextFeature;
}else{
if(_e.textContent!=undefined){
_3|=CPJavascriptTextContentFeature;
}
}
}
CPFeatureIsCompatible=function(_f){
return _3&_f;
};
CPBrowserIsEngine=function(_10){
return _2==_10;
};
if(_1.indexOf("Mac")!=-1){
CPPlatformActionKeyMask=CPCommandKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Z";
CPUndoKeyEquivalentModifierMask=CPCommandKeyMask;
CPRedoKeyEquivalentModifierMask=CPCommandKeyMask|CPShiftKeyMask;
}else{
CPPlatformActionKeyMask=CPControlKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Y";
CPUndoKeyEquivalentModifierMask=CPControlKeyMask;
CPRedoKeyEquivalentModifierMask=CPControlKeyMask;
}
p;11;CPControl.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;16531;
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_sendsActionOnEndEditing"),new objj_ivar("_continuousTracking"),new objj_ivar("_trackingWasWithinFrame"),new objj_ivar("_trackingMouseDownFlags"),new objj_ivar("_previousTrackingLocation"),new objj_ivar("_toolTip")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("sendsActionOnEndEditing"),function(_4,_5){
with(_4){
return _sendsActionOnEndEditing;
}
}),new objj_method(sel_getUid("setSendsActionOnEndEditing:"),function(_6,_7,_8){
with(_6){
_sendsActionOnEndEditing=_8;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPView")},"initWithFrame:",_b);
if(_9){
_sendActionOn=CPLeftMouseUpMask;
_trackingMouseDownFlags=0;
}
return _9;
}
}),new objj_method(sel_getUid("setAction:"),function(_c,_d,_e){
with(_c){
_action=_e;
}
}),new objj_method(sel_getUid("action"),function(_f,_10){
with(_f){
return _action;
}
}),new objj_method(sel_getUid("setTarget:"),function(_11,_12,_13){
with(_11){
_target=_13;
}
}),new objj_method(sel_getUid("target"),function(_14,_15){
with(_14){
return _target;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_16,_17,_18,_19){
with(_16){
objj_msgSend(CPApp,"sendAction:to:from:",_18,_19,_16);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=_sendActionOn;
_sendActionOn=_1c;
return _1d;
}
}),new objj_method(sel_getUid("isContinuous"),function(_1e,_1f){
with(_1e){
return (_sendActionOn&CPPeriodicMask)!==0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_20,_21,_22){
with(_20){
if(_22){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_23,_24){
with(_23){
return NO;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(_27,"type"),_29=objj_msgSend(_25,"convertPoint:fromView:",objj_msgSend(_27,"locationInWindow"),nil);
isWithinFrame=objj_msgSend(_25,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_25,"bounds"),_29);
if(_28===CPLeftMouseUp){
objj_msgSend(_25,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_29,YES);
_trackingMouseDownFlags=0;
}else{
if(_28===CPLeftMouseDown){
_trackingMouseDownFlags=objj_msgSend(_27,"modifierFlags");
_continuousTracking=objj_msgSend(_25,"startTrackingAt:",_29);
}else{
if(_28===CPLeftMouseDragged){
if(isWithinFrame){
if(!_trackingWasWithinFrame){
_continuousTracking=objj_msgSend(_25,"startTrackingAt:",_29);
}else{
if(_continuousTracking){
_continuousTracking=objj_msgSend(_25,"continueTracking:at:",_previousTrackingLocation,_29);
}
}
}else{
objj_msgSend(_25,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_29,NO);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_25,sel_getUid("trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
if((_sendActionOn&(1<<_28))&&isWithinFrame){
objj_msgSend(_25,"sendAction:to:",_action,_target);
}
_trackingWasWithinFrame=isWithinFrame;
_previousTrackingLocation=_29;
}
}),new objj_method(sel_getUid("setState:"),function(_2a,_2b,_2c){
with(_2a){
}
}),new objj_method(sel_getUid("nextState"),function(_2d,_2e){
with(_2d){
return 0;
}
}),new objj_method(sel_getUid("performClick:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"highlight:",YES);
objj_msgSend(_2f,"setState:",objj_msgSend(_2f,"nextState"));
objj_msgSend(_2f,"sendAction:to:",objj_msgSend(_2f,"action"),objj_msgSend(_2f,"target"));
objj_msgSend(_2f,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_32,_33){
with(_32){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_37,_38,_39,_3a){
with(_37){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_3b,_3c,_3d,_3e,_3f){
with(_3b){
objj_msgSend(_3b,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_40,_41,_42){
with(_40){
if(!objj_msgSend(_40,"isEnabled")){
return;
}
objj_msgSend(_40,"trackMouse:",_42);
}
}),new objj_method(sel_getUid("objectValue"),function(_43,_44){
with(_43){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_45,_46,_47){
with(_45){
_value=_47;
objj_msgSend(_45,"setNeedsLayout");
objj_msgSend(_45,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_48,_49){
with(_48){
var _4a=parseFloat(_value,10);
return isNaN(_4a)?0:_4a;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"setObjectValue:",_4d);
}
}),new objj_method(sel_getUid("doubleValue"),function(_4e,_4f){
with(_4e){
var _50=parseFloat(_value,10);
return isNaN(_50)?0:_50;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_51,_52,_53){
with(_51){
objj_msgSend(_51,"setObjectValue:",_53);
}
}),new objj_method(sel_getUid("intValue"),function(_54,_55){
with(_54){
var _56=parseInt(_value,10);
return isNaN(_56)?0:_56;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_57,_58,_59){
with(_57){
objj_msgSend(_57,"setObjectValue:",_59);
}
}),new objj_method(sel_getUid("integerValue"),function(_5a,_5b){
with(_5a){
var _5c=parseInt(_value,10);
return isNaN(_5c)?0:_5c;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"setObjectValue:",_5f);
}
}),new objj_method(sel_getUid("stringValue"),function(_60,_61){
with(_60){
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_62,_63,_64){
with(_62){
objj_msgSend(_62,"setObjectValue:",_64);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_65,_66,_67){
with(_65){
if(objj_msgSend(_67,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_65,"setDoubleValue:",objj_msgSend(_67,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_68,_69,_6a){
with(_68){
if(objj_msgSend(_6a,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_68,"setFloatValue:",objj_msgSend(_6a,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_6b,_6c,_6d){
with(_6b){
if(objj_msgSend(_6d,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_6b,"setIntegerValue:",objj_msgSend(_6d,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_6e,_6f,_70){
with(_6e){
if(objj_msgSend(_70,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_6e,"setIntValue:",objj_msgSend(_70,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_71,_72,_73){
with(_71){
if(objj_msgSend(_73,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_71,"setObjectValue:",objj_msgSend(_73,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_74,_75,_76){
with(_74){
if(objj_msgSend(_76,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_74,"setStringValue:",objj_msgSend(_76,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_77,_78,_79){
with(_77){
if(objj_msgSend(_79,"object")!=_77){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_77,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_79,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_7a,_7b,_7c){
with(_7a){
if(objj_msgSend(_7c,"object")!=_7a){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_7a,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_7c,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_7d,_7e,_7f){
with(_7d){
if(objj_msgSend(_7f,"object")!=_7d){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_7d,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_7f,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_80,"setValue:forThemeAttribute:",_82,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"valueForThemeAttribute:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setValue:forThemeAttribute:",_87,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_88,_89){
with(_88){
return objj_msgSend(_88,"valueForThemeAttribute:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"setValue:forThemeAttribute:",_8c,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_8d,_8e){
with(_8d){
return objj_msgSend(_8d,"valueForThemeAttribute:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"setValue:forThemeAttribute:",_91,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_92,_93){
with(_92){
return objj_msgSend(_92,"valueForThemeAttribute:","text-color");
}
}),new objj_method(sel_getUid("setFont:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"setValue:forThemeAttribute:",_96,"font");
}
}),new objj_method(sel_getUid("font"),function(_97,_98){
with(_97){
return objj_msgSend(_97,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"setValue:forThemeAttribute:",_9b,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_9c,_9d){
with(_9c){
return objj_msgSend(_9c,"valueForThemeAttribute:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"setValue:forThemeAttribute:",_a0,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_a1,"valueForThemeAttribute:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_a3,_a4,_a5){
with(_a3){
objj_msgSend(_a3,"setValue:forThemeAttribute:",_a5,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_a6,_a7){
with(_a6){
return objj_msgSend(_a6,"valueForThemeAttribute:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_a8,_a9,_aa){
with(_a8){
objj_msgSend(_a8,"setValue:forThemeAttribute:",_aa,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_ab,_ac){
with(_ab){
return objj_msgSend(_ab,"valueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_ad,_ae,_af){
with(_ad){
if(_af){
objj_msgSend(_ad,"unsetThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_ad,"setThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_b0,_b1){
with(_b0){
return !objj_msgSend(_b0,"hasThemeState:",CPThemeStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_b2,_b3,_b4){
with(_b2){
objj_msgSend(_b2,"setHighlighted:",_b4);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_b5,_b6,_b7){
with(_b5){
if(_b7){
objj_msgSend(_b5,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_b5,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("isHighlighted"),function(_b8,_b9){
with(_b8){
return objj_msgSend(_b8,"hasThemeState:",CPThemeStateHighlighted);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_ba,_bb){
with(_ba){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12),nil,{width:0,height:0},CPImageLeft,CPScaleToFit,{width:0,height:0},{width:-1,height:-1}],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling","min-size","max-size"]);
}
})]);
var _bc="CPControlValueKey",_bd="CPControlControlStateKey",_be="CPControlIsEnabledKey",_bf="CPControlTargetKey",_c0="CPControlActionKey",_c1="CPControlSendActionOnKey";
var _c2="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_c3,_c4,_c5){
with(_c3){
_c3=objj_msgSendSuper({receiver:_c3,super_class:objj_getClass("CPView")},"initWithCoder:",_c5);
if(_c3){
objj_msgSend(_c3,"setObjectValue:",objj_msgSend(_c5,"decodeObjectForKey:",_bc));
objj_msgSend(_c3,"setTarget:",objj_msgSend(_c5,"decodeObjectForKey:",_bf));
objj_msgSend(_c3,"setAction:",objj_msgSend(_c5,"decodeObjectForKey:",_c0));
objj_msgSend(_c3,"sendActionOn:",objj_msgSend(_c5,"decodeIntForKey:",_c1));
}
return _c3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c6,_c7,_c8){
with(_c6){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPView")},"encodeWithCoder:",_c8);
if(_value!==nil){
objj_msgSend(_c8,"encodeObject:forKey:",_value,_bc);
}
if(_target!==nil){
objj_msgSend(_c8,"encodeConditionalObject:forKey:",_target,_bf);
}
if(_action!==NULL){
objj_msgSend(_c8,"encodeObject:forKey:",_action,_c0);
}
objj_msgSend(_c8,"encodeInt:forKey:",_sendActionOn,_c1);
}
})]);
var _c9=[],_ca={},_cb={};
_c9[CPRegularControlSize]="Regular";
_c9[CPSmallControlSize]="Small";
_c9[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_cc){
return _c9[_cc];
};
_CPControlColorWithPatternImage=function(_cd,_ce){
var _cf=1,_d0=arguments.length,_d1="";
for(;_cf<_d0;++_cf){
_d1+=arguments[_cf];
}
var _d2=_ca[_d1];
if(!_d2){
var _d3=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_d2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:",_ce+"/"+_d1+".png"),_cd[_d1]));
_ca[_d1]=_d2;
}
return _d2;
};
_CPControlThreePartImagePattern=function(_d4,_d5,_d6){
var _d7=2,_d8=arguments.length,_d9="";
for(;_d7<_d8;++_d7){
_d9+=arguments[_d7];
}
var _da=_cb[_d9];
if(!_da){
var _db=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_dc=_d6+"/"+_d9;
_d5=_d5[_d9];
_da=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_db,"pathForResource:",_dc+"0.png"),_d5[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_db,"pathForResource:",_dc+"1.png"),_d5[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_db,"pathForResource:",_dc+"2.png"),_d5[2])],_d4));
_cb[_d9]=_da;
}
return _da;
};
p;10;CPCookie.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1385;
var _1=objj_allocateClassPair(CPObject,"CPCookie"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_cookieName"),new objj_ivar("_cookieValue"),new objj_ivar("_expires")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
_cookieName=_5;
_cookieValue=objj_msgSend(_3,"_readCookieValue");
return _3;
}
}),new objj_method(sel_getUid("value"),function(_6,_7){
with(_6){
return _cookieValue;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _cookieName;
}
}),new objj_method(sel_getUid("expires"),function(_a,_b){
with(_a){
return _expires;
}
}),new objj_method(sel_getUid("setValue:expires:domain:"),function(_c,_d,_e,_f,_10){
with(_c){
if(_f){
var _11="; expires="+_f.toGMTString();
}else{
var _11="";
}
if(_10){
_10="; domain="+_10;
}else{
_10="";
}
document.cookie=_cookieName+"="+_e+_11+"; path=/"+_10;
}
}),new objj_method(sel_getUid("_readCookieValue"),function(_12,_13){
with(_12){
var _14=_cookieName+"=";
var ca=document.cookie.split(";");
for(var i=0;i<ca.length;i++){
var c=ca[i];
while(c.charAt(0)==" "){
c=c.substring(1,c.length);
}
if(c.indexOf(_14)==0){
return c.substring(_14.length,c.length);
}
}
return "";
}
})]);
p;12;CPDocument.jI;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;13;CPSavePanel.ji;18;CPViewController.ji;20;CPWindowController.jc;18570;
CPSaveOperation=0;
CPSaveAsOperation=1;
CPSaveToOperation=2;
CPAutosaveOperation=3;
CPChangeDone=0;
CPChangeUndone=1;
CPChangeCleared=2;
CPChangeReadOtherContents=3;
CPChangeAutosaved=4;
CPDocumentWillSaveNotification="CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification="CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification="CPDocumentDidFailToSaveNotification";
var _1=0;
var _2=objj_allocateClassPair(CPResponder,"CPDocument"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_window"),new objj_ivar("_view"),new objj_ivar("_viewControllersForWindowControllers"),new objj_ivar("_fileURL"),new objj_ivar("_fileType"),new objj_ivar("_windowControllers"),new objj_ivar("_untitledDocumentIndex"),new objj_ivar("_hasUndoManager"),new objj_ivar("_undoManager"),new objj_ivar("_changeCount"),new objj_ivar("_readConnection"),new objj_ivar("_writeRequest"),new objj_ivar("_canCloseAlert")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPResponder")},"init");
if(_4){
_windowControllers=[];
_viewControllersForWindowControllers=objj_msgSend(CPDictionary,"dictionary");
_hasUndoManager=YES;
_changeCount=0;
objj_msgSend(_4,"setNextResponder:",CPApp);
}
return _4;
}
}),new objj_method(sel_getUid("initWithType:error:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSend(_6,"init");
if(_6){
objj_msgSend(_6,"setFileType:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSend(_a,"init");
if(_a){
objj_msgSend(_a,"setFileURL:",_c);
objj_msgSend(_a,"setFileType:",_d);
objj_msgSend(_a,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_c,_d,_e,_f,_10);
}
return _a;
}
}),new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_11,_12,_13,_14,_15,_16,_17,_18){
with(_11){
_11=objj_msgSend(_11,"init");
if(_11){
objj_msgSend(_11,"setFileURL:",_13);
objj_msgSend(_11,"setFileType:",_15);
objj_msgSend(_11,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_14,_15,_16,_17,_18);
}
return _11;
}
}),new objj_method(sel_getUid("dataOfType:error:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataOfType:error: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("readFromData:ofType:error:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"readFromData:ofType: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("viewControllerWillLoadCib:"),function(_22,_23,_24){
with(_22){
}
}),new objj_method(sel_getUid("viewControllerDidLoadCib:"),function(_25,_26,_27){
with(_25){
}
}),new objj_method(sel_getUid("firstEligibleExistingWindowController"),function(_28,_29){
with(_28){
return nil;
}
}),new objj_method(sel_getUid("makeWindowControllers"),function(_2a,_2b){
with(_2a){
objj_msgSend(_2a,"makeViewAndWindowControllers");
}
}),new objj_method(sel_getUid("makeViewAndWindowControllers"),function(_2c,_2d){
with(_2c){
var _2e=objj_msgSend(_2c,"viewCibName"),_2f=nil,_30=nil;
if(objj_msgSend(_2e,"length")){
_2f=objj_msgSend(objj_msgSend(CPViewController,"alloc"),"initWithCibName:bundle:owner:",_2e,nil,_2c);
}
if(_2f){
_30=objj_msgSend(_2c,"firstEligibleExistingWindowController");
}
if(!_30){
var _31=objj_msgSend(_2c,"windowCibName");
if(objj_msgSend(_31,"length")){
_30=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindowCibName:owner:",_31,_2c);
}else{
if(_2f){
var _32=objj_msgSend(_2f,"view"),_33=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(_32,"frame"),CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask);
_30=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindow:",_33);
}
}
}
if(_30&&_2f){
objj_msgSend(_30,"setSupportsMultipleDocuments:",YES);
}
if(_30){
objj_msgSend(_2c,"addWindowController:",_30);
}
if(_2f){
objj_msgSend(_2c,"addViewController:forWindowController:",_2f,_30);
}
}
}),new objj_method(sel_getUid("windowControllers"),function(_34,_35){
with(_34){
return _windowControllers;
}
}),new objj_method(sel_getUid("addWindowController:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_windowControllers,"addObject:",_38);
if(objj_msgSend(_38,"document")!==_36){
objj_msgSend(_38,"setDocument:",_36);
}
}
}),new objj_method(sel_getUid("removeWindowController:"),function(_39,_3a,_3b){
with(_39){
if(_3b){
objj_msgSend(_windowControllers,"removeObject:",_3b);
}
if(objj_msgSend(_3b,"document")===_39){
objj_msgSend(_3b,"setDocument:",nil);
}
}
}),new objj_method(sel_getUid("view"),function(_3c,_3d){
with(_3c){
return _view;
}
}),new objj_method(sel_getUid("viewControllers"),function(_3e,_3f){
with(_3e){
return objj_msgSend(_viewControllersForWindowControllers,"allValues");
}
}),new objj_method(sel_getUid("addViewController:forWindowController:"),function(_40,_41,_42,_43){
with(_40){
objj_msgSend(_viewControllersForWindowControllers,"setObject:forKey:",_42,objj_msgSend(_43,"UID"));
if(objj_msgSend(_43,"document")===_40){
objj_msgSend(_43,"setViewController:",_42);
}
}
}),new objj_method(sel_getUid("removeViewController:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_viewControllersForWindowControllers,"removeObject:",_46);
}
}),new objj_method(sel_getUid("viewControllerForWindowController:"),function(_47,_48,_49){
with(_47){
return objj_msgSend(_viewControllersForWindowControllers,"objectForKey:",objj_msgSend(_49,"UID"));
}
}),new objj_method(sel_getUid("showWindows"),function(_4a,_4b){
with(_4a){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocument:"),_4a);
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("showWindow:"),_4a);
}
}),new objj_method(sel_getUid("displayName"),function(_4c,_4d){
with(_4c){
if(_fileURL){
return objj_msgSend(_fileURL,"lastPathComponent");
}
if(!_untitledDocumentIndex){
_untitledDocumentIndex=++_1;
}
if(_untitledDocumentIndex==1){
return "Untitled";
}
return "Untitled "+_untitledDocumentIndex;
}
}),new objj_method(sel_getUid("viewCibName"),function(_4e,_4f){
with(_4e){
return nil;
}
}),new objj_method(sel_getUid("windowCibName"),function(_50,_51){
with(_50){
return nil;
}
}),new objj_method(sel_getUid("windowControllerDidLoadCib:"),function(_52,_53,_54){
with(_52){
}
}),new objj_method(sel_getUid("windowControllerWillLoadCib:"),function(_55,_56,_57){
with(_55){
}
}),new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"),function(_58,_59,_5a,_5b,_5c,_5d,_5e){
with(_58){
objj_msgSend(_readConnection,"cancel");
_readConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_5a),_58);
_readConnection.session=_5f(_5b,_5c,_5d,_5e);
}
}),new objj_method(sel_getUid("fileURL"),function(_60,_61){
with(_60){
return _fileURL;
}
}),new objj_method(sel_getUid("setFileURL:"),function(_62,_63,_64){
with(_62){
if(_fileURL===_64){
return;
}
_fileURL=_64;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:",sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}),new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"),function(_65,_66,_67,_68,_69,_6a,_6b,_6c){
with(_65){
var _6d=objj_msgSend(_65,"dataOfType:error:",objj_msgSend(_65,"fileType"),nil),_6e=_changeCount;
_writeRequest=objj_msgSend(CPURLRequest,"requestWithURL:",_67);
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_writeRequest,"setHTTPMethod:","POST");
}else{
objj_msgSend(_writeRequest,"setHTTPMethod:","PUT");
}
objj_msgSend(_writeRequest,"setHTTPBody:",objj_msgSend(_6d,"string"));
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","close","Connection");
if(_69==CPSaveOperation){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
}
if(_69!=CPSaveToOperation){
objj_msgSend(_65,"updateChangeCount:",CPChangeCleared);
}
var _6f=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_writeRequest,_65);
_6f.session=_70(_67,_69,_6e,_6a,_6b,_6c,_6f);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_71,_72,_73,_74){
with(_71){
if(!objj_msgSend(_74,"isKindOfClass:",objj_msgSend(CPHTTPURLResponse,"class"))){
return;
}
var _75=objj_msgSend(_74,"statusCode");
if(_75===200){
return;
}
var _76=_73.session;
if(_73==_readConnection){
objj_msgSend(_73,"cancel");
alert("There was an error retrieving the document.");
objj_msgSend(_76.delegate,_76.didReadSelector,_71,NO,_76.contextInfo);
}else{
if(_75==409){
objj_msgSend(_73,"cancel");
if(confirm("There already exists a file with that name, would you like to overwrite it?")){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
objj_msgSend(_73,"start");
}else{
if(_76.saveOperation!=CPSaveToOperation){
_changeCount+=_76.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_71,"isDocumentEdited"));
}
_writeRequest=nil;
objj_msgSend(_76.delegate,_76.didSaveSelector,_71,NO,_76.contextInfo);
objj_msgSend(_71,"_sendDocumentSavedNotification:",NO);
}
}
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_77,_78,_79,_7a){
with(_77){
var _7b=_79.session;
if(_79==_readConnection){
objj_msgSend(_77,"readFromData:ofType:error:",objj_msgSend(CPData,"dataWithString:",_7a),_7b.fileType,nil);
objj_msgSend(_7b.delegate,_7b.didReadSelector,_77,YES,_7b.contextInfo);
}else{
if(_7b.saveOperation!=CPSaveToOperation){
objj_msgSend(_77,"setFileURL:",_7b.absoluteURL);
}
_writeRequest=nil;
objj_msgSend(_7b.delegate,_7b.didSaveSelector,_77,YES,_7b.contextInfo);
objj_msgSend(_77,"_sendDocumentSavedNotification:",YES);
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_7c,_7d,_7e,_7f){
with(_7c){
var _80=_7e.session;
if(_readConnection==_7e){
objj_msgSend(_80.delegate,_80.didReadSelector,_7c,NO,_80.contextInfo);
}else{
if(_80.saveOperation!=CPSaveToOperation){
_changeCount+=_80.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_7c,"isDocumentEdited"));
}
_writeRequest=nil;
alert("There was an error saving the document.");
objj_msgSend(_80.delegate,_80.didSaveSelector,_7c,NO,_80.contextInfo);
objj_msgSend(_7c,"_sendDocumentSavedNotification:",NO);
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_81,_82,_83){
with(_81){
if(_readConnection==_83){
_readConnection=nil;
}
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_84,_85){
with(_84){
return _changeCount!=0;
}
}),new objj_method(sel_getUid("updateChangeCount:"),function(_86,_87,_88){
with(_86){
if(_88==CPChangeDone){
++_changeCount;
}else{
if(_88==CPChangeUndone){
--_changeCount;
}else{
if(_88==CPChangeCleared){
_changeCount=0;
}
}
}
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_86,"isDocumentEdited"));
}
}),new objj_method(sel_getUid("setFileType:"),function(_89,_8a,_8b){
with(_89){
_fileType=_8b;
}
}),new objj_method(sel_getUid("fileType"),function(_8c,_8d){
with(_8c){
return _fileType;
}
}),new objj_method(sel_getUid("hasUndoManager"),function(_8e,_8f){
with(_8e){
return _hasUndoManager;
}
}),new objj_method(sel_getUid("setHasUndoManager:"),function(_90,_91,_92){
with(_90){
if(_hasUndoManager==_92){
return;
}
_hasUndoManager=_92;
if(!_hasUndoManager){
objj_msgSend(_90,"setUndoManager:",nil);
}
}
}),new objj_method(sel_getUid("_undoManagerWillCloseGroup:"),function(_93,_94,_95){
with(_93){
var _96=objj_msgSend(_95,"object");
if(objj_msgSend(_96,"isUndoing")||objj_msgSend(_96,"isRedoing")){
return;
}
objj_msgSend(_93,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("_undoManagerDidUndoChange:"),function(_97,_98,_99){
with(_97){
objj_msgSend(_97,"updateChangeCount:",CPChangeUndone);
}
}),new objj_method(sel_getUid("_undoManagerDidRedoChange:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_9a,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_undoManager){
objj_msgSend(_a0,"removeObserver:name:object:",_9d,CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_a0,"removeObserver:name:object:",_9d,CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_a0,"removeObserver:name:object:",_9d,CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
_undoManager=_9f;
if(_undoManager){
objj_msgSend(_a0,"addObserver:selector:name:object:",_9d,sel_getUid("_undoManagerDidUndoChange:"),CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_a0,"addObserver:selector:name:object:",_9d,sel_getUid("_undoManagerDidRedoChange:"),CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_a0,"addObserver:selector:name:object:",_9d,sel_getUid("_undoManagerWillCloseGroup:"),CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
}
}),new objj_method(sel_getUid("undoManager"),function(_a1,_a2){
with(_a1){
if(_hasUndoManager&&!_undoManager){
objj_msgSend(_a1,"setUndoManager:",objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init"));
}
return _undoManager;
}
}),new objj_method(sel_getUid("windowWillReturnUndoManager:"),function(_a3,_a4,_a5){
with(_a3){
return objj_msgSend(_a3,"undoManager");
}
}),new objj_method(sel_getUid("saveDocument:"),function(_a6,_a7,_a8){
with(_a6){
objj_msgSend(_a6,"saveDocumentWithDelegate:didSaveSelector:contextInfo:",nil,nil,nil);
}
}),new objj_method(sel_getUid("saveDocumentWithDelegate:didSaveSelector:contextInfo:"),function(_a9,_aa,_ab,_ac,_ad){
with(_a9){
if(_fileURL){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_a9);
objj_msgSend(_a9,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_fileURL,objj_msgSend(_a9,"fileType"),CPSaveOperation,_ab,_ac,_ad);
}else{
objj_msgSend(_a9,"_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:",_ab,_ac,_ad);
}
}
}),new objj_method(sel_getUid("saveDocumentAs:"),function(_ae,_af,_b0){
with(_ae){
objj_msgSend(_ae,"_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:",nil,nil,nil);
}
}),new objj_method(sel_getUid("_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:"),function(_b1,_b2,_b3,_b4,_b5){
with(_b1){
var _b6=objj_msgSend(CPSavePanel,"savePanel"),_b7=objj_msgSend(_b6,"runModal");
if(!_b7){
return;
}
var _b8=objj_msgSend(_b6,"URL");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_b1);
objj_msgSend(_b1,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_b8,objj_msgSend(_b1,"fileType"),CPSaveAsOperation,_b3,_b4,_b5);
}
}),new objj_method(sel_getUid("_sendDocumentSavedNotification:"),function(_b9,_ba,_bb){
with(_b9){
if(_bb){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidSaveNotification,_b9);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidFailToSaveNotification,_b9);
}
}
})]);
var _2=objj_getClass("CPDocument");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDocument\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("close"),function(_bc,_bd){
with(_bc){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("removeDocumentAndCloseIfNecessary:"),_bc);
objj_msgSend(objj_msgSend(CPDocumentController,"sharedDocumentController"),"removeDocument:",_bc);
}
}),new objj_method(sel_getUid("shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:"),function(_be,_bf,_c0,_c1,_c2,_c3){
with(_be){
if(objj_msgSend(_c0,"shouldCloseDocument")||(objj_msgSend(_windowControllers,"count")<2&&objj_msgSend(_windowControllers,"indexOfObject:",_c0)!==CPNotFound)){
objj_msgSend(_be,"canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:",_be,sel_getUid("_document:shouldClose:context:"),{delegate:_c1,selector:_c2,context:_c3});
}else{
if(objj_msgSend(_c1,"respondsToSelector:",_c2)){
objj_msgSend(_c1,_c2,_be,YES,_c3);
}
}
}
}),new objj_method(sel_getUid("_document:shouldClose:context:"),function(_c4,_c5,_c6,_c7,_c8){
with(_c4){
if(_c6===_c4&&_c7){
objj_msgSend(_c4,"close");
}
objj_msgSend(_c8.delegate,_c8.selector,_c6,_c7,_c8.context);
}
}),new objj_method(sel_getUid("canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:"),function(_c9,_ca,_cb,_cc,_cd){
with(_c9){
if(!objj_msgSend(_c9,"isDocumentEdited")){
return objj_msgSend(_cb,"respondsToSelector:",_cc)&&objj_msgSend(_cb,_cc,_c9,YES,_cd);
}
_canCloseAlert=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_canCloseAlert,"setDelegate:",_c9);
objj_msgSend(_canCloseAlert,"setAlertStyle:",CPWarningAlertStyle);
objj_msgSend(_canCloseAlert,"setTitle:","Unsaved Document");
objj_msgSend(_canCloseAlert,"setMessageText:",sprintf("Do you want to save the changes you've made to the document \"%@\"?",objj_msgSend(_c9,"displayName")||objj_msgSend(_c9,"fileName")));
objj_msgSend(_canCloseAlert,"addButtonWithTitle:","Save");
objj_msgSend(_canCloseAlert,"addButtonWithTitle:","Cancel");
objj_msgSend(_canCloseAlert,"addButtonWithTitle:","Don't Save");
_canCloseAlert._context={delegate:_cb,selector:_cc,context:_cd};
objj_msgSend(_canCloseAlert,"runModal");
}
}),new objj_method(sel_getUid("alertDidEnd:returnCode:"),function(_ce,_cf,_d0,_d1){
with(_ce){
if(_d0!==_canCloseAlert){
return;
}
var _d2=_d0._context.delegate,_d3=_d0._context.selector,_d4=_d0._context.context;
if(_d1===0){
objj_msgSend(_ce,"saveDocumentWithDelegate:didSaveSelector:contextInfo:",_d2,_d3,_d4);
}else{
objj_msgSend(_d2,_d3,_ce,_d1===2,_d4);
}
_canCloseAlert=nil;
}
})]);
var _5f=function(_d5,_d6,_d7,_d8){
return {fileType:_d5,delegate:_d6,didReadSelector:_d7,contextInfo:_d8};
};
var _70=function(_d9,_da,_db,_dc,_dd,_de,_df){
return {absoluteURL:_d9,saveOperation:_da,changeCount:_db,delegate:_dc,didSaveSelector:_dd,contextInfo:_de,connection:_df};
};
p;22;CPDocumentController.jI;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.ji;13;CPOpenPanel.jc;9456;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPDocumentController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_documents"),new objj_ivar("_documentTypes")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_documents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
if(!_1){
_1=_4;
}
_documentTypes=objj_msgSend(objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"infoDictionary"),"objectForKey:","CPBundleDocumentTypes");
}
return _4;
}
}),new objj_method(sel_getUid("documentForURL:"),function(_6,_7,_8){
with(_6){
var _9=0,_a=objj_msgSend(_documents,"count");
for(;_9<_a;++_9){
var _b=_documents[_9];
if(objj_msgSend(objj_msgSend(_b,"fileURL"),"isEqual:",_8)){
return _b;
}
}
return nil;
}
}),new objj_method(sel_getUid("openUntitledDocumentOfType:display:"),function(_c,_d,_e,_f){
with(_c){
var _10=objj_msgSend(_c,"makeUntitledDocumentOfType:error:",_e,nil);
if(_10){
objj_msgSend(_c,"addDocument:",_10);
}
if(_f){
objj_msgSend(_10,"makeWindowControllers");
objj_msgSend(_10,"showWindows");
}
return _10;
}
}),new objj_method(sel_getUid("makeUntitledDocumentOfType:error:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSend(objj_msgSend(objj_msgSend(_11,"documentClassForType:",_13),"alloc"),"initWithType:error:",_13,_14);
}
}),new objj_method(sel_getUid("openDocumentWithContentsOfURL:display:error:"),function(_15,_16,_17,_18,_19){
with(_15){
var _1a=objj_msgSend(_15,"documentForURL:",_17);
if(!_1a){
var _1b=objj_msgSend(_15,"typeForContentsOfURL:error:",_17,_19);
_1a=objj_msgSend(_15,"makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_17,_1b,_15,sel_getUid("document:didRead:contextInfo:"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_18,"shouldDisplay"));
if(_1a){
objj_msgSend(_15,"noteNewRecentDocument:",_1a);
}
}else{
if(_18){
objj_msgSend(_1a,"showWindows");
}
}
return _1a;
}
}),new objj_method(sel_getUid("reopenDocumentForURL:withContentsOfURL:error:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(_1c,"makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_1e,_1f,objj_msgSend(objj_msgSend(_documentTypes,"objectAtIndex:",0),"objectForKey:","CPBundleTypeName"),_1c,sel_getUid("document:didRead:contextInfo:"),nil);
}
}),new objj_method(sel_getUid("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_21,_22,_23,_24,_25,_26,_27){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_21,"documentClassForType:",_24),"alloc"),"initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_23,_24,_25,_26,_27);
}
}),new objj_method(sel_getUid("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_28,_29,_2a,_2b,_2c,_2d,_2e,_2f){
with(_28){
return objj_msgSend(objj_msgSend(objj_msgSend(_28,"documentClassForType:",_2c),"alloc"),"initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_2a,_2b,_2c,_2d,_2e,_2f);
}
}),new objj_method(sel_getUid("document:didRead:contextInfo:"),function(_30,_31,_32,_33,_34){
with(_30){
if(!_33){
return;
}
objj_msgSend(_30,"addDocument:",_32);
objj_msgSend(_32,"makeWindowControllers");
if(objj_msgSend(_34,"objectForKey:","shouldDisplay")){
objj_msgSend(_32,"showWindows");
}
}
}),new objj_method(sel_getUid("newDocument:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"openUntitledDocumentOfType:display:",objj_msgSend(objj_msgSend(_documentTypes,"objectAtIndex:",0),"objectForKey:","CPBundleTypeName"),YES);
}
}),new objj_method(sel_getUid("openDocument:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(CPOpenPanel,"openPanel");
objj_msgSend(_3b,"runModal");
var _3c=objj_msgSend(_3b,"URLs"),_3d=0,_3e=objj_msgSend(_3c,"count");
for(;_3d<_3e;++_3d){
objj_msgSend(_38,"openDocumentWithContentsOfURL:display:error:",objj_msgSend(CPURL,"URLWithString:",_3c[_3d]),YES,nil);
}
}
}),new objj_method(sel_getUid("documents"),function(_3f,_40){
with(_3f){
return _documents;
}
}),new objj_method(sel_getUid("addDocument:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_documents,"addObject:",_43);
}
}),new objj_method(sel_getUid("removeDocument:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_documents,"removeObjectIdenticalTo:",_46);
}
}),new objj_method(sel_getUid("defaultType"),function(_47,_48){
with(_47){
return objj_msgSend(_documentTypes[0],"objectForKey:","CPBundleTypeName");
}
}),new objj_method(sel_getUid("typeForContentsOfURL:error:"),function(_49,_4a,_4b,_4c){
with(_49){
var _4d=0,_4e=_documentTypes.length,_4f=objj_msgSend(objj_msgSend(_4b,"pathExtension"),"lowercaseString");
for(;_4d<_4e;++_4d){
var _50=_documentTypes[_4d],_51=objj_msgSend(_50,"objectForKey:","CFBundleTypeExtensions"),_52=0,_53=_51.length;
for(;_52<_53;++_52){
if(objj_msgSend(_51[_52],"lowercaseString")==_4f){
return objj_msgSend(_50,"objectForKey:","CPBundleTypeName");
}
}
}
return objj_msgSend(_49,"defaultType");
}
}),new objj_method(sel_getUid("_infoForType:"),function(_54,_55,_56){
with(_54){
var i=0,_57=objj_msgSend(_documentTypes,"count");
for(;i<_57;++i){
var _58=_documentTypes[i];
if(objj_msgSend(_58,"objectForKey:","CPBundleTypeName")==_56){
return _58;
}
}
return nil;
}
}),new objj_method(sel_getUid("documentClassForType:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(objj_msgSend(_59,"_infoForType:",_5b),"objectForKey:","CPDocumentClass");
return _5c?CPClassFromString(_5c):nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedDocumentController"),function(_5d,_5e){
with(_5d){
if(!_1){
objj_msgSend(objj_msgSend(_5d,"alloc"),"init");
}
return _1;
}
})]);
var _2=objj_getClass("CPDocumentController");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDocumentController\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("closeAllDocumentsWithDelegate:didCloseAllSelector:contextInfo:"),function(_5f,_60,_61,_62,_63){
with(_5f){
var _64={delegate:_61,selector:_62,context:_63};
objj_msgSend(_5f,"_closeDocumentsStartingWith:shouldClose:context:",nil,YES,_64);
}
}),new objj_method(sel_getUid("_closeDocumentsStartingWith:shouldClose:context:"),function(_65,_66,_67,_68,_69){
with(_65){
if(_68){
objj_msgSend(_67,"close");
if(objj_msgSend(objj_msgSend(_65,"documents"),"count")>0){
objj_msgSend(objj_msgSend(objj_msgSend(_65,"documents"),"lastObject"),"canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:",_65,sel_getUid("_closeDocumentsStartingWith:shouldClose:context:"),_69);
return;
}
}
if(objj_msgSend(_69.delegate,"respondsToSelector:",_69.selector)){
objj_msgSend(_69.delegate,_69.selector,_65,objj_msgSend(objj_msgSend(_65,"documents"),"count")===0,_69.context);
}
}
})]);
var _2=objj_getClass("CPDocumentController");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDocumentController\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("recentDocumentURLs"),function(_6a,_6b){
with(_6a){
if(typeof window["cpRecentDocumentURLs"]==="function"){
return window.cpRecentDocumentURLs();
}
return [];
}
}),new objj_method(sel_getUid("clearRecentDocuments:"),function(_6c,_6d,_6e){
with(_6c){
if(typeof window["cpClearRecentDocuments"]==="function"){
window.cpClearRecentDocuments();
}
objj_msgSend(_6c,"_updateRecentDocumentsMenu");
}
}),new objj_method(sel_getUid("noteNewRecentDocument:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_6f,"noteNewRecentDocumentURL:",objj_msgSend(objj_msgSend(_71,"fileURL"),"absoluteString"));
}
}),new objj_method(sel_getUid("noteNewRecentDocumentURL:"),function(_72,_73,_74){
with(_72){
if(typeof window["cpNoteNewRecentDocumentPath"]==="function"){
window.cpNoteNewRecentDocumentPath(_74);
}
objj_msgSend(_72,"_updateRecentDocumentsMenu");
}
}),new objj_method(sel_getUid("_removeAllRecentDocumentsFromMenu:"),function(_75,_76,_77){
with(_75){
var _78=objj_msgSend(_77,"itemArray"),_79=objj_msgSend(_78,"count");
while(_79--){
var _7a=_78[_79];
if(objj_msgSend(_7a,"action")===sel_getUid("_openRecentDocument:")){
objj_msgSend(_77,"removeItemAtIndex:",_79);
}
}
}
}),new objj_method(sel_getUid("_updateRecentDocumentsMenu"),function(_7b,_7c){
with(_7b){
var _7d=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"_menuWithName:","_CPRecentDocumentsMenu"),_7e=objj_msgSend(_7b,"recentDocumentURLs"),_7f=objj_msgSend(_7d,"itemArray"),_80=objj_msgSend(_7e,"count"),_81=objj_msgSend(_7f,"count");
objj_msgSend(_7b,"_removeAllRecentDocumentsFromMenu:",_7d);
if(_81){
if(!_80){
if(objj_msgSend(_7f[0],"isSeparatorItem")){
objj_msgSend(_7d,"removeItemAtIndex:",0);
}
}else{
if(!objj_msgSend(_7f[0],"isSeparatorItem")){
objj_msgSend(_7d,"insertItem:atIndex:",objj_msgSend(CPMenuItem,"separatorItem"),0);
}
}
}
while(_80--){
var _82=_7e[_80],_83=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_82,"lastPathComponent"),sel_getUid("_openRecentDocument:"),nil);
objj_msgSend(_83,"setTag:",_82);
objj_msgSend(_7d,"insertItem:atIndex:",_83,0);
}
}
}),new objj_method(sel_getUid("_openRecentDocument:"),function(_84,_85,_86){
with(_84){
objj_msgSend(_84,"openDocumentWithContentsOfURL:display:error:",objj_msgSend(_86,"tag"),YES,nil);
}
})]);
p;14;CPDragServer.jI;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;11956;
CPDragOperationNone=0,CPDragOperationCopy=1<<1,CPDragOperationLink=1<<1,CPDragOperationGeneric=1<<2,CPDragOperationPrivate=1<<3,CPDragOperationMove=1<<4,CPDragOperationDelete=1<<5,CPDragOperationEvery=-1;
var _1=nil,_2=nil;
var _3=nil;
var _4=nil;
var _5=nil;
var _6=objj_allocateClassPair(CPObject,"CPDraggingInfo"),_7=_6.isa;
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("draggingPasteboard"),function(_8,_9){
with(_8){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
return objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
}
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingPasteboard");
}
}),new objj_method(sel_getUid("draggingSource"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingSource");
}
}),new objj_method(sel_getUid("draggingLocation"),function(_c,_d){
with(_c){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingLocation");
}
}),new objj_method(sel_getUid("draggingDestinationWindow"),function(_e,_f){
with(_e){
return (objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"),"isKindOfClass:",objj_msgSend(CPWindow,"class"))?objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"):objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"),"window"));
}
}),new objj_method(sel_getUid("draggedImage"),function(_10,_11){
with(_10){
return objj_msgSend(objj_msgSend(_10,"draggedView"),"image");
}
}),new objj_method(sel_getUid("draggedImageLocation"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"draggedViewLocation");
}
}),new objj_method(sel_getUid("draggedView"),function(_14,_15){
with(_14){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggedView");
}
}),new objj_method(sel_getUid("draggedViewLocation"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPDragServer,"sharedDragServer");
return objj_msgSend((objj_msgSend(objj_msgSend(_18,"draggingDestination"),"isKindOfClass:",objj_msgSend(CPWindow,"class"))?objj_msgSend(_18,"draggingDestination"):objj_msgSend(objj_msgSend(_18,"draggingDestination"),"window")),"convertPlatformWindowToBase:",objj_msgSend(objj_msgSend(_18,"draggedView"),"frame").origin);
}
})]);
var _19=1<<0,_1a=1<<1,_1b=1<<2,_1c=1<<3;
var _6=objj_allocateClassPair(CPObject,"CPDragServer"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_isDragging"),new objj_ivar("_draggedWindow"),new objj_ivar("_draggedView"),new objj_ivar("_imageView"),new objj_ivar("_isDraggingImage"),new objj_ivar("_draggingOffset"),new objj_ivar("_draggingPasteboard"),new objj_ivar("_draggingSource"),new objj_ivar("_implementedDraggingSourceMethods"),new objj_ivar("_draggingLocation"),new objj_ivar("_draggingDestination")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("isDragging"),function(_1d,_1e){
with(_1d){
return _isDragging;
}
}),new objj_method(sel_getUid("draggedWindow"),function(_1f,_20){
with(_1f){
return _draggedWindow;
}
}),new objj_method(sel_getUid("draggedView"),function(_21,_22){
with(_21){
return _draggedView;
}
}),new objj_method(sel_getUid("draggingOffset"),function(_23,_24){
with(_23){
return _draggingOffset;
}
}),new objj_method(sel_getUid("draggingPasteboard"),function(_25,_26){
with(_25){
return _draggingPasteboard;
}
}),new objj_method(sel_getUid("draggingSource"),function(_27,_28){
with(_27){
return _draggingSource;
}
}),new objj_method(sel_getUid("init"),function(_29,_2a){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPObject")},"init");
if(_29){
_draggedWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",{origin:{x:0,y:0},size:{width:0,height:0}},CPBorderlessWindowMask);
objj_msgSend(_draggedWindow,"setLevel:",CPDraggingWindowLevel);
}
return _29;
}
}),new objj_method(sel_getUid("draggingLocation"),function(_2b,_2c){
with(_2b){
return _draggingLocation;
}
}),new objj_method(sel_getUid("draggingStartedInPlatformWindow:globalLocation:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(_isDraggingImage){
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:beganAt:"))){
objj_msgSend(_draggingSource,"draggedImage:beganAt:",objj_msgSend(_draggedView,"image"),_30);
}
}else{
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:beganAt:"))){
objj_msgSend(_draggingSource,"draggedView:beganAt:",_draggedView,_30);
}
}
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"orderFront:",_2d);
}
}
}),new objj_method(sel_getUid("draggingSourceUpdatedWithGlobalLocation:"),function(_31,_32,_33){
with(_31){
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"setFrameOrigin:",{x:_33.x-_draggingOffset.width,y:_33.y-_draggingOffset.height});
}
if(_implementedDraggingSourceMethods&_19){
objj_msgSend(_draggingSource,"draggedImage:movedTo:",objj_msgSend(_draggedView,"image"),_33);
}else{
if(_implementedDraggingSourceMethods&_1b){
objj_msgSend(_draggingSource,"draggedView:movedTo:",_draggedView,_33);
}
}
}
}),new objj_method(sel_getUid("draggingUpdatedInPlatformWindow:location:"),function(_34,_35,_36,_37){
with(_34){
var _38=CPDragOperationCopy;
var _39=objj_msgSend(_36,"_dragHitTest:pasteboard:",_37,objj_msgSend(_5,"draggingPasteboard"));
if(_39){
_draggingLocation=objj_msgSend((objj_msgSend(_39,"isKindOfClass:",objj_msgSend(CPWindow,"class"))?_39:objj_msgSend(_39,"window")),"convertPlatformWindowToBase:",_37);
}
if(_39!==_draggingDestination){
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingExited:"))){
objj_msgSend(_draggingDestination,"draggingExited:",_5);
}
_draggingDestination=_39;
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingEntered:"))){
_38=objj_msgSend(_draggingDestination,"draggingEntered:",_5);
}
}else{
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingUpdated:"))){
_38=objj_msgSend(_draggingDestination,"draggingUpdated:",_5);
}
}
if(!_draggingDestination){
_38=CPDragOperationNone;
}
return _38;
}
}),new objj_method(sel_getUid("draggingEndedInPlatformWindow:globalLocation:"),function(_3a,_3b,_3c,_3d){
with(_3a){
objj_msgSend(_draggedView,"removeFromSuperview");
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"orderOut:",_3a);
}
if(_implementedDraggingSourceMethods&_1a){
objj_msgSend(_draggingSource,"draggedImage:endedAt:operation:",objj_msgSend(_draggedView,"image"),_3d,NO);
}else{
if(_implementedDraggingSourceMethods&_1c){
objj_msgSend(_draggingSource,"draggedView:endedAt:operation:",_draggedView,_3d,NO);
}
}
_isDragging=NO;
}
}),new objj_method(sel_getUid("performDragOperationInPlatformWindow:"),function(_3e,_3f,_40){
with(_3e){
if(_draggingDestination&&(!objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("prepareForDragOperation:"))||objj_msgSend(_draggingDestination,"prepareForDragOperation:",_5))&&(!objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("performDragOperation:"))||objj_msgSend(_draggingDestination,"performDragOperation:",_5))&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("concludeDragOperation:"))){
objj_msgSend(_draggingDestination,"concludeDragOperation:",_5);
}
}
}),new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_41,_42,_43,_44,_45,_46,_47,_48,_49,_4a){
with(_41){
_isDragging=YES;
_draggedView=_43;
_draggingPasteboard=_48||objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
_draggingSource=_49;
_draggingDestination=nil;
var _4b=objj_msgSend(_47,"window"),_4c=objj_msgSend(_47,"locationInWindow");
if(_4c){
if(_4b){
_4c=objj_msgSend(_4b,"convertBaseToGlobal:",_4c);
}
_draggingOffset={width:_4c.x-_45.x,height:_4c.y-_45.y};
}else{
_draggingOffset=_CGSizeMakerZero();
}
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_draggedWindow,"setPlatformWindow:",objj_msgSend(_44,"platformWindow"));
}
objj_msgSend(_43,"setFrameOrigin:",{x:0,y:0});
var _4d=objj_msgSend(CPEvent,"mouseLocation");
objj_msgSend(_draggedWindow,"setFrameOrigin:",{x:_4d.x-_draggingOffset.width,y:_4d.y-_draggingOffset.height});
objj_msgSend(_draggedWindow,"setFrameSize:",objj_msgSend(_43,"frame").size);
objj_msgSend(objj_msgSend(_draggedWindow,"contentView"),"addSubview:",_43);
_implementedDraggingSourceMethods=0;
if(_draggedView===_imageView){
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:movedTo:"))){
_implementedDraggingSourceMethods|=_19;
}
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:endAt:operation:"))){
_implementedDraggingSourceMethods|=_1a;
}
}else{
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:movedTo:"))){
_implementedDraggingSourceMethods|=_1b;
}
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:endedAt:operation:"))){
_implementedDraggingSourceMethods|=_1c;
}
}
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_41,"draggingStartedInPlatformWindow:globalLocation:",objj_msgSend(_44,"platformWindow"),_4d);
objj_msgSend(_41,"trackDragging:",_47);
}
}
}),new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_4e,_4f,_50,_51,_52,_53,_54,_55,_56,_57){
with(_4e){
_isDraggingImage=YES;
var _58=objj_msgSend(_50,"size");
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:_58.width,height:_58.height}});
}
objj_msgSend(_imageView,"setImage:",_50);
objj_msgSend(_4e,"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_imageView,_51,_52,_53,_54,_55,_56,_57);
}
}),new objj_method(sel_getUid("trackDragging:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(_5b,"type"),_5d=objj_msgSend(_draggedWindow,"platformWindow"),_5e=objj_msgSend(objj_msgSend(_5b,"window"),"convertBaseToPlatformWindow:",objj_msgSend(_5b,"locationInWindow"));
if(_5c===CPLeftMouseUp){
objj_msgSend(_59,"performDragOperationInPlatformWindow:",_5d);
objj_msgSend(_59,"draggingEndedInPlatformWindow:globalLocation:",_5d,_5e);
return;
}
objj_msgSend(_59,"draggingSourceUpdatedWithGlobalLocation:",_5e);
objj_msgSend(_59,"draggingUpdatedInPlatformWindow:location:",_5d,_5e);
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_59,sel_getUid("trackDragging:"),CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,0,NO);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(_5f,_60){
with(_5f){
if(_5f!==objj_msgSend(CPDragServer,"class")){
return;
}
_5=objj_msgSend(objj_msgSend(CPDraggingInfo,"alloc"),"init");
}
}),new objj_method(sel_getUid("sharedDragServer"),function(_61,_62){
with(_61){
if(!_3){
_3=objj_msgSend(objj_msgSend(CPDragServer,"alloc"),"init");
}
return _3;
}
})]);
var _6=objj_getClass("CPWindow");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_63,_64,_65,_66){
with(_63){
if(!_inclusiveRegisteredDraggedTypes){
return nil;
}
var _67=objj_msgSend(_63,"convertPlatformWindowToBase:",_65),_68=objj_msgSend(_windowView,"hitTest:",_67);
while(_68&&!objj_msgSend(_66,"availableTypeFromArray:",objj_msgSend(_68,"registeredDraggedTypes"))){
_68=objj_msgSend(_68,"superview");
}
if(_68){
return _68;
}
if(objj_msgSend(_66,"availableTypeFromArray:",objj_msgSend(_63,"registeredDraggedTypes"))){
return _63;
}
return nil;
}
})]);
p;9;CPEvent.jI;21;Foundation/CPObject.jc;8609;
CPLeftMouseDown=1;
CPLeftMouseUp=2;
CPRightMouseDown=3;
CPRightMouseUp=4;
CPMouseMoved=5;
CPLeftMouseDragged=6;
CPRightMouseDragged=7;
CPMouseEntered=8;
CPMouseExited=9;
CPKeyDown=10;
CPKeyUp=11;
CPFlagsChanged=12;
CPAppKitDefined=13;
CPSystemDefined=14;
CPApplicationDefined=15;
CPPeriodic=16;
CPCursorUpdate=17;
CPScrollWheel=22;
CPOtherMouseDown=25;
CPOtherMouseUp=26;
CPOtherMouseDragged=27;
CPTouchStart=28;
CPTouchMove=29;
CPTouchEnd=30;
CPTouchCancel=31;
CPAlphaShiftKeyMask=1<<16;
CPShiftKeyMask=1<<17;
CPControlKeyMask=1<<18;
CPAlternateKeyMask=1<<19;
CPCommandKeyMask=1<<20;
CPNumericPadKeyMask=1<<21;
CPHelpKeyMask=1<<22;
CPFunctionKeyMask=1<<23;
CPDeviceIndependentModifierFlagsMask=4294901760;
CPLeftMouseDownMask=1<<CPLeftMouseDown;
CPLeftMouseUpMask=1<<CPLeftMouseUp;
CPRightMouseDownMask=1<<CPRightMouseDown;
CPRightMouseUpMask=1<<CPRightMouseUp;
CPOtherMouseDownMask=1<<CPOtherMouseDown;
CPOtherMouseUpMask=1<<CPOtherMouseUp;
CPMouseMovedMask=1<<CPMouseMoved;
CPLeftMouseDraggedMask=1<<CPLeftMouseDragged;
CPRightMouseDraggedMask=1<<CPRightMouseDragged;
CPOtherMouseDragged=1<<CPOtherMouseDragged;
CPMouseEnteredMask=1<<CPMouseEntered;
CPMouseExitedMask=1<<CPMouseExited;
CPCursorUpdateMask=1<<CPCursorUpdate;
CPKeyDownMask=1<<CPKeyDown;
CPKeyUpMask=1<<CPKeyUp;
CPFlagsChangedMask=1<<CPFlagsChanged;
CPAppKitDefinedMask=1<<CPAppKitDefined;
CPSystemDefinedMask=1<<CPSystemDefined;
CPApplicationDefinedMask=1<<CPApplicationDefined;
CPPeriodicMask=1<<CPPeriodic;
CPScrollWheelMask=1<<CPScrollWheel;
CPAnyEventMask=4294967295;
CPDOMEventDoubleClick="dblclick",CPDOMEventMouseDown="mousedown",CPDOMEventMouseUp="mouseup",CPDOMEventMouseMoved="mousemove",CPDOMEventMouseDragged="mousedrag",CPDOMEventKeyUp="keyup",CPDOMEventKeyDown="keydown",CPDOMEventKeyPress="keypress";
CPDOMEventCopy="copy";
CPDOMEventPaste="paste";
CPDOMEventScrollWheel="mousewheel";
CPDOMEventTouchStart="touchstart";
CPDOMEventTouchMove="touchmove";
CPDOMEventTouchEnd="touchend";
CPDOMEventTouchCancel="touchcancel";
var _1=0,_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPEvent"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_type"),new objj_ivar("_location"),new objj_ivar("_modifierFlags"),new objj_ivar("_timestamp"),new objj_ivar("_context"),new objj_ivar("_eventNumber"),new objj_ivar("_clickCount"),new objj_ivar("_pressure"),new objj_ivar("_window"),new objj_ivar("_windowNumber"),new objj_ivar("_characters"),new objj_ivar("_isARepeat"),new objj_ivar("_keyCode"),new objj_ivar("_DOMEvent"),new objj_ivar("_deltaX"),new objj_ivar("_deltaY"),new objj_ivar("_deltaZ")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_type=_7;
_location=CPPointCreateCopy(_8);
_modifierFlags=_9;
_timestamp=_a;
_context=_c;
_eventNumber=_d;
_clickCount=_e;
_pressure=_f;
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_b);
}
return _5;
}
}),new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_1a,_1b){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPObject")},"init");
if(_10){
_type=_12;
_location=CPPointCreateCopy(_13);
_modifierFlags=_14;
_timestamp=_15;
_context=_17;
_characters=_18;
_charactersIgnoringModifiers=_19;
_isARepeat=_1a;
_keyCode=_1b;
_windowNumber=_16;
}
return _10;
}
}),new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_1c,_1d,_1e,_1f,_20,_21,_22,_23,_24,_25,_26){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPObject")},"init");
if(_1c){
_type=_1e;
_location=CPPointCreateCopy(_1f);
_modifierFlags=_20;
_timestamp=_21;
_context=_23;
_subtype=_24;
_data1=_25;
_data2=_26;
}
return _1c;
}
}),new objj_method(sel_getUid("locationInWindow"),function(_27,_28){
with(_27){
return {x:_location.x,y:_location.y};
}
}),new objj_method(sel_getUid("modifierFlags"),function(_29,_2a){
with(_29){
return _modifierFlags;
}
}),new objj_method(sel_getUid("timestamp"),function(_2b,_2c){
with(_2b){
return _timestamp;
}
}),new objj_method(sel_getUid("type"),function(_2d,_2e){
with(_2d){
return _type;
}
}),new objj_method(sel_getUid("window"),function(_2f,_30){
with(_2f){
if(!_window){
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_windowNumber);
}
return _window;
}
}),new objj_method(sel_getUid("windowNumber"),function(_31,_32){
with(_31){
return _windowNumber;
}
}),new objj_method(sel_getUid("buttonNumber"),function(_33,_34){
with(_33){
return _buttonNumber;
}
}),new objj_method(sel_getUid("clickCount"),function(_35,_36){
with(_35){
return _clickCount;
}
}),new objj_method(sel_getUid("characters"),function(_37,_38){
with(_37){
return _characters;
}
}),new objj_method(sel_getUid("charactersIgnoringModifiers"),function(_39,_3a){
with(_39){
return _charactersIgnoringModifiers;
}
}),new objj_method(sel_getUid("isARepeat"),function(_3b,_3c){
with(_3b){
return _isARepeat;
}
}),new objj_method(sel_getUid("keyCode"),function(_3d,_3e){
with(_3d){
return _keyCode;
}
}),new objj_method(sel_getUid("pressure"),function(_3f,_40){
with(_3f){
return _pressure;
}
}),new objj_method(sel_getUid("_DOMEvent"),function(_41,_42){
with(_41){
return _DOMEvent;
}
}),new objj_method(sel_getUid("deltaX"),function(_43,_44){
with(_43){
return _deltaX;
}
}),new objj_method(sel_getUid("deltaY"),function(_45,_46){
with(_45){
return _deltaY;
}
}),new objj_method(sel_getUid("deltaZ"),function(_47,_48){
with(_47){
return _deltaZ;
}
}),new objj_method(sel_getUid("_couldBeKeyEquivalent"),function(_49,_4a){
with(_49){
return _type===CPKeyDown&&_modifierFlags&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(_characters,"length")>0;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56){
with(_4b){
return objj_msgSend(objj_msgSend(_4b,"alloc"),"_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56);
}
}),new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f,_60,_61){
with(_57){
return objj_msgSend(objj_msgSend(_57,"alloc"),"_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_59,_5a,_5b,_5c,_5d,_5e,_5f,_60,_61);
}
}),new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_62,_63,_64,_65,_66,_67,_68,_69,_6a,_6b,_6c){
with(_62){
return objj_msgSend(objj_msgSend(_62,"alloc"),"_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",_64,_65,_66,_67,_68,_69,_6a,_6b,_6c);
}
}),new objj_method(sel_getUid("mouseLocation"),function(_6d,_6e){
with(_6d){
var _6f=objj_msgSend(CPApp,"currentEvent"),_70=objj_msgSend(_6f,"window");
if(_70){
return objj_msgSend(_70,"convertBaseToGlobal:",objj_msgSend(_6f,"locationInWindow"));
}
return objj_msgSend(_6f,"locationInWindow");
}
}),new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"),function(_71,_72,_73,_74){
with(_71){
_1=_74;
_2=window.setTimeout(function(){
_2=window.setInterval(_CPEventFirePeriodEvent,_74*1000);
},_73*1000);
}
}),new objj_method(sel_getUid("stopPeriodicEvents"),function(_75,_76){
with(_75){
if(_2===nil){
return;
}
window.clearTimeout(_2);
_2=nil;
}
})]);
_CPEventFirePeriodEvent=function(){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPPeriodic,{x:0,y:0},0,0,0,nil,0,0,0));
};
var _77=objj_msgSend(CPEvent,"class");
_CPEventFromNativeMouseEvent=function(_78,_79,_7a,_7b,_7c,_7d,_7e,_7f,_80,_81){
_78.isa=_77;
_78._type=_79;
_78._location=_7a;
_78._modifierFlags=_7b;
_78._timestamp=_7c;
_78._windowNumber=_7d;
_78._window=nil;
_78._context=_7e;
_78._eventNumber=_7f;
_78._clickCount=_80;
_78._pressure=_81;
return _78;
};
p;14;CPFlashMovie.jI;21;Foundation/CPObject.jc;616;
var _1=objj_allocateClassPair(CPObject,"CPFlashMovie"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fileName")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFile:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_fileName=_5;
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("flashMovieWithFile:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(objj_msgSend(_6,"alloc"),"initWithFile:",_8);
}
})]);
p;13;CPFlashView.ji;14;CPFlashMovie.ji;8;CPView.jc;2152;
var _1=objj_allocateClassPair(CPView,"CPFlashView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_flashMovie"),new objj_ivar("_DOMEmbedElement"),new objj_ivar("_DOMMParamElement"),new objj_ivar("_DOMObjectElement")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_DOMObjectElement=document.createElement("object");
_DOMObjectElement.width="100%";
_DOMObjectElement.height="100%";
_DOMObjectElement.style.top="0px";
_DOMObjectElement.style.left="0px";
_DOMParamElement=document.createElement("param");
_DOMParamElement.name="movie";
_DOMObjectElement.appendChild(_DOMParamElement);
var _6=document.createElement("param");
_6.name="wmode";
_6.value="transparent";
_DOMObjectElement.appendChild(_6);
_DOMEmbedElement=document.createElement("embed");
_DOMEmbedElement.type="application/x-shockwave-flash";
_DOMEmbedElement.setAttribute("wmode","transparent");
_DOMEmbedElement.width="100%";
_DOMEmbedElement.height="100%";
_DOMElement.appendChild(_DOMEmbedElement);
_DOMElement.appendChild(_DOMObjectElement);
}
return _3;
}
}),new objj_method(sel_getUid("setFlashMovie:"),function(_7,_8,_9){
with(_7){
if(_flashMovie==_9){
return;
}
_flashMovie=_9;
_DOMParamElement.value=_9._fileName;
if(_DOMEmbedElement){
_DOMEmbedElement.src=_9._fileName;
}
}
}),new objj_method(sel_getUid("flashMovie"),function(_a,_b){
with(_a){
return _flashMovie;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_c,_d,_e){
with(_c){
objj_msgSend(objj_msgSend(objj_msgSend(_c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_f,_10,_11){
with(_f){
objj_msgSend(objj_msgSend(objj_msgSend(_f,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_12,_13,_14){
with(_12){
objj_msgSend(objj_msgSend(objj_msgSend(_12,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
})]);
p;8;CPFont.jc;2706;
var _1={};
_CPFontSystemFontFace="Arial";
var _2=objj_allocateClassPair(CPObject,"CPFont"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_name"),new objj_ivar("_size"),new objj_ivar("_isBold"),new objj_ivar("_cssString")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_initWithName:size:bold:"),function(_4,_5,_6,_7,_8){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_name=_6;
_size=_7;
_isBold=_8;
_cssString=(_isBold?"bold ":"")+ROUND(_7)+"px '"+_6+"'";
_1[_cssString]=_4;
}
return _4;
}
}),new objj_method(sel_getUid("size"),function(_9,_a){
with(_9){
return _size;
}
}),new objj_method(sel_getUid("cssString"),function(_b,_c){
with(_b){
return _cssString;
}
}),new objj_method(sel_getUid("familyName"),function(_d,_e){
with(_d){
return _name;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("fontWithName:size:"),function(_f,_10,_11,_12){
with(_f){
return _1[(NO?"bold ":"")+ROUND(_12)+"px '"+_11+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_11,_12,NO);
}
}),new objj_method(sel_getUid("boldFontWithName:size:"),function(_13,_14,_15,_16){
with(_13){
return _1[(YES?"bold ":"")+ROUND(_16)+"px '"+_15+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_15,_16,YES);
}
}),new objj_method(sel_getUid("systemFontOfSize:"),function(_17,_18,_19){
with(_17){
return _1[(NO?"bold ":"")+ROUND(_19)+"px '"+_CPFontSystemFontFace+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_CPFontSystemFontFace,_19,NO);
}
}),new objj_method(sel_getUid("boldSystemFontOfSize:"),function(_1a,_1b,_1c){
with(_1a){
return _1[(YES?"bold ":"")+ROUND(_1c)+"px '"+_CPFontSystemFontFace+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_CPFontSystemFontFace,_1c,YES);
}
})]);
var _1d="CPFontNameKey",_1e="CPFontSizeKey",_1f="CPFontIsBoldKey";
var _2=objj_getClass("CPFont");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPFont\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,"_initWithName:size:bold:",objj_msgSend(_22,"decodeObjectForKey:",_1d),objj_msgSend(_22,"decodeFloatForKey:",_1e),objj_msgSend(_22,"decodeBoolForKey:",_1f));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_25,"encodeObject:forKey:",_name,_1d);
objj_msgSend(_25,"encodeFloat:forKey:",_size,_1e);
objj_msgSend(_25,"encodeBool:forKey:",_isBold,_1f);
}
})]);
p;15;CPFontManager.jI;21;Foundation/CPObject.jI;15;AppKit/CPFont.jc;3248;
var _1=nil,_2=Nil;
var _3=objj_allocateClassPair(CPObject,"CPFontManager"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_availableFonts")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("availableFonts"),function(_5,_6){
with(_5){
if(!_availableFonts){
_7=document.createElement("span");
_7.fontSize="24px";
_7.appendChild(document.createTextNode("mmmmmmmmmml"));
var _8=document.createElement("div");
_8.style.position="absolute";
_8.style.top="-1000px";
_8.appendChild(_7);
document.getElementsByTagName("body")[0].appendChild(_8);
_9=_a(["monospace","serif","sans-serif","cursive"]);
_availableFonts=[];
for(var i=0;i<_b.length;i++){
var _c=_d(_b[i]);
if(_c){
_availableFonts.push(_b[i]);
}
}
}
return _availableFonts;
}
}),new objj_method(sel_getUid("fontWithNameIsAvailable:"),function(_e,_f,_10){
with(_e){
return _d(_10);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedFontManager"),function(_11,_12){
with(_11){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("setFontManagerFactory:"),function(_13,_14,_15){
with(_13){
_2=_15;
}
})]);
var _7,_9,_b=["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _d=function(_16){
for(var i=0;i<_9.length;i++){
if(_17(_9[i],_16)){
return true;
}
}
return false;
};
var _18={};
var _17=function(_19,_1a){
var a;
if(_18[_19]){
a=_18[_19];
}else{
_7.style.fontFamily="\""+_19+"\"";
_18[_19]=a={w:_7.offsetWidth,h:_7.offsetHeight};
}
_7.style.fontFamily="\""+_1a+"\", \""+_19+"\"";
var _1b=_7.offsetWidth;
var _1c=_7.offsetHeight;
return (a.w!=_1b||a.h!=_1c);
};
var _a=function(_1d){
for(var i=0;i<_1d.length;i++){
for(var j=0;j<i;j++){
if(_17(_1d[i],_1d[j])){
return [_1d[i],_1d[j]];
}
}
}
return [_1d[0]];
};
objj_msgSend(CPFontManager,"setFontManagerFactory:",objj_msgSend(CPFontManager,"class"));
p;12;CPGeometry.ji;12;CGGeometry.jc;4079;
CPMinXEdge=0;
CPMinYEdge=1;
CPMaxXEdge=2;
CPMaxYEdge=3;
CPMakePoint=CGPointMake;
CPMakeSize=CGSizeMake;
CPMakeRect=CGRectMake;
CPPointCreateCopy=function(_1){
return {x:_1.x,y:_1.y};
};
CPPointMake=function(x,y){
return {x:x,y:y};
};
CPRectInset=function(_2,dX,dY){
return CPRectMake(_2.origin.x+dX,_2.origin.y+dY,_2.size.width-2*dX,_2.size.height-2*dY);
};
CPRectIntegral=function(_3){
alert("CPRectIntegral unimplemented");
};
CPRectIntersection=function(_4,_5){
var _6=CPRectMake(Math.max(CPRectGetMinX(_4),CPRectGetMinX(_5)),Math.max(CPRectGetMinY(_4),CPRectGetMinY(_5)),0,0);
_6.size.width=Math.min(CPRectGetMaxX(_4),CPRectGetMaxX(_5))-CPRectGetMinX(_6);
_6.size.height=Math.min(CPRectGetMaxY(_4),CPRectGetMaxY(_5))-CPRectGetMinY(_6);
return CPRectIsEmpty(_6)?CPRectMakeZero():_6;
};
CPRectCreateCopy=function(_7){
return {origin:CPPointCreateCopy(_7.origin),size:CPSizeCreateCopy(_7.size)};
};
CPRectMake=function(x,y,_8,_9){
return {origin:CPPointMake(x,y),size:CPSizeMake(_8,_9)};
};
CPRectOffset=function(_a,dX,dY){
return CPRectMake(_a.origin.x+dX,_a.origin.y+dY,_a.size.width,_a.size.height);
};
CPRectStandardize=function(_b){
var _c=CPRectGetWidth(_b),_d=CPRectGetHeight(_b),_e=CPRectCreateCopy(_b);
if(_c<0){
_e.origin.x+=_c;
_e.size.width=-_c;
}
if(_d<0){
_e.origin.y+=_d;
_e.size.height=-_d;
}
return _e;
};
CPRectUnion=function(_f,_10){
var _11=Math.min(CPRectGetMinX(_f),CPRectGetMinX(_10)),_12=Math.min(CPRectGetMinY(_f),CPRectGetMinY(_10)),_13=Math.max(CPRectGetMaxX(_f),CPRectGetMaxX(_10)),_14=Math.max(CPRectGetMaxY(_f),CPRectGetMaxY(_10));
return CPRectMake(_11,_12,_13-_11,_14-_12);
};
CPSizeCreateCopy=function(_15){
return {width:_15.width,height:_15.height};
};
CPSizeMake=function(_16,_17){
return {width:_16,height:_17};
};
CPRectContainsPoint=function(_18,_19){
return _19.x>=CPRectGetMinX(_18)&&_19.y>=CPRectGetMinY(_18)&&_19.x<CPRectGetMaxX(_18)&&_19.y<CPRectGetMaxY(_18);
};
CPRectContainsRect=function(_1a,_1b){
return CPRectEqualToRect(CPUnionRect(_1a,_1b),_1b);
};
CPPointEqualToPoint=function(_1c,_1d){
return _1c.x==_1d.x&&_1c.y==_1d.y;
};
CPRectEqualToRect=function(_1e,_1f){
return CPPointEqualToPoint(_1e.origin,_1f.origin)&&CPSizeEqualToSize(_1e.size,_1f.size);
};
CPRectGetHeight=function(_20){
return _20.size.height;
};
CPRectGetMaxX=function(_21){
return _21.origin.x+_21.size.width;
};
CPRectGetMaxY=function(_22){
return _22.origin.y+_22.size.height;
};
CPRectGetMidX=function(_23){
return _23.origin.x+(_23.size.width)/2;
};
CPRectGetMidY=function(_24){
return _24.origin.y+(_24.size.height)/2;
};
CPRectGetMinX=function(_25){
return _25.origin.x;
};
CPRectGetMinY=function(_26){
return _26.origin.y;
};
CPRectGetWidth=function(_27){
return _27.size.width;
};
CPRectIntersectsRect=function(_28,_29){
return !CPRectIsEmpty(CPRectIntersection(_28,_29));
};
CPRectIsEmpty=function(_2a){
return _2a.size.width<=0||_2a.size.height<=0;
};
CPRectIsNull=function(_2b){
return _2b.size.width<=0||_2b.size.height<=0;
};
CPSizeEqualToSize=function(_2c,_2d){
return _2c.width==_2d.width&&_2c.height==_2d.height;
};
CPStringFromPoint=function(_2e){
return "{"+_2e.x+", "+_2e.y+"}";
};
CPStringFromSize=function(_2f){
return "{"+_2f.width+", "+_2f.height+"}";
};
CPStringFromRect=function(_30){
return "{"+CPStringFromPoint(_30.origin)+", "+CPStringFromSize(_30.size)+"}";
};
CPPointFromString=function(_31){
var _32=_31.indexOf(",");
return {x:parseFloat(_31.substr(1,_32-1),10),y:parseFloat(_31.substring(_32+1,_31.length),10)};
};
CPSizeFromString=function(_33){
var _34=_33.indexOf(",");
return {width:parseFloat(_33.substr(1,_34-1),10),height:parseFloat(_33.substring(_34+1,_33.length),10)};
};
CPRectFromString=function(_35){
var _36=_35.indexOf(",",_35.indexOf(",")+1);
return {origin:CPPointFromString(_35.substr(1,_36-1)),size:CPSizeFromString(_35.substring(_36+2,_35.length))};
};
CPPointFromEvent=function(_37){
return CPPointMake(_37.clientX,_37.clientY,0);
};
CPSizeMakeZero=function(){
return CPSizeMake(0,0);
};
CPRectMakeZero=function(){
return CPRectMake(0,0,0,0);
};
CPPointMakeZero=function(){
return CPPointMake(0,0,0);
};
p;19;CPGraphicsContext.jc;960;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPGraphicsContext"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_graphicsPort")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithGraphicsPort:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_graphicsPort=_6;
}
return _4;
}
}),new objj_method(sel_getUid("graphicsPort"),function(_7,_8){
with(_7){
return _graphicsPort;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("currentContext"),function(_9,_a){
with(_9){
return _1;
}
}),new objj_method(sel_getUid("setCurrentContext:"),function(_b,_c,_d){
with(_b){
_1=_d;
}
}),new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"),function(_e,_f,_10,_11){
with(_e){
return objj_msgSend(objj_msgSend(_e,"alloc"),"initWithGraphicsPort:",_10);
}
})]);
p;9;CPImage.jI;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;8739;
CPImageLoadStatusInitialized=0;
CPImageLoadStatusLoading=1;
CPImageLoadStatusCompleted=2;
CPImageLoadStatusCancelled=3;
CPImageLoadStatusInvalidData=4;
CPImageLoadStatusUnexpectedEOF=5;
CPImageLoadStatusReadError=6;
CPImageDidLoadNotification="CPImageDidLoadNotification";
CPImageInBundle=function(_1,_2,_3){
if(!_3){
_3=objj_msgSend(CPBundle,"mainBundle");
}
if(_2){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3,"pathForResource:",_1),_2);
}
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_3,"pathForResource:",_1));
};
var _4=objj_allocateClassPair(CPObject,"CPImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_size"),new objj_ivar("_filename"),new objj_ivar("_delegate"),new objj_ivar("_loadStatus"),new objj_ivar("_image")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"initByReferencingFile:size:","",CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("initByReferencingFile:size:"),function(_8,_9,_a,_b){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init");
if(_8){
_size=CPSizeCreateCopy(_b);
_filename=_a;
_loadStatus=CPImageLoadStatusInitialized;
}
return _8;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:size:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSend(_c,"initByReferencingFile:size:",_e,_f);
if(_c){
objj_msgSend(_c,"load");
}
return _c;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_10,_11,_12){
with(_10){
_10=objj_msgSend(_10,"initByReferencingFile:size:",_12,CGSizeMake(-1,-1));
if(_10){
objj_msgSend(_10,"load");
}
return _10;
}
}),new objj_method(sel_getUid("filename"),function(_13,_14){
with(_13){
return _filename;
}
}),new objj_method(sel_getUid("setSize:"),function(_15,_16,_17){
with(_15){
_size=CGSizeMakeCopy(_17);
}
}),new objj_method(sel_getUid("size"),function(_18,_19){
with(_18){
return _size;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1a,_1b,_1c){
with(_1a){
_delegate=_1c;
}
}),new objj_method(sel_getUid("delegate"),function(_1d,_1e){
with(_1d){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_1f,_20){
with(_1f){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_21,_22){
with(_21){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
var _23=YES;
_image.onload=function(){
if(_23){
window.setTimeout(function(){
objj_msgSend(_21,"_imageDidLoad");
},0);
}else{
objj_msgSend(_21,"_imageDidLoad");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_21,"_derefFromImage");
};
_image.onerror=function(){
if(_23){
window.setTimeout(function(){
objj_msgSend(_21,"_imageDidError");
},0);
}else{
objj_msgSend(_21,"_imageDidError");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_21,"_derefFromImage");
};
_image.onabort=function(){
if(_23){
window.setTimeout(function(){
objj_msgSend(_21,"_imageDidAbort");
},0);
}else{
objj_msgSend(_21,"_imageDidAbort");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_21,"_derefFromImage");
};
_image.src=_filename;
_23=NO;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_24,_25){
with(_24){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_26,_27){
with(_26){
return NO;
}
}),new objj_method(sel_getUid("_derefFromImage"),function(_28,_29){
with(_28){
_image.onload=null;
_image.onerror=null;
_image.onabort=null;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_2a,_2b){
with(_2a){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_2a);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_2a);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_2c,_2d){
with(_2c){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_2c);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_2e,_2f){
with(_2e){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_2e);
}
}
})]);
var _4=objj_getClass("CPImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(_30,"initWithContentsOfFile:size:",objj_msgSend(_32,"decodeObjectForKey:","CPFilename"),objj_msgSend(_32,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_35,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_35,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPThreePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_36,_37,_38,_39){
with(_36){
_36=objj_msgSendSuper({receiver:_36,super_class:objj_getClass("CPObject")},"init");
if(_36){
_imageSlices=_38;
_isVertical=_39;
}
return _36;
}
}),new objj_method(sel_getUid("filename"),function(_3a,_3b){
with(_3a){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_3c,_3d){
with(_3c){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_3e,_3f){
with(_3e){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_40,_41){
with(_40){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_42,_43){
with(_42){
return NO;
}
})]);
var _44="CPThreePartImageImageSlicesKey",_45="CPThreePartImageIsVerticalKey";
var _4=objj_getClass("CPThreePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPThreePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_46,_47,_48){
with(_46){
_46=objj_msgSendSuper({receiver:_46,super_class:objj_getClass("CPObject")},"init");
if(_46){
_imageSlices=objj_msgSend(_48,"decodeObjectForKey:",_44);
_isVertical=objj_msgSend(_48,"decodeBoolForKey:",_45);
}
return _46;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_4b,"encodeObject:forKey:",_imageSlices,_44);
objj_msgSend(_4b,"encodeBool:forKey:",_isVertical,_45);
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPNinePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:"),function(_4c,_4d,_4e){
with(_4c){
_4c=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPObject")},"init");
if(_4c){
_imageSlices=_4e;
}
return _4c;
}
}),new objj_method(sel_getUid("filename"),function(_4f,_50){
with(_4f){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_51,_52){
with(_51){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_53,_54){
with(_53){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_55,_56){
with(_55){
return YES;
}
})]);
var _57="CPNinePartImageImageSlicesKey";
var _4=objj_getClass("CPNinePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPNinePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_58,_59,_5a){
with(_58){
_58=objj_msgSendSuper({receiver:_58,super_class:objj_getClass("CPObject")},"init");
if(_58){
_imageSlices=objj_msgSend(_5a,"decodeObjectForKey:",_57);
}
return _58;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5b,_5c,_5d){
with(_5b){
objj_msgSend(_5d,"encodeObject:forKey:",_imageSlices,_57);
}
})]);
p;13;CPImageView.jI;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;6312;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
var _1=nil;
var _2=3,_3=3,_4=3,_5=5,_6=_4+_5,_7=_2+_3;
var _8=objj_allocateClassPair(CPControl,"CPImageView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_DOMImageElement"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowView"),new objj_ivar("_isEditable"),new objj_ivar("_imageRect")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
}
return _a;
}
}),new objj_method(sel_getUid("image"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"objectValue");
}
}),new objj_method(sel_getUid("setImage:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setObjectValue:",_11);
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"objectValue");
if(_15===_14){
return;
}
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",_14);
var _16=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_15){
objj_msgSend(_16,"removeObserver:name:object:",_12,CPImageDidLoadNotification,_15);
}
var _17=objj_msgSend(_12,"objectValue");
var _18=objj_msgSend(_17,"size");
if(_18&&_18.width===-1&&_18.height===-1){
objj_msgSend(_16,"addObserver:selector:name:object:",_12,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_17);
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_12,"hideOrDisplayContents");
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"hideOrDisplayContents");
objj_msgSend(_19,"setNeedsLayout");
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hasShadow"),function(_1c,_1d){
with(_1c){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_1e,_1f,_20){
with(_1e){
if(_hasShadow==_20){
return;
}
_hasShadow=_20;
if(_hasShadow){
_shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",objj_msgSend(_1e,"bounds"));
objj_msgSend(_1e,"addSubview:",_shadowView);
objj_msgSend(_1e,"setNeedsLayout");
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}else{
objj_msgSend(_shadowView,"removeFromSuperview");
_shadowView=nil;
}
objj_msgSend(_1e,"hideOrDisplayContents");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_21,_22,_23){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPControl")},"setImageScaling:",_23);
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(_21,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_24,_25){
with(_24){
if(!objj_msgSend(_24,"image")){
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_26,_27){
with(_26){
return _imageRect;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_28,_29){
with(_28){
if(!objj_msgSend(_28,"image")){
return;
}
var _2a=objj_msgSend(_28,"bounds"),_2b=objj_msgSend(_28,"image"),_2c=objj_msgSend(_28,"currentValueForThemeAttribute:","image-scaling"),x=0,y=0,_2d=(_hasShadow?_7:0),_2e=(_hasShadow?_6:0),_2f=(_2a.size.width),_30=(_2a.size.height),_31=_2f-_2d,_32=_30-_2e;
if(_2c===CPScaleToFit){
}else{
var _33=objj_msgSend(_2b,"size");
if(_33.width==-1&&_33.height==-1){
return;
}
if(_2c===CPScaleProportionally){
if(_31>=_33.width&&_32>=_33.height){
_31=_33.width;
_32=_33.height;
}else{
var _34=_33.width/_33.height,_35=_31/_32;
if(_35>_34){
_31=_32*_34;
}else{
_32=_31/_34;
}
}
}else{
_31=_33.width;
_32=_33.height;
}
if(_2c==CPScaleNone){
}
var x=(_2f-_31)/2,y=(_30-_32)/2;
}
_imageRect={origin:{x:x,y:y},size:{width:_31,height:_32}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-_2,y:y-_4},size:{width:_31+_2d,height:_32+_2e}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_36,_37,_38){
with(_36){
objj_msgSend(objj_msgSend(_36,"nextResponder"),"mouseDown:",_38);
}
}),new objj_method(sel_getUid("setEditable:"),function(_39,_3a,_3b){
with(_39){
if(_isEditable===_3b){
return;
}
_isEditable=_3b;
if(_isEditable){
objj_msgSend(_39,"registerForDraggedTypes:",[CPImagesPboardType]);
}else{
var _3c=objj_msgSend(_39,"registeredDraggedTypes");
objj_msgSend(_39,"unregisterDraggedTypes");
objj_msgSend(_3c,"removeObjectIdenticalTo:",CPImagesPboardType);
objj_msgSend(_39,"registerForDraggedTypes:",_3c);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_3d,_3e){
with(_3d){
return _isEditable;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_41,"draggingPasteboard"),"dataForType:",CPImagesPboardType));
if(objj_msgSend(_42,"count")){
objj_msgSend(_3f,"setImage:",_42[0]);
}
}
})]);
var _43="CPImageViewImageKey",_44="CPImageViewImageScalingKey",_45="CPImageViewHasShadowKey",_46="CPImageViewIsEditableKey";
var _8=objj_getClass("CPImageView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImageView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_47,_48,_49){
with(_47){
_47=objj_msgSendSuper({receiver:_47,super_class:objj_getClass("CPControl")},"initWithCoder:",_49);
if(_47){
objj_msgSend(_47,"setHasShadow:",objj_msgSend(_49,"decodeBoolForKey:",_45));
if(objj_msgSend(_49,"decodeBoolForKey:",_46)||NO){
objj_msgSend(_47,"setEditable:",YES);
}
objj_msgSend(_47,"setNeedsLayout");
objj_msgSend(_47,"setNeedsDisplay:",YES);
}
return _47;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4a,_4b,_4c){
with(_4a){
if(_shadowView){
var _4d=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_4c);
if(_shadowView){
_subviews=_4d;
}
objj_msgSend(_4c,"encodeBool:forKey:",_hasShadow,_45);
if(_isEditable){
objj_msgSend(_4c,"encodeBool:forKey:",_isEditable,_46);
}
}
})]);
p;8;CPMenu.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;49716;
CPMenuDidAddItemNotification="CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification="CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification="CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification="CPMenuDidEndTrackingNotification";
var _1=19;
var _2=NO,_3="",_4=nil,_5=1,_6=nil,_7=nil;
var _8=objj_allocateClassPair(CPObject,"CPMenu"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_supermenu"),new objj_ivar("_title"),new objj_ivar("_name"),new objj_ivar("_items"),new objj_ivar("_attachedMenu"),new objj_ivar("_autoenablesItems"),new objj_ivar("_showsStateColumn"),new objj_ivar("_delegate"),new objj_ivar("_highlightedIndex"),new objj_ivar("_menuWindow")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("menuBarHeight"),function(_a,_b){
with(_a){
if(_a==objj_msgSend(CPApp,"mainMenu")){
return _1;
}
return 0;
}
}),new objj_method(sel_getUid("initWithTitle:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_title=_e;
_items=[];
_autoenablesItems=YES;
_showsStateColumn=YES;
}
return _c;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithTitle:","");
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_11,_12,_13,_14){
with(_11){
var _15=objj_msgSend(_13,"menu");
if(_15){
if(_15!==_11){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Attempted to insert item into menu that was already in another menu.");
}else{
return;
}
}
objj_msgSend(_13,"setMenu:",_11);
objj_msgSend(_items,"insertObject:atIndex:",_13,_14);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidAddItemNotification,_11,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_14,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"),function(_16,_17,_18,_19,_1a,_1b){
with(_16){
var _1c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_18,_19,_1a);
objj_msgSend(_16,"insertItem:atIndex:",_1c,_1b);
return _1c;
}
}),new objj_method(sel_getUid("addItem:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1d,"insertItem:atIndex:",_1f,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"),function(_20,_21,_22,_23,_24){
with(_20){
return objj_msgSend(_20,"insertItemWithTitle:action:keyEquivalent:atIndex:",_22,_23,_24,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("removeItem:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_27));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_28,_29,_2a){
with(_28){
if(_2a<0||_2a>=_items.length){
return;
}
objj_msgSend(_items[_2a],"setMenu:",nil);
objj_msgSend(_items,"removeObjectAtIndex:",_2a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidRemoveItemNotification,_28,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_2a,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemChanged:"),function(_2b,_2c,_2d){
with(_2b){
if(objj_msgSend(_2d,"menu")!=_2b){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidChangeItemNotification,_2b,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2d),"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemWithTag:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"indexOfItemWithTag:",_30);
if(_31==CPNotFound){
return nil;
}
return _items[_31];
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"indexOfItemWithTitle:",_34);
if(_35==CPNotFound){
return nil;
}
return _items[_35];
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_36,_37,_38){
with(_36){
return objj_msgSend(_items,"objectAtIndex:",_38);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_39,_3a){
with(_39){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("itemArray"),function(_3b,_3c){
with(_3b){
return _items;
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_3f,"menu")!=_3d){
return CPNotFound;
}
return objj_msgSend(_items,"indexOfObjectIdenticalTo:",_3f);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_40,_41,_42){
with(_40){
var _43=0,_44=_items.length;
for(;_43<_44;++_43){
if(objj_msgSend(_items[_43],"title")===_42){
return _43;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_45,_46,_47){
with(_45){
var _48=0,_49=_items.length;
for(;_48<_49;++_48){
if(objj_msgSend(_items[_48],"tag")==_47){
return _48;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var _4e=0,_4f=_items.length;
for(;_4e<_4f;++_4e){
var _50=_items[_4e];
if(objj_msgSend(_50,"target")==_4c&&(!_4d||objj_msgSend(_50,"action")==_4d)){
return _4e;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_51,_52,_53){
with(_51){
var _54=0,_55=_items.length;
for(;_54<_55;++_54){
if(objj_msgSend(objj_msgSend(_items[_54],"representedObject"),"isEqual:",_53)){
return _54;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithSubmenu:"),function(_56,_57,_58){
with(_56){
var _59=0,_5a=_items.length;
for(;_59<_5a;++_59){
if(objj_msgSend(_items[_59],"submenu")==_58){
return _59;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setSubmenu:forItem:"),function(_5b,_5c,_5d,_5e){
with(_5b){
objj_msgSend(_5e,"setTarget:",_5e);
objj_msgSend(_5e,"setAction:",sel_getUid("submenuAction:"));
objj_msgSend(_5e,"setSubmenu:",_5d);
}
}),new objj_method(sel_getUid("submenuAction:"),function(_5f,_60,_61){
with(_5f){
}
}),new objj_method(sel_getUid("attachedMenu"),function(_62,_63){
with(_62){
return _attachedMenu;
}
}),new objj_method(sel_getUid("isAttached"),function(_64,_65){
with(_64){
return _isAttached;
}
}),new objj_method(sel_getUid("locationOfSubmenu:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("supermenu"),function(_69,_6a){
with(_69){
return _supermenu;
}
}),new objj_method(sel_getUid("setSupermenu:"),function(_6b,_6c,_6d){
with(_6b){
_supermenu=_6d;
}
}),new objj_method(sel_getUid("isTornOff"),function(_6e,_6f){
with(_6e){
return !_supermenu||_6e==objj_msgSend(CPApp,"mainMenu");
}
}),new objj_method(sel_getUid("setAutoenablesItems:"),function(_70,_71,_72){
with(_70){
_autoenablesItems=_72;
}
}),new objj_method(sel_getUid("autoenablesItems"),function(_73,_74){
with(_73){
return _autoenablesItems;
}
}),new objj_method(sel_getUid("update"),function(_75,_76){
with(_75){
}
}),new objj_method(sel_getUid("setTitle:"),function(_77,_78,_79){
with(_77){
_title=_79;
}
}),new objj_method(sel_getUid("title"),function(_7a,_7b){
with(_7a){
return _title;
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_7c,_7d,_7e){
with(_7c){
_showsStateColumn=_7e;
}
}),new objj_method(sel_getUid("showsStateColumn"),function(_7f,_80){
with(_7f){
return _showsStateColumn;
}
}),new objj_method(sel_getUid("highlightedItem"),function(_81,_82){
with(_81){
return _highlightedIndex>=0?_items[_highlightedIndex]:nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_83,_84,_85){
with(_83){
_delegate=_85;
}
}),new objj_method(sel_getUid("delegate"),function(_86,_87){
with(_86){
return _delegate;
}
}),new objj_method(sel_getUid("cancelTracking"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_fireCancelTrackingEvent"),_88,nil,0,[CPDefaultRunLoopMode]);
}
}),new objj_method(sel_getUid("_fireCancelTrackingEvent"),function(_8a,_8b){
with(_8a){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPAppKitDefined,{x:0,y:0},0,0,0,0,0,0,0));
}
}),new objj_method(sel_getUid("_setMenuWindow:"),function(_8c,_8d,_8e){
with(_8c){
_menuWindow=_8e;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_8f,_90,_91){
with(_8f){
if(_autoenablesItems){
objj_msgSend(_8f,"update");
}
var _92=0,_93=_items.length,_94=objj_msgSend(_91,"charactersIgnoringModifiers"),_95=objj_msgSend(_91,"modifierFlags");
for(;_92<_93;++_92){
var _96=_items[_92],_97=objj_msgSend(_96,"keyEquivalentModifierMask");
if((_95&(CPShiftKeyMask|CPAlternateKeyMask|CPCommandKeyMask|CPControlKeyMask))==_97&&objj_msgSend(_94,"caseInsensitiveCompare:",objj_msgSend(_96,"keyEquivalent"))==CPOrderedSame){
if(objj_msgSend(_96,"isEnabled")){
objj_msgSend(_8f,"performActionForItemAtIndex:",_92);
}else{
}
return YES;
}
if(objj_msgSend(objj_msgSend(_96,"submenu"),"performKeyEquivalent:",_91)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("performActionForItemAtIndex:"),function(_98,_99,_9a){
with(_98){
var _9b=_items[_9a];
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9b,"action"),objj_msgSend(_9b,"target"),_9b);
}
}),new objj_method(sel_getUid("_itemIsHighlighted:"),function(_9c,_9d,_9e){
with(_9c){
return _items[_highlightedIndex]==_9e;
}
}),new objj_method(sel_getUid("_highlightItemAtIndex:"),function(_9f,_a0,_a1){
with(_9f){
var _a2=_highlightedIndex;
_highlightedIndex=_a1;
if(_a2!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_a2],"_menuItemView"),"highlight:",NO);
}
if(_highlightedIndex!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",YES);
}
}
}),new objj_method(sel_getUid("_setMenuName:"),function(_a3,_a4,_a5){
with(_a3){
if(_name===_a5){
return;
}
_name=_a5;
if(_name==="CPMainMenu"){
objj_msgSend(CPApp,"setMainMenu:",_a3);
}
}
}),new objj_method(sel_getUid("_menuName"),function(_a6,_a7){
with(_a6){
return _name;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_a8,_a9){
with(_a8){
if(_name==="_CPMainMenu"){
objj_msgSend(_a8,"_setMenuName:","CPMainMenu");
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
}
}),new objj_method(sel_getUid("_menuWithName:"),function(_aa,_ab,_ac){
with(_aa){
if(_ac===_name){
return _aa;
}
for(var i=0,_ad=objj_msgSend(_items,"count");i<_ad;i++){
var _ae=objj_msgSend(objj_msgSend(_items[i],"submenu"),"_menuWithName:",_ac);
if(_ae){
return _ae;
}
}
return nil;
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_af,_b0){
with(_af){
objj_msgSend(objj_msgSend(_af,"class"),"setMenuBarAttributes:",objj_msgSend(CPDictionary,"dictionary"));
}
}),new objj_method(sel_getUid("menuBarVisible"),function(_b1,_b2){
with(_b1){
return _2;
}
}),new objj_method(sel_getUid("setMenuBarVisible:"),function(_b3,_b4,_b5){
with(_b3){
if(_2==_b5){
return;
}
_2=_b5;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
return;
}
if(_b5){
if(!_7){
_7=objj_msgSend(objj_msgSend(_CPMenuBarWindow,"alloc"),"init");
}
objj_msgSend(_7,"setMenu:",objj_msgSend(CPApp,"mainMenu"));
objj_msgSend(_7,"setTitle:",_3);
objj_msgSend(_7,"setIconImage:",_4);
objj_msgSend(_7,"setIconImageAlphaValue:",_5);
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
objj_msgSend(_7,"orderFront:",_b3);
}else{
objj_msgSend(_7,"orderOut:",_b3);
}
}
}),new objj_method(sel_getUid("setMenuBarTitle:"),function(_b6,_b7,_b8){
with(_b6){
_3=_b8;
objj_msgSend(_7,"setTitle:",_3);
}
}),new objj_method(sel_getUid("menuBarTitle"),function(_b9,_ba){
with(_b9){
return _3;
}
}),new objj_method(sel_getUid("setMenuBarIconImage:"),function(_bb,_bc,_bd){
with(_bb){
_CPMenuBarImage=_bd;
objj_msgSend(_7,"setIconImage:",_bd);
}
}),new objj_method(sel_getUid("menuBarIconImage"),function(_be,_bf){
with(_be){
return _CPMenuBarImage;
}
}),new objj_method(sel_getUid("setMenuBarAttributes:"),function(_c0,_c1,_c2){
with(_c0){
if(_6==_c2){
return;
}
_6=objj_msgSend(_c2,"copy");
var _c3=objj_msgSend(_c2,"objectForKey:","CPMenuBarTextColor"),_c4=objj_msgSend(_c2,"objectForKey:","CPMenuBarTitleColor"),_c5=objj_msgSend(_c2,"objectForKey:","CPMenuBarTextShadowColor"),_c6=objj_msgSend(_c2,"objectForKey:","CPMenuBarTitleShadowColor"),_c7=objj_msgSend(_c2,"objectForKey:","CPMenuBarHighlightColor"),_c8=objj_msgSend(_c2,"objectForKey:","CPMenuBarHighlightTextColor"),_c9=objj_msgSend(_c2,"objectForKey:","CPMenuBarHighlightTextShadowColor");
if(!_c3&&_c4){
objj_msgSend(_6,"setObject:forKey:",_c4,"CPMenuBarTextColor");
}else{
if(_c3&&!_c4){
objj_msgSend(_6,"setObject:forKey:",_c3,"CPMenuBarTitleColor");
}else{
if(!_c3&&!_c4){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTextColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTitleColor");
}
}
}
if(!_c5&&_c6){
objj_msgSend(_6,"setObject:forKey:",_c6,"CPMenuBarTextShadowColor");
}else{
if(_c5&&!_c6){
objj_msgSend(_6,"setObject:forKey:",_c5,"CPMenuBarTitleShadowColor");
}else{
if(!_c5&&!_c6){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTextShadowColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTitleShadowColor");
}
}
}
if(!_c7){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",94/255,130/255,186/255,1),"CPMenuBarHighlightColor");
}
if(!_c8){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarHighlightTextColor");
}
if(!_c9){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"blackColor"),"CPMenuBarHighlightTextShadowColor");
}
if(_7){
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
}
}
}),new objj_method(sel_getUid("menuBarAttributes"),function(_ca,_cb){
with(_ca){
return _6;
}
}),new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"),function(_cc,_cd,_ce){
with(_cc){
_5=_ce;
objj_msgSend(_7,"setIconImageAlphaValue:",_ce);
}
}),new objj_method(sel_getUid("menuBarHeight"),function(_cf,_d0){
with(_cf){
return _1;
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"),function(_d1,_d2,_d3,_d4,_d5){
with(_d1){
objj_msgSend(_d1,"popUpContextMenu:withEvent:forView:withFont:",_d3,_d4,_d5,nil);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"),function(_d6,_d7,_d8,_d9,_da,_db){
with(_d6){
objj_msgSend(_d6,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_d8,_d9,_da,_db,NO);
}
}),new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"),function(_dc,_dd,_de,_df,_e0,_e1,_e2){
with(_dc){
var _e3=objj_msgSend(_de,"delegate");
if(objj_msgSend(_e3,"respondsToSelector:",sel_getUid("menuWillOpen:"))){
objj_msgSend(_e3,"menuWillOpen:",_de);
}
if(!_e1){
_e1=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
var _e4=objj_msgSend(_e0,"window"),_e5=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_de,_e1);
objj_msgSend(_e5,"setDelegate:",_dc);
objj_msgSend(_e5,"setBackgroundStyle:",_e2?_CPMenuWindowMenuBarBackgroundStyle:_CPMenuWindowPopUpBackgroundStyle);
objj_msgSend(_e5,"setFrameOrigin:",objj_msgSend(objj_msgSend(_df,"window"),"convertBaseToGlobal:",objj_msgSend(_df,"locationInWindow")));
objj_msgSend(_e5,"orderFront:",_dc);
objj_msgSend(_e5,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_df,_dc,sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"),function(_e6,_e7,_e8,_e9){
with(_e6){
var _ea=objj_msgSend(_e8,"menu");
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_e8);
if(objj_msgSend(_e9,"isEnabled")){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_e9,"action"),objj_msgSend(_e9,"target"),_e9);
}
}
})]);
var _eb="CPMenuTitleKey",_ec="CPMenuNameKey",_ed="CPMenuItemsKey",_ee="CPMenuShowsStateColumnKey";
var _8=objj_getClass("CPMenu");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenu\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_ef,_f0,_f1){
with(_ef){
_ef=objj_msgSendSuper({receiver:_ef,super_class:objj_getClass("CPObject")},"init");
if(_ef){
_title=objj_msgSend(_f1,"decodeObjectForKey:",_eb);
_items=objj_msgSend(_f1,"decodeObjectForKey:",_ed);
objj_msgSend(_ef,"_setMenuName:",objj_msgSend(_f1,"decodeObjectForKey:",_ec));
_showsStateColumn=!objj_msgSend(_f1,"containsValueForKey:",_ee)||objj_msgSend(_f1,"decodeBoolForKey:",_ee);
}
return _ef;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f2,_f3,_f4){
with(_f2){
objj_msgSend(_f4,"encodeObject:forKey:",_title,_eb);
if(_name){
objj_msgSend(_f4,"encodeObject:forKey:",_name,_ec);
}
objj_msgSend(_f4,"encodeObject:forKey:",_items,_ed);
if(!_showsStateColumn){
objj_msgSend(_f4,"encodeBool:forKey:",_showsStateColumn,_ee);
}
}
})]);
var _f5=[],_f6=5,_f7=[],_f8=-1,_f9=1,_fa=0;
_CPMenuWindowMenuBarBackgroundStyle=0;
_CPMenuWindowPopUpBackgroundStyle=1;
_CPMenuWindowAttachedMenuBackgroundStyle=2;
var _fb=500,_fc=5,_fd=1,_fe=1,_ff=5,_100=16;
var _8=objj_allocateClassPair(CPWindow,"_CPMenuWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuView"),new objj_ivar("_menuClipView"),new objj_ivar("_lastMouseOverMenuView"),new objj_ivar("_moreAboveView"),new objj_ivar("_moreBelowView"),new objj_ivar("_sessionDelegate"),new objj_ivar("_didEndSelector"),new objj_ivar("_startTime"),new objj_ivar("_scrollingState"),new objj_ivar("_lastGlobalLocation"),new objj_ivar("_isShowingTopScrollIndicator"),new objj_ivar("_isShowingBottomScrollIndicator"),new objj_ivar("_trackingCanceled"),new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(self,_101){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessWindowMask);
if(self){
objj_msgSend(self,"setLevel:",CPPopUpMenuWindowLevel);
objj_msgSend(self,"setHasShadow:",YES);
objj_msgSend(self,"setShadowStyle:",CPMenuWindowShadowStyle);
objj_msgSend(self,"setAcceptsMouseMovedEvents:",YES);
_unconstrainedFrame=CGRectMakeZero();
var _102=objj_msgSend(self,"contentView");
_menuView=objj_msgSend(objj_msgSend(_CPMenuView,"alloc"),"initWithFrame:",CGRectMakeZero());
_menuClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",CGRectMake(_fd,_fc,0,0));
objj_msgSend(_menuClipView,"setDocumentView:",_menuView);
objj_msgSend(_102,"addSubview:",_menuClipView);
_moreAboveView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreAboveView,"setImage:",_CPMenuWindowMoreAboveImage);
objj_msgSend(_moreAboveView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreAboveImage,"size"));
objj_msgSend(_102,"addSubview:",_moreAboveView);
_moreBelowView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreBelowView,"setImage:",_CPMenuWindowMoreBelowImage);
objj_msgSend(_moreBelowView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreBelowImage,"size"));
objj_msgSend(_102,"addSubview:",_moreBelowView);
objj_msgSend(self,"setShadowStyle:",CPWindowShadowStyleMenu);
}
return self;
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(self,_103){
with(self){
return _fd;
}
}),new objj_method(sel_getUid("setFont:"),function(self,_104,_105){
with(self){
objj_msgSend(_menuView,"setFont:",_105);
}
}),new objj_method(sel_getUid("setBackgroundStyle:"),function(self,_106,_107){
with(self){
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(objj_msgSend(self,"class"),"backgroundColorForBackgroundStyle:",_107));
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_108,_109){
with(self){
objj_msgSend(_109,"_setMenuWindow:",self);
objj_msgSend(_menuView,"setMenu:",_109);
var _10a=objj_msgSend(_menuView,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(_fd+_10a.width+_fe,_fc+_10a.height+_ff));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,0));
objj_msgSend(_menuClipView,"setFrame:",CGRectMake(_fd,_fc,_10a.width,_10a.height));
}
}),new objj_method(sel_getUid("setMinWidth:"),function(self,_10b,_10c){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(MAX(size.width,_10c),size.height));
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_10d,_10e){
with(self){
return objj_msgSend(_menuView,"convertRect:toView:",objj_msgSend(_menuView,"rectForItemAtIndex:",_10e),nil);
}
}),new objj_method(sel_getUid("orderFront:"),function(self,_10f,_110){
with(self){
objj_msgSend(self,"constrainToScreen");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"orderFront:",_110);
}
}),new objj_method(sel_getUid("constrainToScreen"),function(self,_111){
with(self){
_unconstrainedFrame=CGRectMakeCopy(objj_msgSend(self,"frame"));
var _112=objj_msgSend(CPPlatform,"isBrowser"),_113=CGRectInset(_112?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5),_114=CGRectIntersection(_unconstrainedFrame,_113);
_114.origin.x=CGRectGetMinX(_unconstrainedFrame);
_114.size.width=CGRectGetWidth(_unconstrainedFrame);
if(CGRectGetWidth(_114)>CGRectGetWidth(_113)){
_114.size.width=CGRectGetWidth(_113);
}
if(CGRectGetMaxX(_114)>CGRectGetMaxX(_113)){
_114.origin.x-=CGRectGetMaxX(_114)-CGRectGetMaxX(_113);
}
if(CGRectGetMinX(_114)<CGRectGetMinX(_113)){
_114.origin.x=CGRectGetMinX(_113);
}
var _115=objj_msgSend(self,"convertBaseToGlobal:",CGPointMake(_fd,_fc));
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"setFrame:",_114);
var _116=_115.y<CGRectGetMinY(_114)+_fc,_117=_115.y+CGRectGetHeight(objj_msgSend(_menuView,"frame"))>CGRectGetMaxY(_114)-_ff,_118=_fc,_119=_ff,_11a=objj_msgSend(self,"contentView"),_11b=objj_msgSend(_11a,"bounds");
if(_116){
_118+=_100;
var _11c=objj_msgSend(_moreAboveView,"frame");
objj_msgSend(_moreAboveView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_11b)-CGRectGetWidth(_11c))/2,(_fc+_100-CGRectGetHeight(_11c))/2));
}
objj_msgSend(_moreAboveView,"setHidden:",!_116);
if(_117){
_119+=_100;
objj_msgSend(_moreBelowView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_11b)-CGRectGetWidth(objj_msgSend(_moreBelowView,"frame")))/2,CGRectGetHeight(_11b)-_100-_ff));
}
objj_msgSend(_moreBelowView,"setHidden:",!_117);
var _11d=CGRectMake(_fd,_118,CGRectGetWidth(_114)-_fd-_fe,CGRectGetHeight(_114)-_118-_119);
objj_msgSend(_menuClipView,"setFrame:",_11d);
objj_msgSend(_menuView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_11d),CGRectGetHeight(objj_msgSend(_menuView,"frame"))));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,objj_msgSend(self,"convertBaseToGlobal:",_11d.origin).y-_115.y));
}
}),new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"),function(self,_11e,_11f,_120,_121){
with(self){
CPApp._activeMenu=objj_msgSend(_menuView,"menu");
_startTime=objj_msgSend(_11f,"timestamp");
_scrollingState=_fa;
_trackingCanceled=NO;
_sessionDelegate=_120;
_didEndSelector=_121;
objj_msgSend(self,"trackEvent:",_11f);
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_122,_123){
with(self){
var type=objj_msgSend(_123,"type"),menu=objj_msgSend(_menuView,"menu");
if(type===CPAppKitDefined){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _124=objj_msgSend(objj_msgSend(_menuView,"menu"),"highlightedItem");
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
objj_msgSend(self,"orderOut:",self);
var _125=objj_msgSend(menu,"delegate");
if(objj_msgSend(_125,"respondsToSelector:",sel_getUid("menuDidClose:"))){
objj_msgSend(_125,"menuDidClose:",menu);
}
if(_sessionDelegate&&_didEndSelector){
objj_msgSend(_sessionDelegate,_didEndSelector,self,_124);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPMenuDidEndTrackingNotification,menu);
objj_msgSend(_menuView,"setMenu:",nil);
CPApp._activeMenu=nil;
return;
}
var _126=objj_msgSend(_123,"window"),_127=_126?objj_msgSend(_126,"convertBaseToGlobal:",objj_msgSend(_123,"locationInWindow")):objj_msgSend(_123,"locationInWindow");
if(type===CPPeriodic){
var _128=CGRectInset(objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5);
if(_scrollingState==_f8){
if(CGRectGetMinY(_unconstrainedFrame)<CGRectGetMinY(_128)){
_unconstrainedFrame.origin.y+=10;
}
}else{
if(_scrollingState==_f9){
if(CGRectGetMaxY(_unconstrainedFrame)>CGRectGetHeight(_128)){
_unconstrainedFrame.origin.y-=10;
}
}
}
objj_msgSend(self,"setFrame:",_unconstrainedFrame);
objj_msgSend(self,"constrainToScreen");
_127=_lastGlobalLocation;
}
_lastGlobalLocation=_127;
var _129=objj_msgSend(self,"convertGlobalToBase:",_127),_12a=objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",_129,nil)),_12b=objj_msgSend(objj_msgSend(menu,"itemAtIndex:",_12a),"view");
if(_12b){
if(!_lastMouseOverMenuView){
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
}
if(_lastMouseOverMenuView!=_12b){
objj_msgSend(_12b,"mouseExited:",_123);
objj_msgSend(_lastMouseOverMenuView,"mouseEntered:",_123);
_lastMouseOverMenuView=_12b;
}
objj_msgSend(self,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",type,_129,objj_msgSend(_123,"modifierFlags"),objj_msgSend(_123,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_123,"clickCount"),objj_msgSend(_123,"pressure")));
}else{
if(_lastMouseOverMenuView){
objj_msgSend(_lastMouseOverMenuView,"mouseExited:",_123);
_lastMouseOverMenuView=nil;
}
objj_msgSend(menu,"_highlightItemAtIndex:",objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",objj_msgSend(self,"convertGlobalToBase:",_127),nil)));
if(type==CPMouseMoved||type==CPLeftMouseDragged||type==CPLeftMouseDown){
var _12c=objj_msgSend(self,"frame"),_12d=_scrollingState;
_scrollingState=_fa;
if(_127.y<CGRectGetMinY(_12c)+_fc+_100){
_scrollingState=_f8;
}else{
if(_127.y>CGRectGetMaxY(_12c)-_ff-_100){
_scrollingState=_f9;
}
}
if(_scrollingState!=_12d){
if(_scrollingState==_fa){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}else{
if(_12d==_fa){
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.04);
}
}
}
}else{
if(type==CPLeftMouseUp&&(objj_msgSend(_123,"timestamp")-_startTime>_fb)){
objj_msgSend(menu,"cancelTracking");
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask|CPAppKitDefinedMask,nil,nil,YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("menuWindowWithMenu:font:"),function(self,_12e,_12f,_130){
with(self){
var _131=nil;
if(_f5.length){
_131=_f5.pop();
}else{
_131=objj_msgSend(objj_msgSend(_CPMenuWindow,"alloc"),"init");
}
objj_msgSend(_131,"setFont:",_130);
objj_msgSend(_131,"setMenu:",_12f);
return _131;
}
}),new objj_method(sel_getUid("poolMenuWindow:"),function(self,_132,_133){
with(self){
if(!_133||_f5.length>=_f6){
return;
}
_f5.push(_133);
}
}),new objj_method(sel_getUid("initialize"),function(self,_134){
with(self){
if(self!=objj_msgSend(_CPMenuWindow,"class")){
return;
}
var _135=objj_msgSend(CPBundle,"bundleForClass:",self);
_CPMenuWindowMoreAboveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_135,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreAbove.png"),CGSizeMake(38,18));
_CPMenuWindowMoreBelowImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_135,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreBelow.png"),CGSizeMake(38,18));
}
}),new objj_method(sel_getUid("backgroundColorForBackgroundStyle:"),function(self,_136,_137){
with(self){
var _138=_f7[_137];
if(!_138){
var _139=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(self,"class"));
if(_137==_CPMenuWindowPopUpBackgroundStyle){
_138=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}else{
if(_137==_CPMenuWindowMenuBarBackgroundStyle){
_138=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_139,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}
}
_f7[_137]=_138;
}
return _138;
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPMenuView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuItemViews"),new objj_ivar("_visibleMenuItemInfos"),new objj_ivar("_font")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("setFont:"),function(self,_13a,_13b){
with(self){
_font=_13b;
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_13c,_13d){
with(self){
return objj_msgSend(_menuItemViews[_13d==CPNotFound?0:_13d],"frame");
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(self,_13e,_13f){
with(self){
var x=_13f.x,_140=objj_msgSend(self,"bounds");
if(x<CGRectGetMinX(_140)||x>CGRectGetMaxX(_140)){
return CPNotFound;
}
var y=_13f.y,low=0,high=_visibleMenuItemInfos.length-1;
while(low<=high){
var _141=FLOOR(low+(high-low)/2),info=_visibleMenuItemInfos[_141];
frame=objj_msgSend(info.view,"frame");
if(y<CGRectGetMinY(frame)){
high=_141-1;
}else{
if(y>CGRectGetMaxY(frame)){
low=_141+1;
}else{
return info.index;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_142,_143){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView")},"setMenu:",_143);
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
_menuItemViews=[];
_visibleMenuItemInfos=[];
var menu=objj_msgSend(self,"menu");
if(!menu){
return;
}
var _144=objj_msgSend(menu,"itemArray"),_145=0,_146=objj_msgSend(_144,"count"),_147=0,y=0,_148=objj_msgSend(menu,"showsStateColumn");
for(;_145<_146;++_145){
var item=_144[_145],view=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(view);
if(objj_msgSend(item,"isHidden")){
continue;
}
_visibleMenuItemInfos.push({view:view,index:_145});
objj_msgSend(view,"setFont:",_font);
objj_msgSend(view,"setShowsStateColumn:",_148);
objj_msgSend(view,"synchronizeWithMenuItem");
objj_msgSend(view,"setFrameOrigin:",CGPointMake(0,y));
objj_msgSend(self,"addSubview:",view);
var size=objj_msgSend(view,"minSize"),_149=size.width;
if(_147<_149){
_147=_149;
}
y+=size.height;
}
for(_145=0;_145<_146;++_145){
var view=_menuItemViews[_145];
objj_msgSend(view,"setFrameSize:",CGSizeMake(_147,CGRectGetHeight(objj_msgSend(view,"frame"))));
}
objj_msgSend(self,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setFrameSize:",CGSizeMake(_147,y));
objj_msgSend(self,"setAutoresizesSubviews:",YES);
}
})]);
var _1=29,_14a=10,_14b=10,_14c=10;
var _14d=nil,_14e=nil;
var _8=objj_allocateClassPair(CPPanel,"_CPMenuBarWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menu"),new objj_ivar("_highlightView"),new objj_ivar("_menuItemViews"),new objj_ivar("_trackingMenuItem"),new objj_ivar("_iconImageView"),new objj_ivar("_titleField"),new objj_ivar("_textColor"),new objj_ivar("_titleColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_titleShadowColor"),new objj_ivar("_highlightColor"),new objj_ivar("_highlightTextColor"),new objj_ivar("_highlightTextShadowColor")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(self,_14f){
with(self){
var _150=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds");
_150.size.height=_1;
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",_150,CPBorderlessWindowMask);
if(self){
objj_msgSend(self,"setLevel:",-1);
objj_msgSend(self,"setAutoresizingMask:",CPWindowWidthSizable);
var _151=objj_msgSend(self,"contentView");
objj_msgSend(_151,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setBecomesKeyOnlyIfNeeded:",YES);
_iconImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_151,"addSubview:",_iconImageView);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_151,"addSubview:",_titleField);
}
return self;
}
}),new objj_method(sel_getUid("setTitle:"),function(self,_152,_153){
with(self){
objj_msgSend(_titleField,"setStringValue:",_153);
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImage:"),function(self,_154,_155){
with(self){
objj_msgSend(_iconImageView,"setImage:",_155);
objj_msgSend(_iconImageView,"setHidden:",_155==nil);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImageAlphaValue:"),function(self,_156,_157){
with(self){
objj_msgSend(_iconImageView,"setAlphaValue:",_157);
}
}),new objj_method(sel_getUid("setColor:"),function(self,_158,_159){
with(self){
if(!_159){
if(!_14d){
_14d=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuBarWindow,"class")),"pathForResource:","_CPMenuBarWindow/_CPMenuBarWindowBackground.png"),CGSizeMake(1,18)));
}
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_14d);
}else{
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_159);
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(self,_15a,_15b){
with(self){
if(_textColor==_15b){
return;
}
_textColor=_15b;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextColor:"),_textColor);
}
}),new objj_method(sel_getUid("setTitleColor:"),function(self,_15c,_15d){
with(self){
if(_titleColor==_15d){
return;
}
_titleColor=_15d;
objj_msgSend(_titleField,"setTextColor:",_15d?_15d:objj_msgSend(CPColor,"blackColor"));
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(self,_15e,_15f){
with(self){
if(_textShadowColor==_15f){
return;
}
_textShadowColor=_15f;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextShadowColor:"),_textShadowColor);
}
}),new objj_method(sel_getUid("setTitleShadowColor:"),function(self,_160,_161){
with(self){
if(_titleShadowColor==_161){
return;
}
_titleShadowColor=_161;
objj_msgSend(_titleField,"setTextShadowColor:",_161?_161:objj_msgSend(CPColor,"whiteColor"));
}
}),new objj_method(sel_getUid("setHighlightColor:"),function(self,_162,_163){
with(self){
if(_highlightColor==_163){
return;
}
_highlightColor=_163;
}
}),new objj_method(sel_getUid("setHighlightTextColor:"),function(self,_164,_165){
with(self){
if(_highlightTextColor==_165){
return;
}
_highlightTextColor=_165;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateColor:"),_highlightTextColor);
}
}),new objj_method(sel_getUid("setHighlightTextShadowColor:"),function(self,_166,_167){
with(self){
if(_highlightTextShadowColor==_167){
return;
}
_highlightTextShadowColor=_167;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateShadowColor:"),_highlightTextShadowColor);
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_168,_169){
with(self){
if(_menu==_169){
return;
}
var _16a=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_16a,"removeObserver:name:object:",self,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_16a,"removeObserver:name:object:",self,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_16a,"removeObserver:name:object:",self,CPMenuDidRemoveItemNotification,_menu);
var _16b=objj_msgSend(_menu,"itemArray"),_16c=_16b.length;
while(_16c--){
objj_msgSend(objj_msgSend(_16b[_16c],"_menuItemView"),"removeFromSuperview");
}
}
_menu=_169;
if(_menu){
objj_msgSend(_16a,"addObserver:selector:name:object:",self,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_16a,"addObserver:selector:name:object:",self,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_16a,"addObserver:selector:name:object:",self,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
_menuItemViews=[];
var _16d=objj_msgSend(self,"contentView"),_16b=objj_msgSend(_menu,"itemArray"),_16c=_16b.length;
for(index=0;index<_16c;++index){
var item=_16b[index],_16e=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(_16e);
objj_msgSend(_16e,"setShowsStateColumn:",NO);
objj_msgSend(_16e,"setBelongsToMenuBar:",YES);
objj_msgSend(_16e,"setFont:",_14e);
objj_msgSend(_16e,"setTextColor:",_textColor);
objj_msgSend(_16e,"setHidden:",objj_msgSend(item,"isHidden"));
objj_msgSend(_16e,"synchronizeWithMenuItem");
objj_msgSend(_16d,"addSubview:",_16e);
}
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(self,_16f,_170){
with(self){
var _171=objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(objj_msgSend(_170,"userInfo"),"objectForKey:","CPMenuItemIndex")),_172=objj_msgSend(_171,"_menuItemView");
objj_msgSend(_172,"setHidden:",objj_msgSend(_171,"isHidden"));
objj_msgSend(_172,"synchronizeWithMenuItem");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(self,_173,_174){
with(self){
var _175=objj_msgSend(objj_msgSend(_174,"userInfo"),"objectForKey:","CPMenuItemIndex"),_176=objj_msgSend(_menu,"itemAtIndex:",_175),_177=objj_msgSend(_176,"_menuItemView");
objj_msgSend(_menuItemViews,"insertObject:atIndex:",_177,_175);
objj_msgSend(_177,"setShowsStateColumn:",NO);
objj_msgSend(_177,"setBelongsToMenuBar:",YES);
objj_msgSend(_177,"setFont:",_14e);
objj_msgSend(_177,"setTextColor:",_textColor);
objj_msgSend(_177,"setHidden:",objj_msgSend(_176,"isHidden"));
objj_msgSend(_177,"synchronizeWithMenuItem");
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:",_177);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(self,_178,_179){
with(self){
var _17a=objj_msgSend(objj_msgSend(_179,"userInfo"),"objectForKey:","CPMenuItemIndex"),_17b=objj_msgSend(_menuItemViews,"objectAtIndex:",_17a);
objj_msgSend(_menuItemViews,"removeObjectAtIndex:",_17a);
objj_msgSend(_17b,"removeFromSuperview");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("frameForMenuItem:"),function(self,_17c,_17d){
with(self){
var _17e=objj_msgSend(objj_msgSend(_17d,"_menuItemView"),"frame");
_17e.origin.x-=5;
_17e.origin.y=0;
_17e.size.width+=10;
_17e.size.height=_1;
return _17e;
}
}),new objj_method(sel_getUid("menuItemAtPoint:"),function(self,_17f,_180){
with(self){
var _181=objj_msgSend(_menu,"itemArray"),_182=_181.length;
while(_182--){
var item=_181[_182];
if(objj_msgSend(item,"isHidden")||objj_msgSend(item,"isSeparatorItem")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(self,"frameForMenuItem:",item),_180)){
return item;
}
}
return nil;
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_183,_184){
with(self){
_trackingMenuItem=objj_msgSend(self,"menuItemAtPoint:",objj_msgSend(_184,"locationInWindow"));
if(!objj_msgSend(_trackingMenuItem,"isEnabled")){
return;
}
if(objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"eventOnSubmenu:",_184)){
return objj_msgSend(self,"showMenu:",_184);
}
if(objj_msgSend(_trackingMenuItem,"isEnabled")){
objj_msgSend(self,"trackEvent:",_184);
}
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_185,_186){
with(self){
var type=objj_msgSend(_186,"type");
if(type===CPPeriodic){
return objj_msgSend(self,"showMenu:",_186);
}
var _187=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_188=objj_msgSend(_trackingMenuItem,"_menuItemView"),_189=CGRectContainsPoint(_187,objj_msgSend(_186,"locationInWindow"));
if(type==CPLeftMouseDown){
if(objj_msgSend(_trackingMenuItem,"submenu")!=nil){
var _18a=objj_msgSend(_trackingMenuItem,"action");
if(!_18a||_18a===sel_getUid("submenuAction:")){
return objj_msgSend(self,"showMenu:",_186);
}
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.5);
}
objj_msgSend(_188,"highlight:",_189);
}else{
if(type==CPLeftMouseDragged){
if(!_189&&objj_msgSend(_trackingMenuItem,"submenu")){
return objj_msgSend(self,"showMenu:",_186);
}
objj_msgSend(_188,"highlight:",_189);
}else{
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(_188,"highlight:",NO);
if(_189){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_trackingMenuItem,"action"),objj_msgSend(_trackingMenuItem,"target"),_trackingMenuItem);
}
return;
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("showMenu:"),function(self,_18b,_18c){
with(self){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _18d=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_18e=objj_msgSend(_trackingMenuItem,"_menuItemView");
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_18d);
objj_msgSend(_highlightView,"setBackgroundColor:",_highlightColor?_highlightColor:objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",95/255,131/255,185/255,1));
}else{
objj_msgSend(_highlightView,"setFrame:",_18d);
}
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_18e);
objj_msgSend(_18e,"activate:",YES);
var _18f=objj_msgSend(_trackingMenuItem,"submenu");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("menuDidEndTracking:"),CPMenuDidEndTrackingNotification,_18f);
objj_msgSend(CPMenu,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_18f,objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,CGPointMake(CGRectGetMinX(_18d),CGRectGetMaxY(_18d)),objj_msgSend(_18c,"modifierFlags"),objj_msgSend(_18c,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_18c,"clickCount"),objj_msgSend(_18c,"pressure")),objj_msgSend(self,"contentView"),nil,YES);
}
}),new objj_method(sel_getUid("menuDidEndTracking:"),function(self,_190,_191){
with(self){
objj_msgSend(_highlightView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"activate:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",self,CPMenuDidEndTrackingNotification,objj_msgSend(_191,"object"));
}
}),new objj_method(sel_getUid("tile"),function(self,_192){
with(self){
var _193=objj_msgSend(_menu,"itemArray"),_194=0,_195=_193.length,x=_14b,y=0,_196=YES;
for(;_194<_195;++_194){
var item=_193[_194];
if(objj_msgSend(item,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(self,"frame"))-_14c;
_196=NO;
continue;
}
if(objj_msgSend(item,"isHidden")){
continue;
}
var _197=objj_msgSend(item,"_menuItemView"),_198=objj_msgSend(_197,"frame");
if(_196){
objj_msgSend(_197,"setFrameOrigin:",CGPointMake(x,(_1-1-CGRectGetHeight(_198))/2));
x+=CGRectGetWidth(objj_msgSend(_197,"frame"))+_14a;
}else{
objj_msgSend(_197,"setFrameOrigin:",CGPointMake(x-CGRectGetWidth(_198),(_1-1-CGRectGetHeight(_198))/2));
x=CGRectGetMinX(objj_msgSend(_197,"frame"))-_14a;
}
}
var _199=objj_msgSend(objj_msgSend(self,"contentView"),"bounds"),_19a=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_199)-CGRectGetWidth(_19a))/2,(CGRectGetHeight(_199)-CGRectGetHeight(_19a))/2));
}else{
var _19b=objj_msgSend(_iconImageView,"frame"),_19c=CGRectGetWidth(_19b),_19d=_19c+CGRectGetWidth(_19a);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_199)-_19d)/2,(CGRectGetHeight(_199)-CGRectGetHeight(_19b))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_199)-_19d)/2+_19c,(CGRectGetHeight(_199)-CGRectGetHeight(_19a))/2));
}
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(self,_19e,_19f,_1a0,_1a1){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"setFrame:display:animate:",_19f,_1a0,_1a1);
if(!(size.width==_19f.size.width&&size.height==_19f.size.height)){
objj_msgSend(self,"tile");
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(self,_1a2){
with(self){
if(self!=objj_msgSend(_CPMenuBarWindow,"class")){
return;
}
var _1a3=objj_msgSend(CPBundle,"bundleForClass:",self);
_14e=objj_msgSend(CPFont,"systemFontOfSize:",11);
}
})]);
p;12;CPMenuItem.jI;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;23582;
var _1=objj_allocateClassPair(CPObject,"CPMenuItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isSeparator"),new objj_ivar("_title"),new objj_ivar("_font"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_isHidden"),new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_onStateImage"),new objj_ivar("_offStateImage"),new objj_ivar("_mixedStateImage"),new objj_ivar("_submenu"),new objj_ivar("_menu"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask"),new objj_ivar("_mnemonicLocation"),new objj_ivar("_isAlternate"),new objj_ivar("_indentationLevel"),new objj_ivar("_toolTip"),new objj_ivar("_representedObject"),new objj_ivar("_view"),new objj_ivar("_menuItemView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithTitle:action:keyEquivalent:","",nil,nil);
}
}),new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_isSeparator=NO;
_title=_7;
_action=_8;
_isEnabled=YES;
_tag=0;
_state=CPOffState;
_keyEquivalent=_9||"";
_keyEquivalentModifierMask=CPPlatformActionKeyMask;
_mnemonicLocation=CPNotFound;
}
return _5;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_menu,"autoenablesItems")){
return;
}
_isEnabled=_c;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_a);
}
}),new objj_method(sel_getUid("isEnabled"),function(_d,_e){
with(_d){
return _isEnabled;
}
}),new objj_method(sel_getUid("setHidden:"),function(_f,_10,_11){
with(_f){
if(_isHidden==_11){
return;
}
_isHidden=_11;
objj_msgSend(_menu,"itemChanged:",_f);
}
}),new objj_method(sel_getUid("isHidden"),function(_12,_13){
with(_12){
return _isHidden;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_14,_15){
with(_14){
if(_isHidden){
return YES;
}
var _16=objj_msgSend(_menu,"supermenu");
if(objj_msgSend(objj_msgSend(_16,"itemAtIndex:",objj_msgSend(_16,"indexOfItemWithSubmenu:",_menu)),"isHiddenOrHasHiddenAncestor")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("setTarget:"),function(_17,_18,_19){
with(_17){
_target=_19;
}
}),new objj_method(sel_getUid("target"),function(_1a,_1b){
with(_1a){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1c,_1d,_1e){
with(_1c){
_action=_1e;
}
}),new objj_method(sel_getUid("action"),function(_1f,_20){
with(_1f){
return _action;
}
}),new objj_method(sel_getUid("setTitle:"),function(_21,_22,_23){
with(_21){
_mnemonicLocation=CPNotFound;
if(_title==_23){
return;
}
_title=_23;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_21);
}
}),new objj_method(sel_getUid("title"),function(_24,_25){
with(_24){
return _title;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_26,_27,_28){
with(_26){
}
}),new objj_method(sel_getUid("setFont:"),function(_29,_2a,_2b){
with(_29){
if(_font==_2b){
return;
}
_font=_2b;
objj_msgSend(_menu,"itemChanged:",_29);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("font"),function(_2c,_2d){
with(_2c){
return _font;
}
}),new objj_method(sel_getUid("setTag:"),function(_2e,_2f,_30){
with(_2e){
_tag=_30;
}
}),new objj_method(sel_getUid("tag"),function(_31,_32){
with(_31){
return _tag;
}
}),new objj_method(sel_getUid("setState:"),function(_33,_34,_35){
with(_33){
if(_state==_35){
return;
}
_state=_35;
objj_msgSend(_menu,"itemChanged:",_33);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("state"),function(_36,_37){
with(_36){
return _state;
}
}),new objj_method(sel_getUid("setImage:"),function(_38,_39,_3a){
with(_38){
if(_image==_3a){
return;
}
_image=_3a;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_38);
}
}),new objj_method(sel_getUid("image"),function(_3b,_3c){
with(_3b){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_3d,_3e,_3f){
with(_3d){
_alternateImage=_3f;
}
}),new objj_method(sel_getUid("alternateImage"),function(_40,_41){
with(_40){
return _alternateImage;
}
}),new objj_method(sel_getUid("setOnStateImage:"),function(_42,_43,_44){
with(_42){
if(_onStateImage==_44){
return;
}
_onStateImage=_44;
objj_msgSend(_menu,"itemChanged:",_42);
}
}),new objj_method(sel_getUid("onStateImage"),function(_45,_46){
with(_45){
return _onStateImage;
}
}),new objj_method(sel_getUid("setOffStateImage:"),function(_47,_48,_49){
with(_47){
if(_offStateImage==_49){
return;
}
_offStateImage=_49;
objj_msgSend(_menu,"itemChanged:",_47);
}
}),new objj_method(sel_getUid("offStateImage"),function(_4a,_4b){
with(_4a){
return _offStateImage;
}
}),new objj_method(sel_getUid("setMixedStateImage:"),function(_4c,_4d,_4e){
with(_4c){
if(_mixedStateImage==_4e){
return;
}
_mixedStateImage=_4e;
objj_msgSend(_menu,"itemChanged:",_4c);
}
}),new objj_method(sel_getUid("mixedStateImage"),function(_4f,_50){
with(_4f){
return _mixedStateImage;
}
}),new objj_method(sel_getUid("setSubmenu:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_submenu,"supermenu");
if(_54==_51){
return;
}
if(_54){
return alert("bad");
}
objj_msgSend(_submenu,"setSupermenu:",_menu);
_submenu=_53;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_51);
}
}),new objj_method(sel_getUid("submenu"),function(_55,_56){
with(_55){
return _submenu;
}
}),new objj_method(sel_getUid("hasSubmenu"),function(_57,_58){
with(_57){
return _submenu?YES:NO;
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_59,_5a){
with(_59){
return _isSeparator;
}
}),new objj_method(sel_getUid("setMenu:"),function(_5b,_5c,_5d){
with(_5b){
_menu=_5d;
}
}),new objj_method(sel_getUid("menu"),function(_5e,_5f){
with(_5e){
return _menu;
}
}),new objj_method(sel_getUid("setKeyEquivalent:"),function(_60,_61,_62){
with(_60){
_keyEquivalent=_62||"";
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_63,_64){
with(_63){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("setKeyEquivalentModifierMask:"),function(_65,_66,_67){
with(_65){
_keyEquivalentModifierMask=_67;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_68,_69){
with(_68){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("setMnemonicLocation:"),function(_6a,_6b,_6c){
with(_6a){
_mnemonicLocation=_6c;
}
}),new objj_method(sel_getUid("mnemonicLocation"),function(_6d,_6e){
with(_6d){
return _mnemonicLocation;
}
}),new objj_method(sel_getUid("setTitleWithMnemonicLocation:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_71,"rangeOfString:","&").location;
if(_72==CPNotFound){
objj_msgSend(_6f,"setTitle:",_71);
}else{
objj_msgSend(_6f,"setTitle:",objj_msgSend(_71,"substringToIndex:",_72)+objj_msgSend(_71,"substringFromIndex:",_72+1));
objj_msgSend(_6f,"setMnemonicLocation:",_72);
}
}
}),new objj_method(sel_getUid("mnemonic"),function(_73,_74){
with(_73){
return _mnemonicLocation==CPNotFound?"":objj_msgSend(_title,"characterAtIndex:",_mnemonicLocation);
}
}),new objj_method(sel_getUid("setAlternate:"),function(_75,_76,_77){
with(_75){
_isAlternate=_77;
}
}),new objj_method(sel_getUid("isAlternate"),function(_78,_79){
with(_78){
return _isAlternate;
}
}),new objj_method(sel_getUid("setIndentationLevel:"),function(_7a,_7b,_7c){
with(_7a){
if(_7c<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"setIndentationLevel: argument must be greater than 0.");
}
_indentationLevel=MIN(15,_7c);
}
}),new objj_method(sel_getUid("indentationLevel"),function(_7d,_7e){
with(_7d){
return _indentationLevel;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_7f,_80,_81){
with(_7f){
_toolTip=_81;
}
}),new objj_method(sel_getUid("toolTip"),function(_82,_83){
with(_82){
return _toolTip;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_84,_85,_86){
with(_84){
_representedObject=_86;
}
}),new objj_method(sel_getUid("representedObject"),function(_87,_88){
with(_87){
return _representedObject;
}
}),new objj_method(sel_getUid("setView:"),function(_89,_8a,_8b){
with(_89){
if(_view===_8b){
return;
}
_view=_8b;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_89);
}
}),new objj_method(sel_getUid("view"),function(_8c,_8d){
with(_8c){
return _view;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_8e,_8f){
with(_8e){
return objj_msgSend(objj_msgSend(_8e,"menu"),"highlightedItem")==_8e;
}
}),new objj_method(sel_getUid("_menuItemView"),function(_90,_91){
with(_90){
if(!_menuItemView){
_menuItemView=objj_msgSend(objj_msgSend(_CPMenuItemView,"alloc"),"initWithFrame:forMenuItem:",CGRectMakeZero(),_90);
}
return _menuItemView;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("separatorItem"),function(_92,_93){
with(_92){
var _94=objj_msgSend(objj_msgSend(_92,"alloc"),"initWithTitle:action:keyEquivalent:","",nil,nil);
_94._isSeparator=YES;
return _94;
}
})]);
var _95="CPMenuItemIsSeparatorKey",_96="CPMenuItemTitleKey",_97="CPMenuItemTargetKey",_98="CPMenuItemActionKey",_99="CPMenuItemIsEnabledKey",_9a="CPMenuItemIsHiddenKey",_9b="CPMenuItemTagKey",_9c="CPMenuItemStateKey",_9d="CPMenuItemImageKey",_9e="CPMenuItemAlternateImageKey",_9f="CPMenuItemSubmenuKey",_a0="CPMenuItemMenuKey",_a1="CPMenuItemKeyEquivalentKey",_a2="CPMenuItemKeyEquivalentModifierMaskKey",_a3="CPMenuItemRepresentedObjectKey",_a4="CPMenuItemViewKey";
var _1=objj_getClass("CPMenuItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenuItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a5,_a6,_a7){
with(_a5){
_a5=objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("CPObject")},"init");
if(_a5){
_isSeparator=objj_msgSend(_a7,"containsValueForKey:",_95)&&objj_msgSend(_a7,"decodeBoolForKey:",_95);
_title=objj_msgSend(_a7,"decodeObjectForKey:",_96);
_target=objj_msgSend(_a7,"decodeObjectForKey:",_97);
_action=objj_msgSend(_a7,"decodeObjectForKey:",_98);
_isEnabled=objj_msgSend(_a7,"containsValueForKey:",(_99))?objj_msgSend(_a7,"decodeObjectForKey:",(_99)):(YES);
_isHidden=objj_msgSend(_a7,"containsValueForKey:",(_9a))?objj_msgSend(_a7,"decodeObjectForKey:",(_9a)):(NO);
_tag=objj_msgSend(_a7,"containsValueForKey:",(_9b))?objj_msgSend(_a7,"decodeObjectForKey:",(_9b)):(0);
_state=objj_msgSend(_a7,"containsValueForKey:",(_9c))?objj_msgSend(_a7,"decodeObjectForKey:",(_9c)):(CPOffState);
_image=objj_msgSend(_a7,"containsValueForKey:",(_9d))?objj_msgSend(_a7,"decodeObjectForKey:",(_9d)):(nil);
_alternateImage=objj_msgSend(_a7,"containsValueForKey:",(_9e))?objj_msgSend(_a7,"decodeObjectForKey:",(_9e)):(nil);
_submenu=objj_msgSend(_a7,"containsValueForKey:",(_9f))?objj_msgSend(_a7,"decodeObjectForKey:",(_9f)):(nil);
_menu=objj_msgSend(_a7,"containsValueForKey:",(_a0))?objj_msgSend(_a7,"decodeObjectForKey:",(_a0)):(nil);
_keyEquivalent=objj_msgSend(_a7,"decodeObjectForKey:",_a1)||"";
_keyEquivalentModifierMask=objj_msgSend(_a7,"decodeObjectForKey:",_a2)||0;
_representedObject=objj_msgSend(_a7,"containsValueForKey:",(_a3))?objj_msgSend(_a7,"decodeObjectForKey:",(_a3)):(nil);
_view=objj_msgSend(_a7,"containsValueForKey:",(_a4))?objj_msgSend(_a7,"decodeObjectForKey:",(_a4)):(nil);
}
return _a5;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a8,_a9,_aa){
with(_a8){
if(_isSeparator){
objj_msgSend(_aa,"encodeBool:forKey:",_isSeparator,_95);
}
objj_msgSend(_aa,"encodeObject:forKey:",_title,_96);
objj_msgSend(_aa,"encodeObject:forKey:",_target,_97);
objj_msgSend(_aa,"encodeObject:forKey:",_action,_98);
if((_isEnabled)!==(YES)){
objj_msgSend(_aa,"encodeObject:forKey:",(_isEnabled),(_99));
}
if((_isHidden)!==(NO)){
objj_msgSend(_aa,"encodeObject:forKey:",(_isHidden),(_9a));
}
if((_tag)!==(0)){
objj_msgSend(_aa,"encodeObject:forKey:",(_tag),(_9b));
}
if((_state)!==(CPOffState)){
objj_msgSend(_aa,"encodeObject:forKey:",(_state),(_9c));
}
if((_image)!==(nil)){
objj_msgSend(_aa,"encodeObject:forKey:",(_image),(_9d));
}
if((_alternateImage)!==(nil)){
objj_msgSend(_aa,"encodeObject:forKey:",(_alternateImage),(_9e));
}
if((_submenu)!==(nil)){
objj_msgSend(_aa,"encodeObject:forKey:",(_submenu),(_9f));
}
if((_menu)!==(nil)){
objj_msgSend(_aa,"encodeObject:forKey:",(_menu),(_a0));
}
if(_keyEquivalent&&_keyEquivalent.length){
objj_msgSend(_aa,"encodeObject:forKey:",_keyEquivalent,_a1);
}
if(_keyEquivalentModifierMask){
objj_msgSend(_aa,"encodeObject:forKey:",_keyEquivalentModifierMask,_a2);
}
if((_representedObject)!==(nil)){
objj_msgSend(_aa,"encodeObject:forKey:",(_representedObject),(_a3));
}
if((_view)!==(nil)){
objj_msgSend(_aa,"encodeObject:forKey:",(_view),(_a4));
}
}
})]);
var _ab=3,_ac=16,_ad=14,_ae=17,_af=4;
var _b0=nil,_b1=nil,_b2=[],_b3=[];
var _1=objj_allocateClassPair(CPView,"_CPMenuItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menuItem"),new objj_ivar("_font"),new objj_ivar("_textColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_activateColor"),new objj_ivar("_activateShadowColor"),new objj_ivar("_minSize"),new objj_ivar("_isDirty"),new objj_ivar("_showsStateColumn"),new objj_ivar("_belongsToMenuBar"),new objj_ivar("_stateView"),new objj_ivar("_imageAndTextView"),new objj_ivar("_submenuView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:forMenuItem:"),function(_b4,_b5,_b6,_b7){
with(_b4){
_b4=objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("CPView")},"initWithFrame:",_b6);
if(_b4){
_menuItem=_b7;
_showsStateColumn=YES;
_isDirty=YES;
objj_msgSend(_b4,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_b4,"synchronizeWithMenuItem");
}
return _b4;
}
}),new objj_method(sel_getUid("minSize"),function(_b8,_b9){
with(_b8){
return _minSize;
}
}),new objj_method(sel_getUid("setDirty"),function(_ba,_bb){
with(_ba){
_isDirty=YES;
}
}),new objj_method(sel_getUid("synchronizeWithMenuItem"),function(_bc,_bd){
with(_bc){
if(!_isDirty){
return;
}
_isDirty=NO;
var _be=objj_msgSend(_menuItem,"view");
if(objj_msgSend(_menuItem,"isSeparatorItem")){
var _bf=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,5,10,1));
_be=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,10));
objj_msgSend(_be,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_bf,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_bf,"setBackgroundColor:",objj_msgSend(CPColor,"lightGrayColor"));
objj_msgSend(_be,"addSubview:",_bf);
}
if(_be){
objj_msgSend(_imageAndTextView,"removeFromSuperview");
_imageAndTextView=nil;
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
objj_msgSend(_submenuView,"removeFromSuperview");
_submenuView=nil;
_minSize=objj_msgSend(_be,"frame").size;
objj_msgSend(_bc,"setFrameSize:",_minSize);
objj_msgSend(_bc,"addSubview:",_be);
return;
}
var x=_belongsToMenuBar?0:(_ab+objj_msgSend(_menuItem,"indentationLevel")*_ae);
if(_showsStateColumn){
if(!_stateView){
_stateView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(x,(CGRectGetHeight(objj_msgSend(_bc,"frame"))-_ad)/2,_ad,_ad));
objj_msgSend(_stateView,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_bc,"addSubview:",_stateView);
}
var _c0=objj_msgSend(_menuItem,"state");
switch(_c0){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_b2[_c0]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
x+=_ad;
}else{
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
}
if(!_imageAndTextView){
_imageAndTextView=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,0));
objj_msgSend(_imageAndTextView,"setImagePosition:",CPImageLeft);
objj_msgSend(_imageAndTextView,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_bc,"addSubview:",_imageAndTextView);
}
var _c1=objj_msgSend(_menuItem,"font");
if(!_c1){
_c1=_font;
}
objj_msgSend(_imageAndTextView,"setFont:",_c1);
objj_msgSend(_imageAndTextView,"setVerticalAlignment:",CPCenterVerticalTextAlignment);
objj_msgSend(_imageAndTextView,"setImage:",objj_msgSend(_menuItem,"image"));
objj_msgSend(_imageAndTextView,"setText:",objj_msgSend(_menuItem,"title"));
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_bc,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_bc,"textShadowColor"));
objj_msgSend(_imageAndTextView,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_imageAndTextView,"setFrameOrigin:",CGPointMake(x,_af));
objj_msgSend(_imageAndTextView,"sizeToFit");
var _c2=objj_msgSend(_imageAndTextView,"frame");
_c2.size.height+=2*_af;
x+=CGRectGetWidth(_c2);
if(objj_msgSend(_menuItem,"hasSubmenu")){
x+=3;
if(!_submenuView){
_submenuView=objj_msgSend(objj_msgSend(_CPMenuItemArrowView,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10));
objj_msgSend(_bc,"addSubview:",_submenuView);
}
objj_msgSend(_submenuView,"setHidden:",NO);
objj_msgSend(_submenuView,"setColor:",_belongsToMenuBar?objj_msgSend(_bc,"textColor"):nil);
objj_msgSend(_submenuView,"setFrameOrigin:",CGPointMake(x,(CGRectGetHeight(_c2)-10)/2));
x+=10;
}else{
objj_msgSend(_submenuView,"setHidden:",YES);
}
_minSize=CGSizeMake(x+(_belongsToMenuBar?0:_ac)+3,CGRectGetHeight(_c2));
objj_msgSend(_bc,"setFrameSize:",_minSize);
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(_c3,_c4){
with(_c3){
return _ab+(objj_msgSend(objj_msgSend(_menuItem,"menu"),"showsStateColumn")?_ad:0);
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_c5,_c6,_c7){
with(_c5){
_showsStateColumn=_c7;
}
}),new objj_method(sel_getUid("setBelongsToMenuBar:"),function(_c8,_c9,_ca){
with(_c8){
_belongsToMenuBar=_ca;
}
}),new objj_method(sel_getUid("highlight:"),function(_cb,_cc,_cd){
with(_cb){
if(_belongsToMenuBar){
objj_msgSend(_imageAndTextView,"setImage:",_cd?objj_msgSend(_menuItem,"alternateImage"):objj_msgSend(_menuItem,"image"));
}else{
if(objj_msgSend(_menuItem,"isEnabled")){
if(_cd){
objj_msgSend(_cb,"setBackgroundColor:",_b0);
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",_b1);
}else{
objj_msgSend(_cb,"setBackgroundColor:",nil);
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_cb,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_cb,"textShadowColor"));
}
var _ce=objj_msgSend(_menuItem,"state");
switch(_ce){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_cd?_b3[_ce]:_b2[_ce]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
}
}
}
}),new objj_method(sel_getUid("activate:"),function(_cf,_d0,_d1){
with(_cf){
objj_msgSend(_imageAndTextView,"setImage:",objj_msgSend(_menuItem,"image"));
if(_d1){
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_cf,"activateColor")||objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_cf,"activateShadowColor")||objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_cf,"activateColor")||objj_msgSend(CPColor,"whiteColor"));
}else{
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_cf,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_cf,"textShadowColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_cf,"textColor"));
}
}
}),new objj_method(sel_getUid("eventOnSubmenu:"),function(_d2,_d3,_d4){
with(_d2){
if(!objj_msgSend(_menuItem,"hasSubmenu")){
return NO;
}
return CGRectContainsPoint(objj_msgSend(_submenuView,"frame"),objj_msgSend(_d2,"convertPoint:fromView:",objj_msgSend(_d4,"locationInWindow"),nil));
}
}),new objj_method(sel_getUid("isHidden"),function(_d5,_d6){
with(_d5){
return objj_msgSend(_menuItem,"isHidden");
}
}),new objj_method(sel_getUid("menuItem"),function(_d7,_d8){
with(_d7){
return _menuItem;
}
}),new objj_method(sel_getUid("setFont:"),function(_d9,_da,_db){
with(_d9){
if(_font==_db){
return;
}
_font=_db;
objj_msgSend(_d9,"setDirty");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_dc,_dd,_de){
with(_dc){
if(_textColor==_de){
return;
}
_textColor=_de;
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_dc,"textColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_dc,"textColor"));
}
}),new objj_method(sel_getUid("textColor"),function(_df,_e0){
with(_df){
return objj_msgSend(_menuItem,"isEnabled")?(_textColor?_textColor:objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",70/255,69/255,69/255,1)):objj_msgSend(CPColor,"lightGrayColor");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_e1,_e2,_e3){
with(_e1){
if(_textShadowColor==_e3){
return;
}
_textShadowColor=_e3;
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_e1,"textShadowColor"));
}
}),new objj_method(sel_getUid("textShadowColor"),function(_e4,_e5){
with(_e4){
return objj_msgSend(_menuItem,"isEnabled")?(_textShadowColor?_textShadowColor:objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.8)):objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,0.8);
}
}),new objj_method(sel_getUid("setActivateColor:"),function(_e6,_e7,_e8){
with(_e6){
_activateColor=_e8;
}
}),new objj_method(sel_getUid("activateColor"),function(_e9,_ea){
with(_e9){
return _activateColor;
}
}),new objj_method(sel_getUid("setActivateShadowColor:"),function(_eb,_ec,_ed){
with(_eb){
_activateShadowColor=_ed;
}
}),new objj_method(sel_getUid("activateShadowColor"),function(_ee,_ef){
with(_ee){
return _activateShadowColor;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_f0,_f1){
with(_f0){
if(_f0!=objj_msgSend(_CPMenuItemView,"class")){
return;
}
_b0=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",95/255,131/255,185/255,1);
_b1=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",26/255,73/255,109/255,1);
var _f2=objj_msgSend(CPBundle,"bundleForClass:",_f0);
_b2[CPOffState]=nil;
_b3[CPOffState]=nil;
_b2[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f2,"pathForResource:","CPMenuItem/CPMenuItemOnState.png"),CGSizeMake(14,14));
_b3[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f2,"pathForResource:","CPMenuItem/CPMenuItemOnStateHighlighted.png"),CGSizeMake(14,14));
_b2[CPMixedState]=nil;
_b3[CPMixedState]=nil;
}
}),new objj_method(sel_getUid("leftMargin"),function(_f3,_f4){
with(_f3){
return _ab+_ad;
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPMenuItemArrowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_color")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setColor:"),function(_f5,_f6,_f7){
with(_f5){
if(_color==_f7){
return;
}
_color=_f7;
objj_msgSend(_f5,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_f8,_f9,_fa){
with(_f8){
var _fb=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_fb);
CGContextMoveToPoint(_fb,1,4);
CGContextAddLineToPoint(_fb,9,4);
CGContextAddLineToPoint(_fb,5,8);
CGContextAddLineToPoint(_fb,1,4);
CGContextClosePath(_fb);
CGContextSetFillColor(_fb,_color);
CGContextFillPath(_fb);
}
})]);
p;13;CPOpenPanel.jI;16;AppKit/CPPanel.jc;2075;
var _1=objj_allocateClassPair(CPPanel,"CPOpenPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_canChooseFiles"),new objj_ivar("_canChooseDirectories"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_directoryURL"),new objj_ivar("_URLs")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("canChooseFiles"),function(_3,_4){
with(_3){
return _canChooseFiles;
}
}),new objj_method(sel_getUid("setCanChooseFiles:"),function(_5,_6,_7){
with(_5){
_canChooseFiles=_7;
}
}),new objj_method(sel_getUid("canChooseDirectories"),function(_8,_9){
with(_8){
return _canChooseDirectories;
}
}),new objj_method(sel_getUid("setCanChooseDirectories:"),function(_a,_b,_c){
with(_a){
_canChooseDirectories=_c;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_d,_e){
with(_d){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_f,_10,_11){
with(_f){
_allowsMultipleSelection=_11;
}
}),new objj_method(sel_getUid("directoryURL"),function(_12,_13){
with(_12){
return _directoryURL;
}
}),new objj_method(sel_getUid("setDirectoryURL:"),function(_14,_15,_16){
with(_14){
_directoryURL=_16;
}
}),new objj_method(sel_getUid("runModal"),function(_17,_18){
with(_17){
if(typeof window["cpOpenPanel"]==="function"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
var _19={directoryURL:objj_msgSend(_17,"directoryURL"),canChooseFiles:objj_msgSend(_17,"canChooseFiles"),canChooseDirectories:objj_msgSend(_17,"canChooseDirectories"),allowsMultipleSelection:objj_msgSend(_17,"allowsMultipleSelection")};
var _1a=window.cpOpenPanel(_19);
_URLs=_1a.URLs;
return _1a.button;
}
throw "-runModal is unimplemented.";
}
}),new objj_method(sel_getUid("URLs"),function(_1b,_1c){
with(_1b){
return _URLs;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("openPanel"),function(_1d,_1e){
with(_1d){
return objj_msgSend(objj_msgSend(CPOpenPanel,"alloc"),"init");
}
})]);
p;15;CPOutlineView.ji;15;CPTableColumn.ji;13;CPTableView.jc;20462;
CPOutlineViewColumnDidMoveNotification="CPOutlineViewColumnDidMoveNotification";
CPOutlineViewColumnDidResizeNotification="CPOutlineViewColumnDidResizeNotification";
CPOutlineViewItemDidCollapseNotification="CPOutlineViewItemDidCollapseNotification";
CPOutlineViewItemDidExpandNotification="CPOutlineViewItemDidExpandNotification";
CPOutlineViewItemWillCollapseNotification="CPOutlineViewItemWillCollapseNotification";
CPOutlineViewItemWillExpandNotification="CPOutlineViewItemWillExpandNotification";
CPOutlineViewSelectionDidChangeNotification="CPOutlineViewSelectionDidChangeNotification";
CPOutlineViewSelectionIsChangingNotification="CPOutlineViewSelectionIsChangingNotification";
var _1=1<<1,_2=1<<2,_3=1<<3,_4=1<<4,_5=1<<5,_6=1<<6,_7=1<<7,_8=1<<8,_9=1<<9,_a=1<<10;
var _b=objj_allocateClassPair(CPTableView,"CPOutlineView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineViewDataSource"),new objj_ivar("_outlineViewDelegate"),new objj_ivar("_outlineTableColumn"),new objj_ivar("_indentationPerLevel"),new objj_ivar("_indentationMarkerFollowsDataView"),new objj_ivar("_implementedOutlineViewDataSourceMethods"),new objj_ivar("_rootItemInfo"),new objj_ivar("_itemsForRows"),new objj_ivar("_itemInfosForItems"),new objj_ivar("_disclosureControlPrototype"),new objj_ivar("_disclosureControlsForRows"),new objj_ivar("_disclosureControlData"),new objj_ivar("_disclosureControlQueue")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPTableView")},"initWithFrame:",_f);
if(_d){
_rootItemInfo={isExpanded:YES,isExpandable:NO,level:-1,row:-1,children:[],weight:0};
_itemsForRows=[];
_itemInfosForItems={};
_disclosureControlsForRows=[];
objj_msgSend(_d,"setIndentationPerLevel:",16);
objj_msgSend(_d,"setIndentationMarkerFollowsDataView:",YES);
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPTableView")},"setDataSource:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource,"alloc"),"initWithOutlineView:",_d));
objj_msgSend(_d,"setDisclosureControlPrototype:",objj_msgSend(objj_msgSend(CPDisclosureButton,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10)));
}
return _d;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_10,_11,_12){
with(_10){
if(_outlineViewDataSource===_12){
return;
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:child:ofItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:child:ofItem:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:isItemExpandable:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:isItemExpandable:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:numberOfChildrenOfItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:numberOfChildrenOfItem:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:objectValueForTableColumn:byItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:objectValueForTableColumn:byItem:'");
}
_outlineViewDataSource=_12;
_implementedOutlineViewDataSourceMethods=0;
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:"))){
_implementedOutlineViewDataSourceMethods|=_1;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:"))){
_implementedOutlineViewDataSourceMethods|=_2;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:acceptDrop:item:childIndex:"))){
_implementedOutlineViewDataSourceMethods|=_3;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"))){
_implementedOutlineViewDataSourceMethods|=_4;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedOutlineViewDataSourceMethods|=_5;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:"))){
_implementedOutlineViewDataSourceMethods|=_6;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:itemForPersistentObject:"))){
_implementedOutlineViewDataSourceMethods|=_7;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:persistentObjectForItem:"))){
_implementedOutlineViewDataSourceMethods|=_8;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:writeItems:toPasteboard:"))){
_implementedOutlineViewDataSourceMethods|=_9;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:sortDescriptorsDidChange:"))){
_implementedOutlineViewDataSourceMethods|=_a;
}
objj_msgSend(_10,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_13,_14){
with(_13){
return _outlineViewDataSource;
}
}),new objj_method(sel_getUid("isExpandable:"),function(_15,_16,_17){
with(_15){
if(!_17){
return YES;
}
var _18=_itemInfosForItems[objj_msgSend(_17,"UID")];
if(!_18){
return NO;
}
return _18.isExpandable;
}
}),new objj_method(sel_getUid("isItemExpanded:"),function(_19,_1a,_1b){
with(_19){
if(!_1b){
return YES;
}
var _1c=_itemInfosForItems[objj_msgSend(_1b,"UID")];
if(!_1c){
return NO;
}
return _1c.isExpanded;
}
}),new objj_method(sel_getUid("expandItem:"),function(_1d,_1e,_1f){
with(_1d){
if(!_1f){
return;
}
var _20=_itemInfosForItems[objj_msgSend(_1f,"UID")];
if(!_20){
return;
}
if(_20.isExpanded){
return;
}
_20.isExpanded=YES;
objj_msgSend(_1d,"reloadItem:reloadChildren:",_1f,YES);
}
}),new objj_method(sel_getUid("collapseItem:"),function(_21,_22,_23){
with(_21){
if(!_23){
return;
}
var _24=_itemInfosForItems[objj_msgSend(_23,"UID")];
if(!_24){
return;
}
if(!_24.isExpanded){
return;
}
_24.isExpanded=NO;
objj_msgSend(_21,"reloadItem:reloadChildren:",_23,YES);
}
}),new objj_method(sel_getUid("reloadItem:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"reloadItem:reloadChildren:",_27,NO);
}
}),new objj_method(sel_getUid("reloadItem:reloadChildren:"),function(_28,_29,_2a,_2b){
with(_28){
if(!!_2b||!_2a){
_2c(_28,_2a);
}else{
_2d(_28,_2a);
}
objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPTableView")},"reloadData");
}
}),new objj_method(sel_getUid("itemAtRow:"),function(_2e,_2f,_30){
with(_2e){
return _itemsForRows[_30]||nil;
}
}),new objj_method(sel_getUid("rowForItem:"),function(_31,_32,_33){
with(_31){
if(!anItem){
return _rootItemInfo.row;
}
var _34=_itemInfosForItems[objj_msgSend(anItem,"UID")];
if(!_34){
return CPNotFound;
}
return _34.row;
}
}),new objj_method(sel_getUid("setOutlineTableColumn:"),function(_35,_36,_37){
with(_35){
if(_outlineTableColumn===_37){
return;
}
_outlineTableColumn=_37;
objj_msgSend(_35,"reloadData");
}
}),new objj_method(sel_getUid("outlineTableColumn"),function(_38,_39){
with(_38){
return _outlineTableColumn;
}
}),new objj_method(sel_getUid("levelForItem:"),function(_3a,_3b,_3c){
with(_3a){
if(!_3c){
return _rootItemInfo.level;
}
var _3d=_itemInfosForItems[objj_msgSend(_3c,"UID")];
if(!_3d){
return CPNotFound;
}
return _3d.level;
}
}),new objj_method(sel_getUid("levelForRow:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(_3e,"levelForItem:",objj_msgSend(_3e,"itemAtRow:",_40));
}
}),new objj_method(sel_getUid("setIndentationPerLevel:"),function(_41,_42,_43){
with(_41){
if(_indentationPerLevel===_43){
return;
}
_indentationPerLevel=_43;
objj_msgSend(_41,"reloadData");
}
}),new objj_method(sel_getUid("indentationPerLevel"),function(_44,_45){
with(_44){
return _indentationPerLevel;
}
}),new objj_method(sel_getUid("setIndentationMarkerFollowsDataView:"),function(_46,_47,_48){
with(_46){
if(_indentationMarkerFollowsDataView===_48){
return;
}
_indentationMarkerFollowsDataView=_48;
objj_msgSend(_46,"reloadData");
}
}),new objj_method(sel_getUid("indentationMarkerFollowsDataView"),function(_49,_4a){
with(_49){
return _indentationMarkerFollowsDataView;
}
}),new objj_method(sel_getUid("parentForItem:"),function(_4b,_4c,_4d){
with(_4b){
if(!_4d){
return nil;
}
var _4e=_itemInfosForItems[objj_msgSend(_4d,"UID")];
if(!_4e){
return nil;
}
return _4e.parent;
}
}),new objj_method(sel_getUid("frameOfOutlineDataViewAtColumn:row:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPTableView")},"frameOfDataViewAtColumn:row:",_51,_52),_54=(objj_msgSend(_4f,"levelForRow:",_52)+1)*objj_msgSend(_4f,"indentationPerLevel");
_53.origin.x+=_54;
_53.size.width-=_54;
return _53;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_55,_56,_57){
with(_55){
if(_outlineViewDelegate===_57){
return;
}
var _58=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_outlineViewDelegate){
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidMoveNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidResizeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionDidChangeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionIsChangingNotification,_55);
}
}
_outlineViewDelegate=_57;
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidMoveNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidResizeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionDidChange:"),CPOutlineViewSelectionDidChangeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionIsChanging:"),CPOutlineViewSelectionIsChangingNotification,_55);
}
}
}),new objj_method(sel_getUid("delegate"),function(_59,_5a){
with(_59){
return _outlineViewDelegate;
}
}),new objj_method(sel_getUid("setDisclosureControlPrototype:"),function(_5b,_5c,_5d){
with(_5b){
_disclosureControlPrototype=_5d;
_disclosureControlData=nil;
_disclosureControlQueue=[];
objj_msgSend(_5b,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_5e,_5f){
with(_5e){
objj_msgSend(_5e,"reloadItem:reloadChildren:",nil,YES);
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_60,_61,_62,_63){
with(_60){
var _64=objj_msgSend(_60,"tableColumns")[_62];
if(_64===_outlineTableColumn){
return objj_msgSend(_60,"frameOfOutlineDataViewAtColumn:row:",_62,_63);
}
return objj_msgSendSuper({receiver:_60,super_class:objj_getClass("CPTableView")},"frameOfDataViewAtColumn:row:",_62,_63);
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(_65,_66,_67,_68){
with(_65){
objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPTableView")},"_loadDataViewsInRows:columns:",_67,_68);
var _69=objj_msgSend(objj_msgSend(_65,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_65,"outlineTableColumn"));
if(!objj_msgSend(_68,"containsIndex:",_69)){
return;
}
var _6a=[];
objj_msgSend(_67,"getIndexes:maxCount:inIndexRange:",_6a,-1,nil);
var _6b=0,_6c=_6a.length;
for(;_6b<_6c;++_6b){
var row=_6a[_6b],_6d=_itemsForRows[row],_6e=objj_msgSend(_65,"isExpandable:",_6d);
if(!_6e){
continue;
}
var _6f=objj_msgSend(_65,"_dequeueDisclosureControl"),_70=objj_msgSend(_6f,"frame"),_71=objj_msgSend(_65,"frameOfDataViewAtColumn:row:",_69,row);
_70.origin.x=_indentationMarkerFollowsDataView?(_71.origin.x)-(_70.size.width):0;
_70.origin.y=(_71.origin.y);
_70.size.height=(_71.size.height);
_disclosureControlsForRows[row]=_6f;
objj_msgSend(_6f,"setState:",objj_msgSend(_65,"isItemExpanded:",_6d)?CPOnState:CPOffState);
objj_msgSend(_6f,"setFrame:",_70);
objj_msgSend(_65,"addSubview:",_6f);
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(_72,_73,_74,_75){
with(_72){
objj_msgSendSuper({receiver:_72,super_class:objj_getClass("CPTableView")},"_unloadDataViewsInRows:columns:",_74,_75);
var _76=objj_msgSend(objj_msgSend(_72,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_72,"outlineTableColumn"));
if(!objj_msgSend(_75,"containsIndex:",_76)){
return;
}
var _77=[];
objj_msgSend(_74,"getIndexes:maxCount:inIndexRange:",_77,-1,nil);
var _78=0,_79=_77.length;
for(;_78<_79;++_78){
var row=_77[_78],_7a=_disclosureControlsForRows[row];
if(!_7a){
continue;
}
objj_msgSend(_7a,"removeFromSuperview");
objj_msgSend(_72,"_enqueueDisclosureControl:",_7a);
_disclosureControlsForRows[row]=nil;
}
}
}),new objj_method(sel_getUid("_toggleFromDisclosureControl:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(_7d,"frame"),_7f=objj_msgSend(_7b,"itemAtRow:",objj_msgSend(_7b,"rowAtPoint:",{x:(_7e.origin.x),y:(_7e.origin.y+(_7e.size.height)/2)}));
if(objj_msgSend(_7b,"isItemExpanded:",_7f)){
objj_msgSend(_7b,"collapseItem:",_7f);
}else{
objj_msgSend(_7b,"expandItem:",_7f);
}
}
}),new objj_method(sel_getUid("_enqueueDisclosureControl:"),function(_80,_81,_82){
with(_80){
_disclosureControlQueue.push(_82);
}
}),new objj_method(sel_getUid("_dequeueDisclosureControl"),function(_83,_84){
with(_83){
if(_disclosureControlQueue.length){
return _disclosureControlQueue.pop();
}
if(!_disclosureControlData){
if(!_disclosureControlPrototype){
return nil;
}else{
_disclosureControlData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_disclosureControlPrototype);
}
}
var _85=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_disclosureControlData);
objj_msgSend(_85,"setTarget:",_83);
objj_msgSend(_85,"setAction:",sel_getUid("_toggleFromDisclosureControl:"));
return _85;
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(_86,_87){
with(_86){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionIsChangingNotification,_86,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionDidChangeNotification,_88,nil);
}
})]);
var _2d=function(_8a,_8b){
if(!_8b){
return;
}
var _8c=_8a._itemInfosForItems,_8d=_8a._outlineViewDataSource,_8e=objj_msgSend(_8b,"UID"),_8f=_8c[_8e];
if(!_8f){
return [];
}
var _90=_8f.parent,_91=_90?_8c[objj_msgSend(_90,"UID")]:_8a._rootItemInfo,_92=_91.children,_93=objj_msgSend(_92,"indexOfObjectIdenticalTo:",_8b),_94=objj_msgSend(_8d,"outlineView:child:ofItem:",_8a,_93,_90);
if(_8b!==_94){
_8c[objj_msgSend(_8b,"UID")]=nil;
_8c[objj_msgSend(_94,"UID")]=_8f;
_92[_93]=_94;
_8a._itemsForRows[_8f.row]=_94;
}
_8f.isExpandable=objj_msgSend(_8d,"outlineView:isItemExpandable:",_8a,_94);
_8f.isExpanded=_8f.isExpandable&&_8f.isExpanded;
};
var _2c=function(_95,_96,_97){
var _98=_95._itemInfosForItems,_99=_95._outlineViewDataSource;
if(!_96){
var _9a=_95._rootItemInfo;
}else{
var _9b=objj_msgSend(_96,"UID"),_9a=_98[_9b];
if(!_9a){
return [];
}
_9a.isExpandable=objj_msgSend(_99,"outlineView:isItemExpandable:",_95,_96);
if(!_9a.isExpandable&&_9a.isExpanded){
_9a.isExpanded=NO;
_9a.children=[];
}
}
var _9c=_9a.weight,_9d=_96?[_96]:[];
if(_9a.isExpanded&&(!(_95._implementedOutlineViewDataSourceMethods&_2)||!objj_msgSend(_99,"outlineView:shouldDeferDisplayingChildrenOfItem:",_95,_96))){
var _9e=0,_9f=objj_msgSend(_99,"outlineView:numberOfChildrenOfItem:",_95,_96),_a0=_9a.level+1;
_9a.children=[];
for(;_9e<_9f;++_9e){
var _a1=objj_msgSend(_99,"outlineView:child:ofItem:",_95,_9e,_96),_a2=_98[objj_msgSend(_a1,"UID")];
if(!_a2){
_a2={isExpanded:NO,isExpandable:NO,children:[],weight:1};
_98[objj_msgSend(_a1,"UID")]=_a2;
}
_9a.children[_9e]=_a1;
var _a3=_2c(_95,_a1,YES);
_a2.parent=_96;
_a2.level=_a0;
_9d=_9d.concat(_a3);
}
}
_9a.weight=_9d.length;
if(!_97){
var _9e=MAX(_9a.row,0),_a4=_95._itemsForRows;
_9d.unshift(_9e,_9c);
_a4.splice.apply(_a4,_9d);
var _9f=_a4.length;
for(;_9e<_9f;++_9e){
_98[objj_msgSend(_a4[_9e],"UID")].row=_9e;
}
var _a5=_9a.weight-_9c;
if(_a5!==0){
var _a6=_9a.parent;
while(_a6){
var _a7=_98[objj_msgSend(_a6,"UID")];
_a7.weight+=_a5;
_a6=_a7.parent;
}
if(_96){
_95._rootItemInfo.weight+=_a5;
}
}
}
return _9d;
};
var _b=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDataSource"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithOutlineView:"),function(_a8,_a9,_aa){
with(_a8){
_a8=objj_msgSendSuper({receiver:_a8,super_class:objj_getClass("CPObject")},"init");
if(_a8){
_outlineView=_aa;
}
return _a8;
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_ab,_ac,_ad){
with(_ab){
return _outlineView._itemsForRows.length;
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_ae,_af,_b0,_b1,_b2){
with(_ae){
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:objectValueForTableColumn:byItem:",_outlineView,_b1,_outlineView._itemsForRows[_b2]);
}
})]);
var _b=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDelegate"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithOutlineView:"),function(_b3,_b4,_b5){
with(_b3){
_b3=objj_msgSendSuper({receiver:_b3,super_class:objj_getClass("CPObject")},"init");
if(_b3){
_outlineView=_b5;
}
return _b3;
}
})]);
var _b=objj_allocateClassPair(CPButton,"CPDisclosureButton"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_angle")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_b6,_b7,_b8){
with(_b6){
_b6=objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("CPButton")},"initWithFrame:",_b8);
if(_b6){
objj_msgSend(_b6,"setBordered:",NO);
}
return _b6;
}
}),new objj_method(sel_getUid("setState:"),function(_b9,_ba,_bb){
with(_b9){
objj_msgSendSuper({receiver:_b9,super_class:objj_getClass("CPButton")},"setState:",_bb);
if(objj_msgSend(_b9,"state")===CPOnState){
_angle=0;
}else{
_angle=-PI_2;
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_bc,_bd,_be){
with(_bc){
var _bf=objj_msgSend(_bc,"bounds"),_c0=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_c0);
CGContextTranslateCTM(_c0,(_bf.size.width)/2,(_bf.size.height)/2);
CGContextRotateCTM(_c0,_angle);
CGContextTranslateCTM(_c0,-(_bf.size.width)/2,-(_bf.size.height)/2);
CGContextTranslateCTM(_c0,FLOOR(((_bf.size.width)-9)/2),FLOOR(((_bf.size.height)-8)/2));
CGContextMoveToPoint(_c0,0,0);
CGContextAddLineToPoint(_c0,9,0);
CGContextAddLineToPoint(_c0,4.5,8);
CGContextAddLineToPoint(_c0,0,0);
CGContextClosePath(_c0);
CGContextSetFillColor(_c0,(objj_msgSend(_bc,"themeState")&CPThemeState("highlighted"))?objj_msgSend(CPColor,"blackColor"):objj_msgSend(CPColor,"grayColor"));
CGContextFillPath(_c0);
}
})]);
p;9;CPPanel.ji;10;CPWindow.jc;1179;
CPOKButton=1;
CPCancelButton=0;
CPDocModalWindowMask=1<<6;
var _1=objj_allocateClassPair(CPWindow,"CPPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_becomesKeyOnlyIfNeeded"),new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isFloatingPanel"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"level")==CPFloatingWindowLevel;
}
}),new objj_method(sel_getUid("setFloatingPanel:"),function(_5,_6,_7){
with(_5){
objj_msgSend(_5,"setLevel:",_7?CPFloatingWindowLevel:CPNormalWindowLevel);
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(_8,_9){
with(_8){
return _becomesKeyOnlyIfNeeded;
}
}),new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"),function(_a,_b,_c){
with(_a){
_becomesKeyOnlyIfNeeded=_c;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(_d,_e){
with(_d){
return _worksWhenModal;
}
}),new objj_method(sel_getUid("setWorksWhenModal:"),function(_f,_10,_11){
with(_f){
_worksWhenModal=_11;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(_12,_13){
with(_12){
return NO;
}
})]);
p;14;CPPasteboard.jI;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;4592;
CPGeneralPboard="CPGeneralPboard";
CPFontPboard="CPFontPboard";
CPRulerPboard="CPRulerPboard";
CPFindPboard="CPFindPboard";
CPDragPboard="CPDragPboard";
CPColorPboardType="CPColorPboardType";
CPFilenamesPboardType="CPFilenamesPboardType";
CPFontPboardType="CPFontPboardType";
CPHTMLPboardType="CPHTMLPboardType";
CPStringPboardType="CPStringPboardType";
CPURLPboardType="CPURLPboardType";
CPImagesPboardType="CPImagesPboardType";
CPVideosPboardType="CPVideosPboardType";
CPImagePboardType="CPImagePboardType";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPPasteboard"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_types"),new objj_ivar("_owners"),new objj_ivar("_provided"),new objj_ivar("_changeCount"),new objj_ivar("_stateUID")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_initWithName:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_name=_6;
_types=[];
_owners=objj_msgSend(CPDictionary,"dictionary");
_provided=objj_msgSend(CPDictionary,"dictionary");
_changeCount=0;
}
return _4;
}
}),new objj_method(sel_getUid("addTypes:owner:"),function(_7,_8,_9,_a){
with(_7){
var i=0,_b=_9.length;
for(;i<_b;++i){
var _c=_9[i];
if(!objj_msgSend(_owners,"objectForKey:",_c)){
objj_msgSend(_types,"addObject:",_c);
objj_msgSend(_provided,"removeObjectForKey:",_c);
}
objj_msgSend(_owners,"setObject:forKey:",_a,_c);
}
return ++_changeCount;
}
}),new objj_method(sel_getUid("declareTypes:owner:"),function(_d,_e,_f,_10){
with(_d){
objj_msgSend(_types,"setArray:",_f);
_owners=objj_msgSend(CPDictionary,"dictionary");
_provided=objj_msgSend(CPDictionary,"dictionary");
var _11=_types.length;
while(_11--){
objj_msgSend(_owners,"setObject:forKey:",_10,_types[_11]);
}
return ++_changeCount;
}
}),new objj_method(sel_getUid("setData:forType:"),function(_12,_13,_14,_15){
with(_12){
objj_msgSend(_provided,"setObject:forKey:",_14,_15);
return YES;
}
}),new objj_method(sel_getUid("setPropertyList:forType:"),function(_16,_17,_18,_19){
with(_16){
return objj_msgSend(_16,"setData:forType:",objj_msgSend(CPPropertyListSerialization,"dataFromPropertyList:format:errorDescription:",_18,CPPropertyListXMLFormat_v1_0,nil),_19);
}
}),new objj_method(sel_getUid("setString:forType:"),function(_1a,_1b,_1c,_1d){
with(_1a){
return objj_msgSend(_1a,"setPropertyList:forType:",_1c,_1d);
}
}),new objj_method(sel_getUid("availableTypeFromArray:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(objj_msgSend(_1e,"types"),"firstObjectCommonWithArray:",_20);
}
}),new objj_method(sel_getUid("types"),function(_21,_22){
with(_21){
return _types;
}
}),new objj_method(sel_getUid("changeCount"),function(_23,_24){
with(_23){
return _changeCount;
}
}),new objj_method(sel_getUid("dataForType:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(_provided,"objectForKey:",_27);
if(_28){
return _28;
}
var _29=objj_msgSend(_owners,"objectForKey:",_27);
if(_29){
objj_msgSend(_29,"pasteboard:provideDataForType:",_25,_27);
++_changeCount;
return objj_msgSend(_provided,"objectForKey:",_27);
}
return nil;
}
}),new objj_method(sel_getUid("propertyListForType:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=objj_msgSend(_2a,"dataForType:",_2c);
if(_2d){
return objj_msgSend(CPPropertyListSerialization,"propertyListFromData:format:errorDescription:",_2d,CPPropertyListXMLFormat_v1_0,nil);
}
return nil;
}
}),new objj_method(sel_getUid("stringForType:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_2e,"propertyListForType:",_30);
}
}),new objj_method(sel_getUid("_generateStateUID"),function(_31,_32){
with(_31){
var _33=32;
_stateUID="";
while(_33--){
_stateUID+=FLOOR(RAND()*16).toString(16).toUpperCase();
}
return _stateUID;
}
}),new objj_method(sel_getUid("_stateUID"),function(_34,_35){
with(_34){
return _stateUID;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_36,_37){
with(_36){
if(_36!=objj_msgSend(CPPasteboard,"class")){
return;
}
objj_msgSend(_36,"setVersion:",1);
_1=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("generalPasteboard"),function(_38,_39){
with(_38){
return objj_msgSend(CPPasteboard,"pasteboardWithName:",CPGeneralPboard);
}
}),new objj_method(sel_getUid("pasteboardWithName:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_1,"objectForKey:",_3c);
if(_3d){
return _3d;
}
_3d=objj_msgSend(objj_msgSend(CPPasteboard,"alloc"),"_initWithName:",_3c);
objj_msgSend(_1,"setObject:forKey:",_3d,_3c);
return _3d;
}
})]);
p;15;CPPopUpButton.ji;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;13908;
var _1=7;
CPPopUpButtonStatePullsDown=CPThemeState("pulls-down");
var _2=objj_allocateClassPair(CPButton,"CPPopUpButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_selectedIndex"),new objj_ivar("_preferredEdge"),new objj_ivar("_menu")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:pullsDown:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPButton")},"initWithFrame:",_6);
if(_4){
_selectedIndex=CPNotFound;
_preferredEdge=CPMaxYEdge;
objj_msgSend(_4,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLineBreakByTruncatingTail,"line-break-mode");
objj_msgSend(_4,"setMenu:",objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""));
objj_msgSend(_4,"setPullsDown:",_7);
}
return _4;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithFrame:pullsDown:",_a,NO);
}
}),new objj_method(sel_getUid("setPullsDown:"),function(_b,_c,_d){
with(_b){
if(_d){
var _e=objj_msgSend(_b,"setThemeState:",CPPopUpButtonStatePullsDown);
}else{
var _e=objj_msgSend(_b,"unsetThemeState:",CPPopUpButtonStatePullsDown);
}
if(!_e){
return;
}
var _f=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_f,"count")<=0){
return;
}
objj_msgSend(_f[0],"setHidden:",objj_msgSend(_b,"pullsDown"));
objj_msgSend(_b,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("pullsDown"),function(_10,_11){
with(_10){
return objj_msgSend(_10,"hasThemeState:",CPPopUpButtonStatePullsDown);
}
}),new objj_method(sel_getUid("addItem:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_menu,"addItem:",_14);
}
}),new objj_method(sel_getUid("addItemWithTitle:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_menu,"addItemWithTitle:action:keyEquivalent:",_17,NULL,nil);
}
}),new objj_method(sel_getUid("addItemsWithTitles:"),function(_18,_19,_1a){
with(_18){
var _1b=0,_1c=objj_msgSend(_1a,"count");
for(;_1b<_1c;++_1b){
objj_msgSend(_18,"addItemWithTitle:",_1a[_1b]);
}
}
}),new objj_method(sel_getUid("insertItemWithTitle:atIndex:"),function(_1d,_1e,_1f,_20){
with(_1d){
var _21=objj_msgSend(_1d,"itemArray"),_22=objj_msgSend(_21,"count");
while(_22--){
if(objj_msgSend(_21[_22],"title")==_1f){
objj_msgSend(_1d,"removeItemAtIndex:",_22);
}
}
objj_msgSend(_menu,"insertItemWithTitle:action:keyEquivalent:atIndex:",_1f,NULL,nil,_20);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_23,_24){
with(_23){
var _25=objj_msgSend(_menu,"numberOfItems");
while(_25--){
objj_msgSend(_menu,"removeItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("removeItemWithTitle:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_26,"removeItemAtIndex:",objj_msgSend(_26,"indexOfItemWithTitle:",_28));
objj_msgSend(_26,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_menu,"removeItemAtIndex:",_2b);
objj_msgSend(_29,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectedItem"),function(_2c,_2d){
with(_2c){
if(_selectedIndex<0||_selectedIndex>objj_msgSend(_2c,"numberOfItems")-1){
return nil;
}
return objj_msgSend(_menu,"itemAtIndex:",_selectedIndex);
}
}),new objj_method(sel_getUid("titleOfSelectedItem"),function(_2e,_2f){
with(_2e){
return objj_msgSend(objj_msgSend(_2e,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_30,_31){
with(_30){
return _selectedIndex;
}
}),new objj_method(sel_getUid("objectValue"),function(_32,_33){
with(_32){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItem:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"selectItemAtIndex:",objj_msgSend(_34,"indexOfItem:",_36));
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_37,_38,_39){
with(_37){
if(_selectedIndex==_39){
return;
}
if(_selectedIndex>=0&&!objj_msgSend(_37,"pullsDown")){
objj_msgSend(objj_msgSend(_37,"selectedItem"),"setState:",CPOffState);
}
_selectedIndex=_39;
if(_selectedIndex>=0&&!objj_msgSend(_37,"pullsDown")){
objj_msgSend(objj_msgSend(_37,"selectedItem"),"setState:",CPOnState);
}
objj_msgSend(_37,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectItemWithTag:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3a,"selectItemAtIndex:",objj_msgSend(_3a,"indexOfItemWithTag:",_3c));
}
}),new objj_method(sel_getUid("selectItemWithTitle:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_3d,"selectItemAtIndex:",objj_msgSend(_3d,"indexOfItemWithTitle:",_3f));
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
objj_msgSend(_40,"selectItemAtIndex:",objj_msgSend(_42,"intValue"));
}
}),new objj_method(sel_getUid("menu"),function(_43,_44){
with(_43){
return _menu;
}
}),new objj_method(sel_getUid("setMenu:"),function(_45,_46,_47){
with(_45){
if(_menu===_47){
return;
}
var _48=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidRemoveItemNotification,_menu);
}
_menu=_47;
if(_menu){
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
objj_msgSend(_45,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("numberOfItems"),function(_49,_4a){
with(_49){
return objj_msgSend(_menu,"numberOfItems");
}
}),new objj_method(sel_getUid("itemArray"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_menu,"itemArray");
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_4d,_4e,_4f){
with(_4d){
return objj_msgSend(_menu,"itemAtIndex:",_4f);
}
}),new objj_method(sel_getUid("itemTitleAtIndex:"),function(_50,_51,_52){
with(_50){
return objj_msgSend(objj_msgSend(_menu,"itemAtIndex:",_52),"title");
}
}),new objj_method(sel_getUid("itemTitles"),function(_53,_54){
with(_53){
var _55=[],_56=objj_msgSend(_53,"itemArray"),_57=0,_58=objj_msgSend(_56,"count");
for(;_57<_58;++_57){
_56.push(objj_msgSend(_56[_57],"title"));
}
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_59,_5a,_5b){
with(_59){
return objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(_menu,"indexOfItemWithTitle:",_5b));
}
}),new objj_method(sel_getUid("lastItem"),function(_5c,_5d){
with(_5c){
return objj_msgSend(objj_msgSend(_menu,"itemArray"),"lastObject");
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_5e,_5f,_60){
with(_5e){
return objj_msgSend(_menu,"indexOfItem:",_60);
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_61,_62,_63){
with(_61){
return objj_msgSend(_menu,"indexOfItemWithTag:",_63);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_menu,"indexOfItemWithTitle:",_66);
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(_menu,"indexOfItemWithRepresentedObject:",_69);
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:action:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(_menu,"indexOfItemWithTarget:action:",_6c,_6d);
}
}),new objj_method(sel_getUid("preferredEdge"),function(_6e,_6f){
with(_6e){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_70,_71,_72){
with(_70){
_preferredEdge=_72;
}
}),new objj_method(sel_getUid("setTitle:"),function(_73,_74,_75){
with(_73){
if(objj_msgSend(_73,"title")===_75){
return;
}
if(objj_msgSend(_73,"pullsDown")){
var _76=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_76,"count")<=0){
objj_msgSend(_73,"addItemWithTitle:",_75);
}else{
objj_msgSend(_76[0],"setTitle:",_75);
objj_msgSend(_73,"synchronizeTitleAndSelectedItem");
}
}else{
var _77=objj_msgSend(_73,"indexOfItemWithTitle:",_75);
if(_77<0){
objj_msgSend(_73,"addItemWithTitle:",_75);
_77=objj_msgSend(_73,"numberOfItems")-1;
}
objj_msgSend(_73,"selectItemAtIndex:",_77);
}
}
}),new objj_method(sel_getUid("setImage:"),function(_78,_79,_7a){
with(_78){
}
}),new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"),function(_7b,_7c){
with(_7b){
var _7d=nil;
if(objj_msgSend(_7b,"pullsDown")){
var _7e=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_7e,"count")>0){
_7d=_7e[0];
}
}else{
_7d=objj_msgSend(_7b,"selectedItem");
}
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setImage:",objj_msgSend(_7d,"image"));
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setTitle:",objj_msgSend(_7d,"title"));
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_81,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(_selectedIndex<0){
objj_msgSend(_7f,"selectItemAtIndex:",0);
}else{
if(_82==_selectedIndex){
objj_msgSend(_7f,"synchronizeTitleAndSelectedItem");
}else{
if(_82<_selectedIndex){
++_selectedIndex;
}
}
}
if(_82==0&&objj_msgSend(_7f,"pullsDown")){
var _83=objj_msgSend(_menu,"itemArray");
objj_msgSend(_83[0],"setHidden:",YES);
if(_83.length>0){
objj_msgSend(_83[1],"setHidden:",NO);
}
}
var _84=objj_msgSend(_menu,"itemArray")[_82],_85=objj_msgSend(_84,"action");
if(!_85||(_85===sel_getUid("_popUpItemAction:"))){
objj_msgSend(_84,"setTarget:",_7f);
objj_msgSend(_84,"setAction:",sel_getUid("_popUpItemAction:"));
}
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(objj_msgSend(_88,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(objj_msgSend(_86,"pullsDown")&&_89!=0){
return;
}
if(!objj_msgSend(_86,"pullsDown")&&_89!=_selectedIndex){
return;
}
objj_msgSend(_86,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_8a,"numberOfItems");
if(_8d<=_selectedIndex&&_8d>0){
objj_msgSend(_8a,"selectItemAtIndex:",_8d-1);
}else{
objj_msgSend(_8a,"synchronizeTitleAndSelectedItem");
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8e,_8f,_90){
with(_8e){
if(!objj_msgSend(_8e,"isEnabled")||!objj_msgSend(_8e,"numberOfItems")){
return;
}
objj_msgSend(_8e,"highlight:",YES);
var _91=objj_msgSend(_8e,"menu"),_92=objj_msgSend(_8e,"window"),_93=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_91,objj_msgSend(_8e,"font"));
objj_msgSend(_93,"setDelegate:",_8e);
objj_msgSend(_93,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
if(objj_msgSend(_8e,"pullsDown")){
var _94=objj_msgSend(_92,"convertBaseToGlobal:",objj_msgSend(_8e,"convertPoint:toView:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_8e,"bounds"))),nil));
}else{
var _95=objj_msgSend(_8e,"convertRect:toView:",objj_msgSend(_8e,"contentRectForBounds:",objj_msgSend(_8e,"bounds")),nil),_94=objj_msgSend(_92,"convertBaseToGlobal:",_95.origin),_96=objj_msgSend(_93,"rectForItemAtIndex:",_selectedIndex);
_94.x-=CGRectGetMinX(_96)+objj_msgSend(_93,"overlapOffsetWidth")+objj_msgSend(objj_msgSend(objj_msgSend(_91,"itemAtIndex:",_selectedIndex),"_menuItemView"),"overlapOffsetWidth");
_94.y-=CGRectGetMinY(_96)+(CGRectGetHeight(_96)-CGRectGetHeight(_95))/2;
}
objj_msgSend(_93,"setFrameOrigin:",_94);
var _97=CGRectGetMaxX(objj_msgSend(_93,"frame")),_98=objj_msgSend(_92,"convertBaseToGlobal:",CGPointMake(CGRectGetMaxX(objj_msgSend(_8e,"convertRect:toView:",objj_msgSend(_8e,"bounds"),nil)),0)).x;
if(_97<_98){
objj_msgSend(_93,"setMinWidth:",CGRectGetWidth(objj_msgSend(_93,"frame"))+_98-_97-(objj_msgSend(_8e,"pullsDown")?0:_1));
}
objj_msgSend(_93,"orderFront:",_8e);
objj_msgSend(_93,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_90,_8e,sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"),function(_99,_9a,_9b,_9c){
with(_99){
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_9b);
objj_msgSend(_99,"highlight:",NO);
var _9d=objj_msgSend(_menu,"indexOfItem:",_9c);
if(_9d==CPNotFound){
return;
}
objj_msgSend(_99,"selectItemAtIndex:",_9d);
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9c,"action"),objj_msgSend(_9c,"target"),_9c);
}
}),new objj_method(sel_getUid("_popUpItemAction:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"sendAction:to:",objj_msgSend(_9e,"action"),objj_msgSend(_9e,"target"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeClass"),function(_a1,_a2){
with(_a1){
return "popup-button";
}
})]);
var _a3="CPPopUpButtonMenuKey",_a4="CPPopUpButtonSelectedIndexKey",_a5="CPPopUpButtonPullsDownKey";
var _2=objj_getClass("CPPopUpButton");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPopUpButton\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
_a6=objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPButton")},"initWithCoder:",_a8);
if(_a6){
_selectedIndex=-1;
objj_msgSend(_a6,"setMenu:",objj_msgSend(_a8,"decodeObjectForKey:",_a3));
objj_msgSend(_a6,"selectItemAtIndex:",objj_msgSend(_a8,"decodeObjectForKey:",_a4));
}
return _a6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a9,_aa,_ab){
with(_a9){
objj_msgSendSuper({receiver:_a9,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_ab);
objj_msgSend(_ab,"encodeObject:forKey:",_menu,_a3);
objj_msgSend(_ab,"encodeInt:forKey:",_selectedIndex,_a4);
}
})]);
p;21;CPProgressIndicator.jI;19;AppKit/CGGeometry.jI;20;AppKit/CPImageView.jI;15;AppKit/CPView.jc;8511;
CPProgressIndicatorBarStyle=0;
CPProgressIndicatorSpinningStyle=1;
CPProgressIndicatorHUDBarStyle=2;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPView,"CPProgressIndicator"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_doubleValue"),new objj_ivar("_controlSize"),new objj_ivar("_isIndeterminate"),new objj_ivar("_style"),new objj_ivar("_isAnimating"),new objj_ivar("_isDisplayedWhenStoppedSet"),new objj_ivar("_isDisplayedWhenStopped"),new objj_ivar("_barView")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPView")},"initWithFrame:",_9);
if(_7){
_minValue=0;
_maxValue=100;
_doubleValue=0;
_style=CPProgressIndicatorBarStyle;
_isDisplayedWhenStoppedSet=NO;
_controlSize=CPRegularControlSize;
objj_msgSend(_7,"updateBackgroundColor");
objj_msgSend(_7,"drawBar");
}
return _7;
}
}),new objj_method(sel_getUid("setUsesThreadedAnimation:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("startAnimation:"),function(_d,_e,_f){
with(_d){
_isAnimating=YES;
objj_msgSend(_d,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("stopAnimation:"),function(_10,_11,_12){
with(_10){
_isAnimating=NO;
objj_msgSend(_10,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("usesThreadedAnimation"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("incrementBy:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setDoubleValue:",_doubleValue+_17);
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_18,_19,_1a){
with(_18){
_doubleValue=MIN(MAX(_1a,_minValue),_maxValue);
objj_msgSend(_18,"drawBar");
}
}),new objj_method(sel_getUid("doubleValue"),function(_1b,_1c){
with(_1b){
return _doubleValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_1d,_1e,_1f){
with(_1d){
_minValue=_1f;
}
}),new objj_method(sel_getUid("minValue"),function(_20,_21){
with(_20){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_22,_23,_24){
with(_22){
_maxValue=_24;
}
}),new objj_method(sel_getUid("maxValue"),function(_25,_26){
with(_25){
return _maxValue;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_27,_28,_29){
with(_27){
if(_controlSize==_29){
return;
}
_controlSize=_29;
objj_msgSend(_27,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("controlSize"),function(_2a,_2b){
with(_2a){
return _controlSize;
}
}),new objj_method(sel_getUid("setControlTint:"),function(_2c,_2d,_2e){
with(_2c){
}
}),new objj_method(sel_getUid("controlTint"),function(_2f,_30){
with(_2f){
return 0;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("isBezeled"),function(_34,_35){
with(_34){
return YES;
}
}),new objj_method(sel_getUid("setIndeterminate:"),function(_36,_37,_38){
with(_36){
if(_isIndeterminate==_38){
return;
}
_isIndeterminate=_38;
objj_msgSend(_36,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("isIndeterminate"),function(_39,_3a){
with(_39){
return _isIndeterminate;
}
}),new objj_method(sel_getUid("setStyle:"),function(_3b,_3c,_3d){
with(_3b){
if(_style==_3d){
return;
}
_style=_3d;
objj_msgSend(_3b,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_3e,_3f){
with(_3e){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_3e,"setFrameSize:",objj_msgSend(objj_msgSend(_1[_controlSize],"patternImage"),"size"));
}else{
objj_msgSend(_3e,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_3e,"frame")),_4[_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle]+_CPControlIdentifierForControlSize(_controlSize)][0].height));
}
}
}),new objj_method(sel_getUid("setDisplayedWhenStopped:"),function(_40,_41,_42){
with(_40){
if(_isDisplayedWhenStoppedSet&&_isDisplayedWhenStopped==_42){
return;
}
_isDisplayedWhenStoppedSet=YES;
_isDisplayedWhenStopped=_42;
objj_msgSend(_40,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("isDisplayedWhenStopped"),function(_43,_44){
with(_43){
if(_isDisplayedWhenStoppedSet){
return _isDisplayedWhenStopped;
}
if(_style==CPProgressIndicatorBarStyle||_style==CPProgressIndicatorHUDBarStyle){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_hideOrDisplay"),function(_45,_46){
with(_45){
objj_msgSend(_45,"setHidden:",!_isAnimating&&!objj_msgSend(_45,"isDisplayedWhenStopped"));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_47,_48,_49){
with(_47){
objj_msgSendSuper({receiver:_47,super_class:objj_getClass("CPView")},"setFrameSize:",_49);
objj_msgSend(_47,"drawBar");
}
}),new objj_method(sel_getUid("drawBar"),function(_4a,_4b){
with(_4a){
if(_style==CPProgressIndicatorSpinningStyle){
return;
}
if(!_barView){
_barView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(2,2,0,9));
objj_msgSend(_barView,"setBackgroundColor:",objj_msgSend(CPColor,"redColor"));
objj_msgSend(_4a,"addSubview:",_barView);
}
objj_msgSend(_barView,"setBackgroundColor:",_CPControlColorWithPatternImage(_4,_2,"Bar",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_barView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_4a,"bounds"))*(_doubleValue-_minValue)/(_maxValue-_minValue)-4,9));
}
}),new objj_method(sel_getUid("updateBackgroundColor"),function(_4c,_4d){
with(_4c){
if(YES){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_barView,"removeFromSuperview");
_barView=nil;
objj_msgSend(_4c,"setBackgroundColor:",_1[_controlSize]);
}else{
objj_msgSend(_4c,"setBackgroundColor:",_CPControlThreePartImagePattern(NO,_4,_2,"BezelBorder",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_4c,"drawBar");
}
}else{
objj_msgSend(_4c,"setBackgroundColor:",nil);
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_4e,_4f){
with(_4e){
if(_4e!=objj_msgSend(CPProgressIndicator,"class")){
return;
}
var _50=objj_msgSend(CPBundle,"bundleForClass:",_4e);
_1=[];
_1[CPMiniControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
_1[CPSmallControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
_1[CPRegularControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
CPProgressIndicatorBezelBorderViewPool=[];
var _51=CPProgressIndicatorBarStyle,end=CPProgressIndicatorHUDBarStyle;
for(;_51<=end;++_51){
CPProgressIndicatorBezelBorderViewPool[_51]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPMiniControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPSmallControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPRegularControlSize]=[];
}
_2=objj_msgSend(_4e,"className");
_3=[];
_3[CPProgressIndicatorBarStyle]="Bar";
_3[CPProgressIndicatorSpinningStyle]="Spinny";
_3[CPProgressIndicatorHUDBarStyle]="HUDBar";
var _52=_CPControlIdentifierForControlSize(CPRegularControlSize),_53=_CPControlIdentifierForControlSize(CPSmallControlSize),_54=_CPControlIdentifierForControlSize(CPMiniControlSize);
_4=[];
var _55=_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle];
_4[_55+_52]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_55+_53]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_55+_54]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_55=_2+"Bar"+_3[CPProgressIndicatorBarStyle];
_4[_55+_52]={width:1,height:9};
_4[_55+_53]={width:1,height:9};
_4[_55+_54]={width:1,height:9};
_55=_2+"BezelBorder"+_3[CPProgressIndicatorHUDBarStyle];
_4[_55+_52]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_55+_53]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_55+_54]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_55=_2+"Bar"+_3[CPProgressIndicatorHUDBarStyle];
_4[_55+_52]={width:1,height:9};
_4[_55+_53]={width:1,height:9};
_4[_55+_54]={width:1,height:9};
}
})]);
p;9;CPRadio.jI;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jc;5034;
var _1=objj_allocateClassPair(CPButton,"CPRadio"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radioGroup")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:radioGroup:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setRadioGroup:",_6||objj_msgSend(CPRadioGroup,"new"));
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"initWithFrame:radioGroup:",_9,nil);
}
}),new objj_method(sel_getUid("nextState"),function(_a,_b){
with(_a){
return CPOnState;
}
}),new objj_method(sel_getUid("setRadioGroup:"),function(_c,_d,_e){
with(_c){
if(_radioGroup===_e){
return;
}
objj_msgSend(_radioGroup,"_removeRadio:",_c);
_radioGroup=_e;
objj_msgSend(_radioGroup,"_addRadio:",_c);
}
}),new objj_method(sel_getUid("radioGroup"),function(_f,_10){
with(_f){
return _radioGroup;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPButton")},"setObjectValue:",_13);
if(objj_msgSend(_11,"state")===CPOnState){
objj_msgSend(_radioGroup,"_setSelectedRadio:",_11);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("radioWithTitle:theme:"),function(_14,_15,_16,_17){
with(_14){
return objj_msgSend(_14,"buttonWithTitle:theme:",_16,_17);
}
}),new objj_method(sel_getUid("radioWithTitle:"),function(_18,_19,_1a){
with(_18){
return objj_msgSend(_18,"buttonWithTitle:",_1a);
}
}),new objj_method(sel_getUid("standardButtonWithTitle:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(objj_msgSend(CPRadio,"alloc"),"init");
objj_msgSend(_1e,"setTitle:",_1d);
return _1e;
}
}),new objj_method(sel_getUid("themeClass"),function(_1f,_20){
with(_1f){
return "radio";
}
})]);
var _21="CPRadioRadioGroupKey";
var _1=objj_getClass("CPRadio");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPRadio\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPButton")},"initWithCoder:",_24);
if(_22){
_radioGroup=objj_msgSend(_24,"decodeObjectForKey:",_21);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_27);
objj_msgSend(_27,"encodeObject:forKey:",_radioGroup,_21);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPRadioGroup"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radios"),new objj_ivar("_selectedRadio")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_28,_29){
with(_28){
_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPObject")},"init");
if(_28){
_radios=objj_msgSend(CPSet,"set");
_selectedRadio=nil;
}
return _28;
}
}),new objj_method(sel_getUid("_addRadio:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_radios,"addObject:",_2c);
if(objj_msgSend(_2c,"state")===CPOnState){
objj_msgSend(_2a,"_setSelectedRadio:",_2c);
}
}
}),new objj_method(sel_getUid("_removeRadio:"),function(_2d,_2e,_2f){
with(_2d){
if(_selectedRadio===_2f){
_selectedRadio=nil;
}
objj_msgSend(_radios,"removeObject:",_2f);
}
}),new objj_method(sel_getUid("_setSelectedRadio:"),function(_30,_31,_32){
with(_30){
if(_selectedRadio===_32){
return;
}
objj_msgSend(_selectedRadio,"setState:",CPOffState);
_selectedRadio=_32;
}
}),new objj_method(sel_getUid("selectedRadio"),function(_33,_34){
with(_33){
return _selectedRadio;
}
}),new objj_method(sel_getUid("radios"),function(_35,_36){
with(_35){
return objj_msgSend(_radios,"allObjects");
}
})]);
var _37="CPRadioGroupRadiosKey",_38="CPRadioGroupSelectedRadioKey";
var _1=objj_getClass("CPRadioGroup");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPRadioGroup\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPObject")},"init");
if(_39){
_radios=objj_msgSend(_3b,"decodeObjectForKey:",_37);
_selectedRadio=objj_msgSend(_3b,"decodeObjectForKey:",_38);
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3e,"encodeObject:forKey:",_radios,_37);
objj_msgSend(_3e,"encodeObject:forKey:",_selectedRadio,_38);
}
})]);
p;13;CPResponder.jI;21;Foundation/CPObject.jc;5749;
CPDeleteKeyCode=8;
CPTabKeyCode=9;
CPReturnKeyCode=13;
CPEscapeKeyCode=27;
CPLeftArrowKeyCode=37;
CPUpArrowKeyCode=38;
CPRightArrowKeyCode=39;
CPDownArrowKeyCode=40;
var _1=objj_allocateClassPair(CPObject,"CPResponder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menu"),new objj_ivar("_nextResponder")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("acceptsFirstResponder"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_5,_6){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_7,_8){
with(_7){
return YES;
}
}),new objj_method(sel_getUid("setNextResponder:"),function(_9,_a,_b){
with(_9){
_nextResponder=_b;
}
}),new objj_method(sel_getUid("nextResponder"),function(_c,_d){
with(_c){
return _nextResponder;
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_e,_f,_10){
with(_e){
var _11=0,_12=objj_msgSend(_10,"count");
for(;_11<_12;++_11){
var _13=_10[_11];
switch(objj_msgSend(_13,"keyCode")){
case CPLeftArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveLeft:"));
break;
case CPRightArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveRight:"));
break;
case CPUpArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveUp:"));
break;
case CPDownArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveDown:"));
break;
case CPDeleteKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("deleteBackward:"));
break;
case CPReturnKeyCode:
case 3:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertLineBreak:"));
break;
case CPEscapeKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("cancel:"));
break;
case CPTabKeyCode:
var _14=objj_msgSend(_13,"modifierFlags")&CPShiftKeyMask;
if(!_14){
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertTab:"));
}else{
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertBackTab:"));
}
break;
default:
objj_msgSend(_e,"insertText:",objj_msgSend(_13,"characters"));
}
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_nextResponder,"performSelector:withObject:",_16,_17);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_nextResponder,"performSelector:withObject:",_19,_1a);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1c,_1d);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1f,_20);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_nextResponder,"performSelector:withObject:",_22,_23);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_nextResponder,"performSelector:withObject:",_25,_26);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_nextResponder,"performSelector:withObject:",_28,_29);
}
}),new objj_method(sel_getUid("keyDown:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2b,_2c);
}
}),new objj_method(sel_getUid("keyUp:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2e,_2f);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_30,_31,_32){
with(_30){
return NO;
}
}),new objj_method(sel_getUid("insertLineBreak:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"insertNewline:",_35);
}
}),new objj_method(sel_getUid("insertNewline:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_36,"insertNewline:",_38);
}
}),new objj_method(sel_getUid("cancel:"),function(_39,_3a,_3b){
with(_39){
}
}),new objj_method(sel_getUid("insertTab:"),function(_3c,_3d,_3e){
with(_3c){
}
}),new objj_method(sel_getUid("insertBackTab:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("insertText:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_45,"respondsToSelector:",_47)){
objj_msgSend(_45,"performSelector:",_47);
}else{
objj_msgSend(_nextResponder,"doCommandBySelector:",_47);
}
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_48,_49,_4a,_4b){
with(_48){
if(objj_msgSend(_48,"respondsToSelector:",_4a)){
objj_msgSend(_48,"performSelector:withObject:",_4a,_4b);
return YES;
}
return objj_msgSend(_nextResponder,"tryToPerform:with:",_4a,_4b);
}
}),new objj_method(sel_getUid("setMenu:"),function(_4c,_4d,_4e){
with(_4c){
_menu=_4e;
}
}),new objj_method(sel_getUid("menu"),function(_4f,_50){
with(_4f){
return _menu;
}
}),new objj_method(sel_getUid("undoManager"),function(_51,_52){
with(_51){
return objj_msgSend(_nextResponder,"performSelector:",_52);
}
}),new objj_method(sel_getUid("noResponderFor:"),function(_53,_54,_55){
with(_53){
}
})]);
var _56="CPResponderNextResponderKey";
var _1=objj_getClass("CPResponder");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPResponder\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_57,_58,_59){
with(_57){
_57=objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPObject")},"init");
if(_57){
_nextResponder=objj_msgSend(_59,"decodeObjectForKey:",_56);
}
return _57;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5a,_5b,_5c){
with(_5a){
if(_nextResponder!==nil){
objj_msgSend(_5c,"encodeConditionalObject:forKey:",_nextResponder,_56);
}
}
})]);
p;13;CPSavePanel.jI;16;AppKit/CPPanel.jc;953;
var _1=objj_allocateClassPair(CPPanel,"CPSavePanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("runModal"),function(_3,_4){
with(_3){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
if(typeof window["cpSavePanel"]==="function"){
var _5=window.cpSavePanel(),_6=_5.button;
_URL=_6?objj_msgSend(CPURL,"URLWithString:",_5.URL):nil;
}else{
var _7=window.prompt("Document Name:"),_6=_7!==null;
_URL=_6?objj_msgSend(objj_msgSend(_3,"class"),"proposedFileURLWithDocumentName:",_7):nil;
}
return _6;
}
}),new objj_method(sel_getUid("URL"),function(_8,_9){
with(_8){
return _URL;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("savePanel"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(CPSavePanel,"alloc"),"init");
}
})]);
p;10;CPScreen.jI;21;Foundation/CPObject.jc;408;
var _1=objj_allocateClassPair(CPObject,"CPScreen"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("visibleFrame"),function(_3,_4){
with(_3){
return {origin:{x:window.screen.availLeft,y:window.screen.availTop},size:{width:window.screen.availWidth,height:window.screen.availHeight}};
}
})]);
p;12;CPScroller.ji;11;CPControl.jc;15644;
CPScrollerNoPart=0;
CPScrollerDecrementPage=1;
CPScrollerKnob=2;
CPScrollerIncrementPage=3;
CPScrollerDecrementLine=4;
CPScrollerIncrementLine=5;
CPScrollerKnobSlot=6;
CPScrollerIncrementArrow=0;
CPScrollerDecrementArrow=1;
CPNoScrollerParts=0;
CPOnlyScrollerArrows=1;
CPAllScrollerParts=2;
var _1=[CPScrollerKnobSlot,CPScrollerDecrementLine,CPScrollerIncrementLine,CPScrollerKnob],_2={},_3={};
_2[CPScrollerDecrementLine]="decrement-line";
_2[CPScrollerIncrementLine]="increment-line";
_2[CPScrollerKnobSlot]="knob-slot";
_2[CPScrollerKnob]="knob";
var _4=objj_allocateClassPair(CPControl,"CPScroller"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_controlSize"),new objj_ivar("_usableParts"),new objj_ivar("_partRects"),new objj_ivar("_isVertical"),new objj_ivar("_knobProportion"),new objj_ivar("_hitPart"),new objj_ivar("_trackingPart"),new objj_ivar("_trackingFloatValue"),new objj_ivar("_trackingStartPoint")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("isVertical"),function(_6,_7){
with(_6){
return _isVertical;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPControl")},"initWithFrame:",_a);
if(_8){
_controlSize=CPRegularControlSize;
_partRects=[];
objj_msgSend(_8,"setFloatValue:",0);
objj_msgSend(_8,"setKnobProportion:",1);
_hitPart=CPScrollerNoPart;
objj_msgSend(_8,"_calculateIsVertical");
}
return _8;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_b,_c,_d){
with(_b){
if(_controlSize==_d){
return;
}
_controlSize=_d;
objj_msgSend(_b,"setNeedsLayout");
objj_msgSend(_b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("controlSize"),function(_e,_f){
with(_e){
return _controlSize;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPControl")},"setObjectValue:",MIN(1,MAX(0,+_12)));
}
}),new objj_method(sel_getUid("setKnobProportion:"),function(_13,_14,_15){
with(_13){
_knobProportion=MIN(1,MAX(0.0001,_15));
objj_msgSend(_13,"setNeedsDisplay:",YES);
objj_msgSend(_13,"setNeedsLayout");
}
}),new objj_method(sel_getUid("knobProportion"),function(_16,_17){
with(_16){
return _knobProportion;
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(_18,_19,_1a){
with(_18){
var _1b=_themeState;
if(_2[_hitPart]+"-color"!==_1a){
_1b&=~CPThemeStateHighlighted;
}
return objj_msgSend(_18,"valueForThemeAttribute:inState:",_1a,_1b);
}
}),new objj_method(sel_getUid("rectForPart:"),function(_1c,_1d,_1e){
with(_1c){
if(_1e==CPScrollerNoPart){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
return _partRects[_1e];
}
}),new objj_method(sel_getUid("testPart:"),function(_1f,_20,_21){
with(_1f){
_21=objj_msgSend(_1f,"convertPoint:fromView:",_21,nil);
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerKnob),_21)){
return CPScrollerKnob;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerDecrementPage),_21)){
return CPScrollerDecrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerIncrementPage),_21)){
return CPScrollerIncrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerDecrementLine),_21)){
return CPScrollerDecrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerIncrementLine),_21)){
return CPScrollerIncrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerKnobSlot),_21)){
return CPScrollerKnobSlot;
}
return CPScrollerNoPart;
}
}),new objj_method(sel_getUid("checkSpaceForParts"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"bounds");
if(_knobProportion===1){
_usableParts=CPNoScrollerParts;
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:_24.origin.x,y:_24.origin.y},size:{width:_24.size.width,height:_24.size.height}};
return;
}
_usableParts=CPAllScrollerParts;
var _25=objj_msgSend(_22,"currentValueForThemeAttribute:","knob-inset"),_26=objj_msgSend(_22,"currentValueForThemeAttribute:","track-inset"),_27=(_24.size.width),_28=(_24.size.height);
if(objj_msgSend(_22,"isVertical")){
var _29=objj_msgSend(_22,"currentValueForThemeAttribute:","decrement-line-size"),_2a=objj_msgSend(_22,"currentValueForThemeAttribute:","increment-line-size"),_2b=_29.height+_26.top,_2c=_2a.height+_26.bottom,_2d=_28-_2b-_2c,_2e=objj_msgSend(_22,"currentValueForThemeAttribute:","minimum-knob-length"),_2f=_27-_25.left-_25.right,_30=MAX(_2e,(_2d*_knobProportion)),_31=_2b+(_2d-_30)*objj_msgSend(_22,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:_2b},size:{width:_27,height:_31-_2b}};
_partRects[CPScrollerKnob]={origin:{x:_25.left,y:_31},size:{width:_2f,height:_30}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:_31+_30},size:{width:_27,height:_28-(_31+_30)-_2c}};
_partRects[CPScrollerKnobSlot]={origin:{x:_26.left,y:_2b},size:{width:_27-_26.left-_26.right,height:_2d}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_29.width,height:_29.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:_28-_2a.height},size:{width:_2a.width,height:_2a.height}};
}else{
var _29=objj_msgSend(_22,"currentValueForThemeAttribute:","decrement-line-size"),_2a=objj_msgSend(_22,"currentValueForThemeAttribute:","increment-line-size"),_32=_29.width+_26.left,_33=_2a.width+_26.right;
slotWidth=_27-_32-_33,_2e=objj_msgSend(_22,"currentValueForThemeAttribute:","minimum-knob-length"),_2f=MAX(_2e,(slotWidth*_knobProportion)),_30=_28-_25.top-_25.bottom,_31=_32+(slotWidth-_2f)*objj_msgSend(_22,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:_32,y:0},size:{width:_31-_32,height:_28}};
_partRects[CPScrollerKnob]={origin:{x:_31,y:_25.top},size:{width:_2f,height:_30}};
_partRects[CPScrollerIncrementPage]={origin:{x:_31+_2f,y:0},size:{width:_27-(_31+_2f)-_33,height:_28}};
_partRects[CPScrollerKnobSlot]={origin:{x:_32,y:_26.top},size:{width:slotWidth,height:_28-_26.top-_26.bottom}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_29.width,height:_29.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:_27-_2a.width,y:0},size:{width:_2a.width,height:_2a.height}};
}
}
}),new objj_method(sel_getUid("usableParts"),function(_34,_35){
with(_34){
return _usableParts;
}
}),new objj_method(sel_getUid("drawArrow:highlight:"),function(_36,_37,_38,_39){
with(_36){
}
}),new objj_method(sel_getUid("drawKnob"),function(_3a,_3b){
with(_3a){
}
}),new objj_method(sel_getUid("drawKnobSlot"),function(_3c,_3d){
with(_3c){
}
}),new objj_method(sel_getUid("createViewForPart:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_41,"setHitTests:",NO);
return _41;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_42,_43,_44){
with(_42){
return _partRects[_44];
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_45,_46,_47){
with(_45){
var _48=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_48,"setHitTests:",NO);
return _48;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_49,_4a){
with(_49){
objj_msgSend(_49,"checkSpaceForParts");
var _4b=0,_4c=_1.length;
for(;_4b<_4c;++_4b){
var _4d=_1[_4b];
if(_4b===0){
view=objj_msgSend(_49,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4d,CPWindowBelow,_1[_4b+1]);
}else{
view=objj_msgSend(_49,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4d,CPWindowAbove,_1[_4b-1]);
}
if(view){
objj_msgSend(view,"setBackgroundColor:",objj_msgSend(_49,"currentValueForThemeAttribute:",_2[_4d]+"-color"));
}
}
}
}),new objj_method(sel_getUid("drawParts"),function(_4e,_4f){
with(_4e){
objj_msgSend(_4e,"drawKnobSlot");
objj_msgSend(_4e,"drawKnob");
objj_msgSend(_4e,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
objj_msgSend(_4e,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
}
}),new objj_method(sel_getUid("hitPart"),function(_50,_51){
with(_50){
return _hitPart;
}
}),new objj_method(sel_getUid("trackKnob:"),function(_52,_53,_54){
with(_52){
var _55=objj_msgSend(_54,"type");
if(_55===CPLeftMouseUp){
_hitPart=CPScrollerNoPart;
return;
}
if(_55===CPLeftMouseDown){
_trackingFloatValue=objj_msgSend(_52,"floatValue");
_trackingStartPoint=objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil);
}else{
if(_55===CPLeftMouseDragged){
var _56=objj_msgSend(_52,"rectForPart:",CPScrollerKnob),_57=objj_msgSend(_52,"rectForPart:",CPScrollerKnobSlot),_58=!objj_msgSend(_52,"isVertical")?((_57.size.width)-(_56.size.width)):((_57.size.height)-(_56.size.height));
if(_58<=0){
objj_msgSend(_52,"setFloatValue:",0);
}else{
var _59=objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil);
delta=!objj_msgSend(_52,"isVertical")?_59.x-_trackingStartPoint.x:_59.y-_trackingStartPoint.y;
objj_msgSend(_52,"setFloatValue:",_trackingFloatValue+delta/_58);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_52,sel_getUid("trackKnob:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
objj_msgSend(_52,"sendAction:to:",objj_msgSend(_52,"action"),objj_msgSend(_52,"target"));
}
}),new objj_method(sel_getUid("trackScrollButtons:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5c,"type");
if(_5d===CPLeftMouseUp){
objj_msgSend(_5a,"highlight:",NO);
objj_msgSend(CPEvent,"stopPeriodicEvents");
_hitPart=CPScrollerNoPart;
return;
}
if(_5d===CPLeftMouseDown){
_trackingPart=objj_msgSend(_5a,"hitPart");
_trackingStartPoint=objj_msgSend(_5a,"convertPoint:fromView:",objj_msgSend(_5c,"locationInWindow"),nil);
if(objj_msgSend(_5c,"modifierFlags")&CPAlternateKeyMask){
if(_trackingPart==CPScrollerDecrementLine){
_hitPart=CPScrollerDecrementPage;
}else{
if(_trackingPart==CPScrollerIncrementLine){
_hitPart=CPScrollerIncrementPage;
}else{
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _5e=objj_msgSend(_5a,"rectForPart:",CPScrollerKnob),_5f=!objj_msgSend(_5a,"isVertical")?(_5e.size.width):(_5e.size.height),_60=objj_msgSend(_5a,"rectForPart:",CPScrollerKnobSlot),_61=(!objj_msgSend(_5a,"isVertical")?(_60.size.width):(_60.size.height))-_5f;
objj_msgSend(_5a,"setFloatValue:",((!objj_msgSend(_5a,"isVertical")?_trackingStartPoint.x-(_60.origin.x):_trackingStartPoint.y-(_60.origin.y))-_5f/2)/_61);
_hitPart=CPScrollerKnob;
objj_msgSend(_5a,"sendAction:to:",objj_msgSend(_5a,"action"),objj_msgSend(_5a,"target"));
return objj_msgSend(_5a,"trackKnob:",_5c);
}
}
}
}
objj_msgSend(_5a,"highlight:",YES);
objj_msgSend(_5a,"sendAction:to:",objj_msgSend(_5a,"action"),objj_msgSend(_5a,"target"));
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.5,0.04);
}else{
if(_5d===CPLeftMouseDragged){
_trackingStartPoint=objj_msgSend(_5a,"convertPoint:fromView:",objj_msgSend(_5c,"locationInWindow"),nil);
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _62=objj_msgSend(_5a,"testPart:",objj_msgSend(_5c,"locationInWindow"));
if(_62==CPScrollerDecrementPage||_62==CPScrollerIncrementPage){
_trackingPart=_62;
_hitPart=_62;
}
}
objj_msgSend(_5a,"highlight:",CGRectContainsPoint(objj_msgSend(_5a,"rectForPart:",_trackingPart),_trackingStartPoint));
}else{
if(_5d==CPPeriodic&&CGRectContainsPoint(objj_msgSend(_5a,"rectForPart:",_trackingPart),_trackingStartPoint)){
objj_msgSend(_5a,"sendAction:to:",objj_msgSend(_5a,"action"),objj_msgSend(_5a,"target"));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_5a,sel_getUid("trackScrollButtons:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_calculateIsVertical"),function(_63,_64){
with(_63){
var _65=objj_msgSend(_63,"bounds"),_66=(_65.size.width),_67=(_65.size.height);
_isVertical=_66<_67?1:(_66>_67?0:-1);
if(_isVertical===1){
objj_msgSend(_63,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_63,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_68,_69,_6a){
with(_68){
objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPControl")},"setFrameSize:",_6a);
objj_msgSend(_68,"checkSpaceForParts");
objj_msgSend(_68,"setNeedsLayout");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6b,_6c,_6d){
with(_6b){
if(!objj_msgSend(_6b,"isEnabled")){
return;
}
_hitPart=objj_msgSend(_6b,"testPart:",objj_msgSend(_6d,"locationInWindow"));
switch(_hitPart){
case CPScrollerKnob:
return objj_msgSend(_6b,"trackKnob:",_6d);
case CPScrollerDecrementLine:
case CPScrollerIncrementLine:
case CPScrollerDecrementPage:
case CPScrollerIncrementPage:
return objj_msgSend(_6b,"trackScrollButtons:",_6d);
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("themeClass"),function(_6e,_6f){
with(_6e){
return "scroller";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_70,_71){
with(_70){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,nil,nil,nil,{width:0,height:0},{width:0,height:0},{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},{width:0,height:0}],["knob-slot-color","decrement-line-color","increment-line-color","knob-color","decrement-line-size","increment-line-size","track-inset","knob-inset","minimum-knob-length"]);
}
}),new objj_method(sel_getUid("scrollerWidth"),function(_72,_73){
with(_72){
return 15;
}
}),new objj_method(sel_getUid("scrollerWidthForControlSize:"),function(_74,_75,_76){
with(_74){
return 15;
}
})]);
var _77="CPScrollerControlSize",_78="CPScrollerKnobProportion";
var _4=objj_getClass("CPScroller");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScroller\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_79,_7a,_7b){
with(_79){
if(_79=objj_msgSendSuper({receiver:_79,super_class:objj_getClass("CPControl")},"initWithCoder:",_7b)){
_controlSize=CPRegularControlSize;
if(objj_msgSend(_7b,"containsValueForKey:",_77)){
_controlSize=objj_msgSend(_7b,"decodeIntForKey:",_77);
}
_knobProportion=1;
if(objj_msgSend(_7b,"containsValueForKey:",_78)){
_knobProportion=objj_msgSend(_7b,"decodeFloatForKey:",_78);
}
_partRects=[];
_hitPart=CPScrollerNoPart;
objj_msgSend(_79,"_calculateIsVertical");
}
return _79;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_7e);
objj_msgSend(_7e,"encodeInt:forKey:",_controlSize,_77);
objj_msgSend(_7e,"encodeFloat:forKey:",_knobProportion,_78);
}
})]);
var _4=objj_getClass("CPScroller");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScroller\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("setFloatValue:knobProportion:"),function(_7f,_80,_81,_82){
with(_7f){
objj_msgSend(_7f,"setFloatValue:",_81);
objj_msgSend(_7f,"setKnobProportion:",_82);
}
})]);
p;14;CPScrollView.ji;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;17135;
var _1=objj_allocateClassPair(CPView,"CPScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_headerClipView"),new objj_ivar("_cornerView"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(_3,"addSubview:",_headerClipView);
objj_msgSend(_3,"setHasVerticalScroller:",YES);
objj_msgSend(_3,"setHasHorizontalScroller:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("contentSize"),function(_6,_7){
with(_6){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_8,_9){
with(_8){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setContentView:"),function(_a,_b,_c){
with(_a){
if(_contentView!==_c||!_c){
return;
}
var _d=objj_msgSend(_c,"documentView");
if(_d){
objj_msgSend(_d,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_c;
objj_msgSend(_contentView,"setDocumentView:",_d);
objj_msgSend(_a,"addSubview:",_contentView);
objj_msgSend(_a,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_e,_f){
with(_e){
return _contentView;
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_contentView,"setDocumentView:",_12);
objj_msgSend(_10,"_updateCornerAndHeaderView");
objj_msgSend(_10,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_13,_14,_15){
with(_13){
if(_contentView!==_15){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _16=objj_msgSend(_13,"documentView");
if(!_16){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}else{
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_13,"bounds"));
objj_msgSend(_headerClipView,"setFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
--_recursionCount;
return;
}
var _17=objj_msgSend(_16,"frame"),_18=objj_msgSend(_13,"bounds"),_19=objj_msgSend(_13,"_headerClipViewFrame"),_1a=(_19.size.height);
_18.origin.y+=_1a;
_18.size.height-=_1a;
var _1b={width:(_17.size.width)-(_18.size.width),height:(_17.size.height)-(_18.size.height)},_1c=(objj_msgSend(_verticalScroller,"frame").size.width),_1d=(objj_msgSend(_horizontalScroller,"frame").size.height),_1e=_1b.height>0,_1f=_1b.width>0,_20=_hasVerticalScroller&&(!_autohidesScrollers||_1e),_21=_hasHorizontalScroller&&(!_autohidesScrollers||_1f);
if(_20){
_1b.width+=_1c;
_1f=_1b.width>0;
_21=_hasHorizontalScroller&&(!_autohidesScrollers||_1f);
}
if(_21){
_1b.height+=_1d;
_1e=_1b.height>0;
_20=_hasVerticalScroller&&(!_autohidesScrollers||_1e);
}
objj_msgSend(_verticalScroller,"setHidden:",!_20);
objj_msgSend(_verticalScroller,"setEnabled:",_1e);
objj_msgSend(_horizontalScroller,"setHidden:",!_21);
objj_msgSend(_horizontalScroller,"setEnabled:",_1f);
if(_20){
_18.size.width-=_1c;
}
if(_21){
_18.size.height-=_1d;
}
var _22=objj_msgSend(_contentView,"bounds").origin,_23=!objj_msgSend(_verticalScroller,"isHidden"),_24=!objj_msgSend(_horizontalScroller,"isHidden");
if(_20){
var _25=MAX((objj_msgSend(_13,"_cornerViewFrame").size.height),_1a),_26=(objj_msgSend(_13,"bounds").size.height)-_25;
if(_21){
_26-=_1d;
}
objj_msgSend(_verticalScroller,"setFloatValue:",(_1b.height<=0)?0:_22.y/_1b.height);
objj_msgSend(_verticalScroller,"setKnobProportion:",(_18.size.height)/(_17.size.height));
objj_msgSend(_verticalScroller,"setFrame:",{origin:{x:(_18.origin.x+_18.size.width),y:_25},size:{width:_1c,height:_26}});
}else{
if(_23){
objj_msgSend(_verticalScroller,"setFloatValue:",0);
objj_msgSend(_verticalScroller,"setKnobProportion:",1);
}
}
if(_21){
objj_msgSend(_horizontalScroller,"setFloatValue:",(_1b.width<=0)?0:_22.x/_1b.width);
objj_msgSend(_horizontalScroller,"setKnobProportion:",(_18.size.width)/(_17.size.width));
objj_msgSend(_horizontalScroller,"setFrame:",{origin:{x:0,y:(_18.origin.y+_18.size.height)},size:{width:(_18.size.width),height:_1d}});
}else{
if(_24){
objj_msgSend(_horizontalScroller,"setFloatValue:",0);
objj_msgSend(_horizontalScroller,"setKnobProportion:",1);
}
}
objj_msgSend(_contentView,"setFrame:",_18);
objj_msgSend(_headerClipView,"setFrame:",_19);
objj_msgSend(_cornerView,"setFrame:",objj_msgSend(_13,"_cornerViewFrame"));
--_recursionCount;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_27,_28,_29){
with(_27){
if(_horizontalScroller===_29){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_29;
objj_msgSend(_horizontalScroller,"setTarget:",_27);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_27,"addSubview:",_horizontalScroller);
objj_msgSend(_27,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_2a,_2b){
with(_2a){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_2c,_2d,_2e){
with(_2c){
if(_hasHorizontalScroller===_2e){
return;
}
_hasHorizontalScroller=_2e;
if(_hasHorizontalScroller&&!_horizontalScroller){
objj_msgSend(_2c,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,(objj_msgSend(_2c,"bounds").size.width),objj_msgSend(CPScroller,"scrollerWidth"))));
}else{
if(!_hasHorizontalScroller&&_horizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",YES);
objj_msgSend(_2c,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_2f,_30){
with(_2f){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_31,_32,_33){
with(_31){
if(_verticalScroller===_33){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_33;
objj_msgSend(_verticalScroller,"setTarget:",_31);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_31,"addSubview:",_verticalScroller);
objj_msgSend(_31,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_34,_35){
with(_34){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_36,_37,_38){
with(_36){
if(_hasVerticalScroller===_38){
return;
}
_hasVerticalScroller=_38;
if(_hasVerticalScroller&&!_verticalScroller){
objj_msgSend(_36,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidth"),height:(objj_msgSend(_36,"bounds").size.height)}}));
}else{
if(!_hasVerticalScroller&&_verticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_36,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_39,_3a){
with(_39){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_3b,_3c,_3d){
with(_3b){
if(_autohidesScrollers==_3d){
return;
}
_autohidesScrollers=_3d;
objj_msgSend(_3b,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_3e,_3f){
with(_3e){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("_updateCornerAndHeaderView"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"documentView"),_43=objj_msgSend(_40,"_headerView"),_44=objj_msgSend(_42,"respondsToSelector:",sel_getUid("headerView"))?objj_msgSend(_42,"headerView"):nil;
if(_43!==_44){
objj_msgSend(_43,"removeFromSuperview");
objj_msgSend(_headerClipView,"setDocumentView:",_44);
}
var _45=objj_msgSend(_42,"respondsToSelector:",sel_getUid("cornerView"))?objj_msgSend(_42,"cornerView"):nil;
if(_cornerView!==_45){
objj_msgSend(_cornerView,"removeFromSuperview");
_cornerView=_45;
if(_cornerView){
objj_msgSend(_40,"addSubview:",_cornerView);
}
}
objj_msgSend(_40,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("_headerView"),function(_46,_47){
with(_46){
var _48=objj_msgSend(_headerClipView,"subviews");
return objj_msgSend(_48,"count")?_48[0]:nil;
}
}),new objj_method(sel_getUid("_cornerViewFrame"),function(_49,_4a){
with(_49){
if(!_cornerView){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4b=objj_msgSend(_49,"bounds"),_4c=objj_msgSend(_cornerView,"frame");
_4c.origin.x=(_4b.origin.x+_4b.size.width)-(_4c.size.width);
_4c.origin.y=0;
return _4c;
}
}),new objj_method(sel_getUid("_headerClipViewFrame"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSend(_4d,"_headerView");
if(!_4f){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _50=objj_msgSend(_4d,"bounds");
_50.size.height=(objj_msgSend(_4f,"frame").size.height);
_50.size.width-=(objj_msgSend(_4d,"_cornerViewFrame").size.width);
return _50;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_53,"floatValue"),_55=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame");
contentBounds=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
contentBounds.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
contentBounds.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
contentBounds.origin.y-=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
contentBounds.origin.y+=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
contentBounds.origin.y=ROUND(_54*((_55.size.height)-(contentBounds.size.height)));
}
objj_msgSend(_contentView,"scrollToPoint:",contentBounds.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_58,"floatValue"),_5a=objj_msgSend(objj_msgSend(_56,"documentView"),"frame"),_5b=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_5b.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_5b.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_5b.origin.x-=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_5b.origin.x+=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_5b.origin.x=ROUND(_59*((_5a.size.width)-(_5b.size.width)));
}
objj_msgSend(_contentView,"scrollToPoint:",_5b.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_5b.origin.x,0));
}
}),new objj_method(sel_getUid("tile"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_5e,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setHorizonalLineScroll:",_63);
objj_msgSend(_61,"setVerticalLineScroll:",_63);
}
}),new objj_method(sel_getUid("lineScroll"),function(_64,_65){
with(_64){
return objj_msgSend(_64,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_66,_67,_68){
with(_66){
_horizontalLineScroll=_68;
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_69,_6a){
with(_69){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_6b,_6c,_6d){
with(_6b){
_verticalLineScroll=_6d;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_6e,_6f){
with(_6e){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"setHorizontalPageScroll:",_72);
objj_msgSend(_70,"setVerticalPageScroll:",_72);
}
}),new objj_method(sel_getUid("pageScroll"),function(_73,_74){
with(_73){
return objj_msgSend(_73,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_75,_76,_77){
with(_75){
_horizontalPageScroll=_77;
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_78,_79){
with(_78){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_7a,_7b,_7c){
with(_7a){
_verticalPageScroll=_7c;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_7d,_7e){
with(_7d){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_7f,"documentView"),"frame"),_83=objj_msgSend(_contentView,"bounds");
_83.origin.x=ROUND(_83.origin.x+objj_msgSend(_81,"deltaX")*_horizontalLineScroll);
_83.origin.y=ROUND(_83.origin.y+objj_msgSend(_81,"deltaY")*_verticalLineScroll);
objj_msgSend(_contentView,"scrollToPoint:",_83.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_83.origin.x,0));
}
}),new objj_method(sel_getUid("keyDown:"),function(_84,_85,_86){
with(_84){
var _87=objj_msgSend(_86,"keyCode"),_88=objj_msgSend(objj_msgSend(_84,"documentView"),"frame"),_89=objj_msgSend(_contentView,"bounds");
switch(_87){
case 33:
_89.origin.y-=(_89.size.height)-_verticalPageScroll;
break;
case 34:
_89.origin.y+=(_89.size.height)-_verticalPageScroll;
break;
case 38:
_89.origin.y-=_verticalLineScroll;
break;
case 40:
_89.origin.y+=_verticalLineScroll;
break;
case 37:
_89.origin.x-=_horizontalLineScroll;
break;
case 49:
_89.origin.x+=_horizontalLineScroll;
break;
default:
return objj_msgSendSuper({receiver:_84,super_class:objj_getClass("CPView")},"keyDown:",_86);
}
objj_msgSend(_contentView,"scrollToPoint:",_89.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_89.origin,0));
}
})]);
var _8a="CPScrollViewContentView",_8b="CPScrollViewVLineScroll",_8c="CPScrollViewHLineScroll",_8d="CPScrollViewVPageScroll",_8e="CPScrollViewHPageScroll",_8f="CPScrollViewHasVScroller",_90="CPScrollViewHasHScroller",_91="CPScrollViewVScroller",_92="CPScrollViewHScroller",_93="CPScrollViewAutohidesScroller";
var _1=objj_getClass("CPScrollView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScrollView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_94,_95,_96){
with(_94){
if(_94=objj_msgSendSuper({receiver:_94,super_class:objj_getClass("CPView")},"initWithCoder:",_96)){
_verticalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8b);
_verticalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8d);
_horizontalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8c);
_horizontalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8e);
_contentView=objj_msgSend(_96,"decodeObjectForKey:",_8a);
_verticalScroller=objj_msgSend(_96,"decodeObjectForKey:",_91);
_horizontalScroller=objj_msgSend(_96,"decodeObjectForKey:",_92);
_hasVerticalScroller=objj_msgSend(_96,"decodeBoolForKey:",_8f);
_hasHorizontalScroller=objj_msgSend(_96,"decodeBoolForKey:",_90);
_autohidesScrollers=objj_msgSend(_96,"decodeBoolForKey:",_93);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("reflectScrolledClipView:"),_94,_contentView,0,[CPDefaultRunLoopMode]);
}
return _94;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_97,_98,_99){
with(_97){
objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPView")},"encodeWithCoder:",_99);
objj_msgSend(_99,"encodeObject:forKey:",_contentView,_8a);
objj_msgSend(_99,"encodeObject:forKey:",_verticalScroller,_91);
objj_msgSend(_99,"encodeObject:forKey:",_horizontalScroller,_92);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalLineScroll,_8b);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalPageScroll,_8d);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalLineScroll,_8c);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalPageScroll,_8e);
objj_msgSend(_99,"encodeBool:forKey:",_hasVerticalScroller,_8f);
objj_msgSend(_99,"encodeBool:forKey:",_hasHorizontalScroller,_90);
objj_msgSend(_99,"encodeBool:forKey:",_autohidesScrollers,_93);
}
})]);
p;15;CPSearchField.ji;13;CPTextField.jc;17963;
CPSearchFieldRecentsTitleMenuItemTag=1000;
CPSearchFieldRecentsMenuItemTag=1001;
CPSearchFieldClearRecentsMenuItemTag=1002;
CPSearchFieldNoRecentsMenuItemTag=1003;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPTextField,"CPSearchField"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_searchButton"),new objj_ivar("_cancelButton"),new objj_ivar("_searchMenuTemplate"),new objj_ivar("_searchMenu"),new objj_ivar("_recentsAutosaveName"),new objj_ivar("_recentSearches"),new objj_ivar("_maximumRecents"),new objj_ivar("_sendsWholeSearchString"),new objj_ivar("_sendsSearchStringImmediately"),new objj_ivar("_partialStringTimer")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPTextField")},"initWithFrame:",_9);
if(_7!=nil){
_recentSearches=objj_msgSend(CPArray,"array");
_maximumRecents=10;
_sendsWholeSearchString=NO;
_sendsSearchStringImmediately=NO;
objj_msgSend(_7,"setBezeled:",YES);
objj_msgSend(_7,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_7,"setBordered:",YES);
objj_msgSend(_7,"setEditable:",YES);
objj_msgSend(_7,"setDelegate:",_7);
_cancelButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPMakeRect(_9.size.width-27,(_9.size.height-22)/2,22,22));
objj_msgSend(_7,"resetCancelButton");
objj_msgSend(_cancelButton,"setHidden:",YES);
objj_msgSend(_cancelButton,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_7,"addSubview:",_cancelButton);
_searchButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPMakeRect(5,(_9.size.height-25)/2,25,25));
objj_msgSend(_searchButton,"setBezelStyle:",CPRegularSquareBezelStyle);
objj_msgSend(_searchButton,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_searchButton,"setBordered:",NO);
objj_msgSend(_searchButton,"setImageScaling:",CPScaleToFit);
objj_msgSend(_7,"setSearchMenuTemplate:",objj_msgSend(_7,"_searchMenuTemplate"));
objj_msgSend(_7,"addSubview:",_searchButton);
}
return _7;
}
}),new objj_method(sel_getUid("copy"),function(_a,_b){
with(_a){
var _c=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPTextField")},"copy");
objj_msgSend(_c,"setCancelButton:",objj_msgSend(_cancelButton,"copy"));
objj_msgSend(_c,"setSearchButton:",objj_msgSend(_searchButton,"copy"));
objj_msgSend(_c,"setrecentsAutosaveName:",objj_msgSend(_recentsAutosaveName,"copy"));
objj_msgSend(_c,"setSendsWholeSearchString:",objj_msgSend(_sendsWholeSearchString,"copy"));
objj_msgSend(_c,"setSendsSearchStringImmediately:",objj_msgSend(_sendsSearchStringImmediately,"copy"));
objj_msgSend(_c,"setMaximumRecents:",_maximumRecents);
objj_msgSend(_c,"setSearchMenutemplate:",objj_msgSend(_searchMenuTemplate,"copy"));
return _c;
}
}),new objj_method(sel_getUid("setSearchButton:"),function(_d,_e,_f){
with(_d){
_searchButton=_f;
}
}),new objj_method(sel_getUid("searchButton"),function(_10,_11){
with(_10){
return _searchButton;
}
}),new objj_method(sel_getUid("resetSearchButton"),function(_12,_13){
with(_12){
var _14,_15,_16,_17=objj_msgSend(_12,"searchButton");
if(_searchMenuTemplate==nil){
_14=_1;
_15=objj_msgSend(_12,"action");
_16=objj_msgSend(_12,"target");
}else{
_14=_2;
_15=sel_getUid("_showMenu:");
_16=_12;
}
objj_msgSend(_17,"setImage:",_14);
objj_msgSend(_17,"setTarget:",_16);
objj_msgSend(_17,"setAction:",_15);
}
}),new objj_method(sel_getUid("setCancelButton:"),function(_18,_19,_1a){
with(_18){
_cancelButton=_1a;
}
}),new objj_method(sel_getUid("cancelButton"),function(_1b,_1c){
with(_1b){
return _cancelButton;
}
}),new objj_method(sel_getUid("resetCancelButton"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"cancelButton");
objj_msgSend(_1f,"setBezelStyle:",CPRegularSquareBezelStyle);
objj_msgSend(_1f,"setBordered:",NO);
objj_msgSend(_1f,"setImageScaling:",CPScaleToFit);
objj_msgSend(_1f,"setImage:",_3);
objj_msgSend(_1f,"setAlternateImage:",_4);
objj_msgSend(_1f,"setTarget:",_1d);
objj_msgSend(_1f,"setAction:",sel_getUid("_searchFieldCancel:"));
}
}),new objj_method(sel_getUid("searchTextRectForBounds:"),function(_20,_21,_22){
with(_20){
var _23=0,_24=_22.size.width;
if(_searchButton){
var _25=objj_msgSend(_searchButton,"frame");
_23=_25.origin.x+_25.size.width;
}
if(_cancelButton){
var _26=objj_msgSend(_cancelButton,"frame");
_24=_26.origin.x-_23;
}
return CPMakeRect(_23,_22.origin.y,_24,_22.size.height);
}
}),new objj_method(sel_getUid("searchButtonRectForBounds:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(_searchButton,"frame");
}
}),new objj_method(sel_getUid("cancelButtonRectForBounds:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(_cancelButton,"frame");
}
}),new objj_method(sel_getUid("searchMenuTemplate"),function(_2d,_2e){
with(_2d){
return _searchMenuTemplate;
}
}),new objj_method(sel_getUid("setSearchMenuTemplate:"),function(_2f,_30,_31){
with(_2f){
_searchMenuTemplate=_31;
objj_msgSend(_2f,"resetSearchButton");
objj_msgSend(_2f,"_updateSearchMenu");
}
}),new objj_method(sel_getUid("sendsWholeSearchString"),function(_32,_33){
with(_32){
return _sendsWholeSearchString;
}
}),new objj_method(sel_getUid("setSendsWholeSearchString:"),function(_34,_35,_36){
with(_34){
_sendsWholeSearchString=_36;
}
}),new objj_method(sel_getUid("sendsSearchStringImmediately"),function(_37,_38){
with(_37){
return _sendsSearchStringImmediately;
}
}),new objj_method(sel_getUid("setSendsSearchStringImmediately:"),function(_39,_3a,_3b){
with(_39){
_sendsSearchStringImmediately=_3b;
}
}),new objj_method(sel_getUid("maximumRecents"),function(_3c,_3d){
with(_3c){
return _maximumRecents;
}
}),new objj_method(sel_getUid("setMaximumRecents:"),function(_3e,_3f,max){
with(_3e){
if(max>254){
max=254;
}else{
if(max<0){
max=10;
}
}
_maximumRecents=max;
}
}),new objj_method(sel_getUid("recentSearches"),function(_40,_41){
with(_40){
return _recentSearches;
}
}),new objj_method(sel_getUid("setRecentSearches:"),function(_42,_43,_44){
with(_42){
var max=MIN(objj_msgSend(_42,"maximumRecents"),objj_msgSend(_44,"count"));
var _44=objj_msgSend(_44,"subarrayWithRange:",CPMakeRange(0,max));
_recentSearches=_44;
objj_msgSend(_42,"_autosaveRecentSearchList");
}
}),new objj_method(sel_getUid("recentsAutosaveName"),function(_45,_46){
with(_45){
return _recentsAutosaveName;
}
}),new objj_method(sel_getUid("setRecentsAutosaveName:"),function(_47,_48,_49){
with(_47){
_recentsAutosaveName=_49;
if(_49!=nil){
objj_msgSend(_47,"_registerForAutosaveNotification");
}else{
objj_msgSend(_47,"_deregisterForAutosaveNotification");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("CPTextField")},"contentRectForBounds:",_4c);
return objj_msgSend(_4a,"searchTextRectForBounds:",_4d);
}
}),new objj_method(sel_getUid("menu"),function(_4e,_4f){
with(_4e){
return _searchMenu;
}
}),new objj_method(sel_getUid("isOpaque"),function(_50,_51){
with(_50){
return objj_msgSendSuper({receiver:_50,super_class:objj_getClass("CPTextField")},"isOpaque")&&objj_msgSend(_cancelButton,"isOpaque")&&objj_msgSend(_searchButton,"isOpaque");
}
}),new objj_method(sel_getUid("_updateCancelButtonVisibility"),function(_52,_53){
with(_52){
objj_msgSend(_cancelButton,"setHidden:",(objj_msgSend(objj_msgSend(_52,"stringValue"),"length")==0));
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_54,_55,_56){
with(_54){
if(!_sendsWholeSearchString){
if(_sendsSearchStringImmediately){
objj_msgSend(_54,"_sendPartialString");
}else{
objj_msgSend(_partialStringTimer,"invalidate");
var _57=objj_msgSend(CPSearchField,"_keyboardDelayForPartialSearchString:",objj_msgSend(_54,"stringValue"));
_partialStringTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_57,_54,sel_getUid("_sendPartialString"),nil,NO);
}
}
objj_msgSend(_54,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_58,_59,_5a,_5b){
with(_58){
objj_msgSendSuper({receiver:_58,super_class:objj_getClass("CPTextField")},"sendAction:to:",_5a,_5b);
objj_msgSend(_partialStringTimer,"invalidate");
var _5c=objj_msgSend(_58,"objectValue");
if(_5c!=nil&&_5c!=""&&!objj_msgSend(_recentSearches,"containsObject:",_5c)){
objj_msgSend(_58,"_addStringToRecentSearches:",_5c);
objj_msgSend(_58,"_updateSearchMenu");
}
objj_msgSend(_58,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("_addStringToRecentSearches:"),function(_5d,_5e,_5f){
with(_5d){
var _60=objj_msgSend(CPMutableArray,"arrayWithArray:",_recentSearches);
objj_msgSend(_60,"addObject:",_5f);
objj_msgSend(_5d,"setRecentSearches:",_60);
}
}),new objj_method(sel_getUid("trackMouse:"),function(_61,_62,_63){
with(_61){
var _64;
var _65;
var _66=objj_msgSend(_63,"locationInWindow");
_65=objj_msgSend(_61,"convertPoint:fromView:",_66,nil);
_64=objj_msgSend(_61,"searchButtonRectForBounds:",objj_msgSend(_61,"frame"));
if(CPRectContainsPoint(_64,_65)){
return objj_msgSend(objj_msgSend(_61,"searchButton"),"trackMouse:",_63);
}
_64=objj_msgSend(_61,"cancelButtonRectForBounds:",objj_msgSend(_61,"frame"));
if(CPRectContainsPoint(_64,_65)){
return objj_msgSend(objj_msgSend(_61,"cancelButton"),"trackMouse:",_63);
}
return objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPTextField")},"trackMouse:",_63);
}
}),new objj_method(sel_getUid("_searchMenuTemplate"),function(_67,_68){
with(_67){
var _69,_6a;
_69=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
_6a=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Recent searches",NULL,"");
objj_msgSend(_6a,"setTag:",CPSearchFieldRecentsTitleMenuItemTag);
objj_msgSend(_6a,"setEnabled:",NO);
objj_msgSend(_69,"addItem:",_6a);
_6a=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Recent search item",sel_getUid("_searchFieldSearch:"),"");
objj_msgSend(_6a,"setTag:",CPSearchFieldRecentsMenuItemTag);
objj_msgSend(_6a,"setTarget:",_67);
objj_msgSend(_69,"addItem:",_6a);
_6a=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Clear recent searches",sel_getUid("_searchFieldClearRecents:"),"");
objj_msgSend(_6a,"setTag:",CPSearchFieldClearRecentsMenuItemTag);
objj_msgSend(_6a,"setTarget:",_67);
objj_msgSend(_69,"addItem:",_6a);
_6a=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","No recent searches",NULL,"");
objj_msgSend(_6a,"setTag:",CPSearchFieldNoRecentsMenuItemTag);
objj_msgSend(_6a,"setEnabled:",NO);
objj_msgSend(_69,"addItem:",_6a);
return _69;
}
}),new objj_method(sel_getUid("_updateSearchMenu"),function(_6b,_6c){
with(_6b){
if(_searchMenuTemplate==nil){
return;
}
var i,_6d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
var _6e=objj_msgSend(_recentSearches,"count");
for(i=0;i<objj_msgSend(_searchMenuTemplate,"numberOfItems");i++){
var _6f=objj_msgSend(_searchMenuTemplate,"itemAtIndex:",i);
var tag=objj_msgSend(_6f,"tag");
if(tag==CPSearchFieldClearRecentsMenuItemTag&&_6e!=0){
var _70=objj_msgSend(CPMenuItem,"separatorItem");
objj_msgSend(_6d,"addItem:",_70);
}
if(!(tag==CPSearchFieldRecentsTitleMenuItemTag&&_6e==0)&&!(tag==CPSearchFieldClearRecentsMenuItemTag&&_6e==0)&&!(tag==CPSearchFieldNoRecentsMenuItemTag&&_6e!=0)&&!(tag==CPSearchFieldRecentsMenuItemTag)){
var _71=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_6f,"title"),objj_msgSend(_6f,"action"),objj_msgSend(_6f,"keyEquivalent"));
objj_msgSend(_71,"setTarget:",objj_msgSend(_6f,"target"));
objj_msgSend(_71,"setEnabled:",objj_msgSend(_6f,"isEnabled"));
objj_msgSend(_71,"setTag:",objj_msgSend(_6f,"tag"));
objj_msgSend(_6d,"addItem:",_71);
}else{
if(tag==CPSearchFieldRecentsMenuItemTag){
var j;
for(j=0;j<_6e;j++){
var _72=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_recentSearches,"objectAtIndex:",j),objj_msgSend(_6f,"action"),objj_msgSend(_6f,"keyEquivalent"));
objj_msgSend(_72,"setTarget:",objj_msgSend(_6f,"target"));
objj_msgSend(_6d,"addItem:",_72);
}
}
}
}
_searchMenu=_6d;
}
}),new objj_method(sel_getUid("_showMenu:"),function(_73,_74,_75){
with(_73){
if(_searchMenu==nil||!objj_msgSend(_73,"isEnabled")){
return;
}
objj_msgSendSuper({receiver:_73,super_class:objj_getClass("CPTextField")},"selectText:",nil);
var _76=CPMakePoint(objj_msgSend(_73,"frame").origin.x,objj_msgSend(_73,"frame").origin.y+objj_msgSend(_73,"frame").size.height);
var _77=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPRightMouseDown,_76,0,objj_msgSend(CPDate,"date"),1,objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),"","",NO,0);
objj_msgSend(CPMenu,"popUpContextMenu:withEvent:forView:",_searchMenu,_77,_75);
}
}),new objj_method(sel_getUid("_sendPartialString"),function(_78,_79){
with(_78){
objj_msgSend(objj_msgSend(_78,"target"),"performSelector:withObject:",objj_msgSend(_78,"action"),_78);
}
}),new objj_method(sel_getUid("_searchFieldCancel:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSend(_7a,"setObjectValue:",nil);
objj_msgSend(_7a,"_sendPartialString");
objj_msgSend(_7a,"_updateCancelButtonVisibility");
objj_msgSend(_7c,"setHidden:",YES);
}
}),new objj_method(sel_getUid("_searchFieldSearch:"),function(_7d,_7e,_7f){
with(_7d){
objj_msgSend(_7d,"setObjectValue:",objj_msgSend(_7f,"title"));
objj_msgSend(_7d,"_sendPartialString");
objj_msgSend(_7d,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("_searchFieldClearRecents:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_80,"setRecentSearches:",objj_msgSend(CPArray,"array"));
objj_msgSend(_80,"_updateSearchMenu");
}
}),new objj_method(sel_getUid("_registerForAutosaveNotification"),function(_83,_84){
with(_83){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_83,sel_getUid("_updateAutosavedRecents:"),"CPAutosavedRecentsChangedNotification",nil);
}
}),new objj_method(sel_getUid("_deregisterForAutosaveNotification"),function(_85,_86){
with(_85){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_85,"CPAutosavedRecentsChangedNotification",nil);
}
}),new objj_method(sel_getUid("_updateAutosavedRecents:"),function(_87,_88,_89){
with(_87){
var _8a=objj_msgSend(_89,"object");
var _8b=objj_msgSend(_87,"recentSearches");
objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"setObject:forKey:",_8b,_8a);
}
}),new objj_method(sel_getUid("_autosaveRecentSearchList"),function(_8c,_8d){
with(_8c){
if(_recentsAutosaveName!=nil){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:","CPAutosavedRecentsChangedNotification",_recentsAutosaveName);
}
}
}),new objj_method(sel_getUid("_loadRecentSearchList"),function(_8e,_8f){
with(_8e){
var _90,_91=objj_msgSend(_8e,"recentsAutosaveName");
_90=objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"objectForKey:",_91);
_recentSearches=_90;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_92,_93){
with(_92){
if(_92!=objj_msgSend(CPSearchField,"class")){
return;
}
var _94=objj_msgSend(CPBundle,"bundleForClass:",_92);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_94,"pathForResource:","CPSearchField/CPSearchFieldSearch.png"));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_94,"pathForResource:","CPSearchField/CPSearchFieldFind.png"));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_94,"pathForResource:","CPSearchField/CPSearchFieldCancel.png"));
_4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_94,"pathForResource:","CPSearchField/CPSearchFieldCancelPressed.png"));
}
}),new objj_method(sel_getUid("_keyboardDelayForPartialSearchString:"),function(_95,_96,_97){
with(_95){
return (6-MIN(objj_msgSend(_97,"length"),4))/10;
}
})]);
var _98="CPSearchButtonKey",_99="CPCancelButtonKey",_9a="CPRecentsAutosaveNameKey",_9b="CPSendsWholeSearchStringKey",_9c="CPSendsSearchStringImmediatelyKey",_9d="CPMaximumRecentsKey",_9e="CPSearchMenuTemplateKey";
var _5=objj_getClass("CPSearchField");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSearchField\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("encodeWithCoder:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("CPTextField")},"encodeWithCoder:",_a1);
objj_msgSend(_a1,"encodeObject:forKey:",_searchButton,_98);
objj_msgSend(_a1,"encodeObject:forKey:",_cancelButton,_99);
objj_msgSend(_a1,"encodeObject:forKey:",_recentsAutosaveName,_9a);
objj_msgSend(_a1,"encodeBool:forKey:",_sendsWholeSearchString,_9b);
objj_msgSend(_a1,"encodeBool:forKey:",_sendsSearchStringImmediately,_9c);
objj_msgSend(_a1,"encodeInt:forKey:",_maximumRecents,_9d);
objj_msgSend(_a1,"encodeObject:forKey:",_searchMenuTemplate,_9e);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_a2,_a3,_a4){
with(_a2){
_a2=objj_msgSendSuper({receiver:_a2,super_class:objj_getClass("CPTextField")},"initWithCoder:",_a4);
_searchButton=objj_msgSend(_a4,"decodeObjectForKey:",_98);
_cancelButton=objj_msgSend(_a4,"decodeObjectForKey:",_99);
_recentsAutosaveName=objj_msgSend(_a4,"decodeObjectForKey:",_9a);
_sendsWholeSearchString=objj_msgSend(_a4,"decodeBoolForKey:",_9b);
_sendsSearchStringImmediately=objj_msgSend(_a4,"decodeBoolForKey:",_9c);
_maximumRecents=objj_msgSend(_a4,"decodeIntForKey:",_9d);
objj_msgSend(_a2,"setSearchMenuTemplate:",objj_msgSend(_a4,"decodeObjectForKey:",_9e));
objj_msgSend(_a2,"resetCancelButton");
objj_msgSend(_a2,"setDelegate:",_a2);
return _a2;
}
})]);
p;19;CPSecureTextField.ji;13;CPTextField.jc;287;
var _1=objj_allocateClassPair(CPTextField,"CPSecureTextField"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isSecure"),function(_3,_4){
with(_3){
return YES;
}
})]);
p;20;CPSegmentedControl.jI;20;Foundation/CPArray.ji;11;CPControl.jc;20550;
CPSegmentSwitchTrackingSelectOne=0;
CPSegmentSwitchTrackingSelectAny=1;
CPSegmentSwitchTrackingMomentary=2;
var _1=objj_allocateClassPair(CPControl,"CPSegmentedControl"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segments"),new objj_ivar("_themeStates"),new objj_ivar("_selectedSegment"),new objj_ivar("_segmentStyle"),new objj_ivar("_trackingMode"),new objj_ivar("_trackingSegment"),new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_segments=[];
_themeStates=[];
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_selectedSegment=-1;
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
return _3;
}
}),new objj_method(sel_getUid("selectedTag"),function(_6,_7){
with(_6){
return _segments[_selectedSegment].tag;
}
}),new objj_method(sel_getUid("setSegmentCount:"),function(_8,_9,_a){
with(_8){
if(_segments.length==_a){
return;
}
var _b=CGRectGetHeight(objj_msgSend(_8,"bounds"));
if(_segments.length<_a){
for(var _c=_segments.length;_c<_a;++_c){
_segments[_c]=objj_msgSend(objj_msgSend(_CPSegmentItem,"alloc"),"init");
_themeStates[_c]=CPThemeStateNormal;
}
}else{
if(_a<_segments.length){
_segments.length=_a;
_themeStates.length=_a;
}
}
if(_selectedSegment>=_segments.length){
_selectedSegment=-1;
}
objj_msgSend(_8,"tileWithChangedSegment:",0);
}
}),new objj_method(sel_getUid("segmentCount"),function(_d,_e){
with(_d){
return _segments.length;
}
}),new objj_method(sel_getUid("setSelectedSegment:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setSelected:forSegment:",YES,_11);
}
}),new objj_method(sel_getUid("selectedSegment"),function(_12,_13){
with(_12){
return _selectedSegment;
}
}),new objj_method(sel_getUid("selectSegmentWithTag:"),function(_14,_15,_16){
with(_14){
var _17=0;
for(;_17<_segments.length;++_17){
if(_segments[_17].tag==_16){
objj_msgSend(_14,"setSelectedSegment:",_17);
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isTracking"),function(_18,_19){
with(_18){
}
}),new objj_method(sel_getUid("setTrackingMode:"),function(_1a,_1b,_1c){
with(_1a){
if(_trackingMode==_1c){
return;
}
_trackingMode=_1c;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne){
var _1d=0,_1e=NO;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
if(_1e){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}else{
_1e=YES;
}
}
}
}else{
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
var _1d=0;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}
}
}
}
}
}),new objj_method(sel_getUid("trackingMode"),function(_1f,_20){
with(_1f){
return _trackingMode;
}
}),new objj_method(sel_getUid("setWidth:forSegment:"),function(_21,_22,_23,_24){
with(_21){
_segments[_24].width=_23;
objj_msgSend(_21,"tileWithChangedSegment:",_24);
}
}),new objj_method(sel_getUid("widthForSegment:"),function(_25,_26,_27){
with(_25){
return _segments[_27].width;
}
}),new objj_method(sel_getUid("setImage:forSegment:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=_segments[_2b];
_2c.image=_2a;
objj_msgSend(_28,"tileWithChangedSegment:",_2b);
}
}),new objj_method(sel_getUid("imageForSegment:"),function(_2d,_2e,_2f){
with(_2d){
return _segments[_2f].image;
}
}),new objj_method(sel_getUid("setLabel:forSegment:"),function(_30,_31,_32,_33){
with(_30){
var _34=_segments[_33];
_segments[_33].label=_32;
objj_msgSend(_30,"tileWithChangedSegment:",_33);
}
}),new objj_method(sel_getUid("labelForSegment:"),function(_35,_36,_37){
with(_35){
return _segments[_37].label;
}
}),new objj_method(sel_getUid("setMenu:forSegment:"),function(_38,_39,_3a,_3b){
with(_38){
_segments[_3b].menu=_3a;
}
}),new objj_method(sel_getUid("menuForSegment:"),function(_3c,_3d,_3e){
with(_3c){
return _segments[_3e].menu;
}
}),new objj_method(sel_getUid("setSelected:forSegment:"),function(_3f,_40,_41,_42){
with(_3f){
var _43=_segments[_42];
if(_43.selected==_41){
return;
}
_43.selected=_41;
_themeStates[_42]=_41?CPThemeStateSelected:CPThemeStateNormal;
if(_41){
var _44=_selectedSegment;
_selectedSegment=_42;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_44!=_42&&_44!=-1){
_segments[_44].selected=NO;
_themeStates[_44]=CPThemeStateNormal;
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_44,NO);
}
}
if(_trackingMode!=CPSegmentSwitchTrackingMomentary){
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_42,NO);
}
objj_msgSend(_3f,"setNeedsLayout");
objj_msgSend(_3f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isSelectedForSegment:"),function(_45,_46,_47){
with(_45){
return _segments[_47].selected;
}
}),new objj_method(sel_getUid("setEnabled:forSegment:"),function(_48,_49,_4a,_4b){
with(_48){
_segments[_4b].enabled=_4a;
objj_msgSend(_48,"setNeedsLayout");
objj_msgSend(_48,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isEnabledForSegment:"),function(_4c,_4d,_4e){
with(_4c){
return _segments[_4e].enabled;
}
}),new objj_method(sel_getUid("setTag:forSegment:"),function(_4f,_50,_51,_52){
with(_4f){
_segments[_52].tag=_51;
}
}),new objj_method(sel_getUid("tagForSegment:"),function(_53,_54,_55){
with(_53){
return _segments[_55].tag;
}
}),new objj_method(sel_getUid("drawSegmentBezel:highlight:"),function(_56,_57,_58,_59){
with(_56){
if(_59){
_themeStates[_58]|=CPThemeStateHighlighted;
}else{
_themeStates[_58]&=~CPThemeStateHighlighted;
}
objj_msgSend(_56,"setNeedsLayout");
objj_msgSend(_56,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_leftOffsetForSegment:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemeAttribute:","bezel-inset");
if(_5c==0){
return _5d.left;
}
var _5e=objj_msgSend(_5a,"currentValueForThemeAttribute:","divider-thickness");
return objj_msgSend(_5a,"_leftOffsetForSegment:",_5c-1)+objj_msgSend(_5a,"widthForSegment:",_5c-1)+_5e;
}
}),new objj_method(sel_getUid("_indexOfLastSegment"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(_segments,"count")-1;
if(_61<0){
_61=0;
}
return _61;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_62,_63,_64){
with(_62){
var _65=objj_msgSend(_62,"currentValueForThemeAttribute:","default-height"),_66=objj_msgSend(_62,"currentValueForThemeAttribute:","content-inset"),_67=objj_msgSend(_62,"currentValueForThemeAttribute:","bezel-inset"),_68=objj_msgSend(_62,"bounds");
if(_64==="left-segment-bezel"){
return CGRectMake(_67.left,_67.top,_66.left,_65);
}else{
if(_64==="right-segment-bezel"){
var _69=objj_msgSend(_62,"_leftOffsetForSegment:",objj_msgSend(_62,"_indexOfLastSegment"));
return CPRectMake(_69+objj_msgSend(_62,"widthForSegment:",objj_msgSend(_62,"_indexOfLastSegment"))-_66.right,_67.top,_66.right,_65);
}else{
if(_64.substring(0,"segment-bezel".length)=="segment-bezel"){
var _6a=parseInt(_64.substring("segment-bezel-".length),10),_6b=CGRectCreateCopy(_segments[_6a].frame);
if(_6a==0){
_6b.origin.x+=_66.left;
_6b.size.width-=_66.left;
}
if(_6a==_segments.length-1){
_6b.size.width-=_66.right;
}
return _6b;
}else{
if(_64.substring(0,"divider-bezel".length)=="divider-bezel"){
var _6a=parseInt(_64.substring("divider-bezel-".length),10),_6c=objj_msgSend(_62,"widthForSegment:",_6a),_6d=objj_msgSend(_62,"_leftOffsetForSegment:",_6a),_6e=objj_msgSend(_62,"currentValueForThemeAttribute:","divider-thickness");
return CGRectMake(_6d+_6c,_67.top,_6e,_65);
}else{
if(_64.substring(0,"segment-content".length)=="segment-content"){
var _6a=parseInt(_64.substring("segment-content-".length),10);
return objj_msgSend(_62,"contentFrameForSegment:",_6a);
}
}
}
}
}
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_64);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6f,_70,_71){
with(_6f){
if(_71.substring(0,"segment-content".length)=="segment-content"){
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_72,_73){
with(_72){
if(_segments.length<=0){
return;
}
var _74=objj_msgSend(_72,"valueForThemeAttribute:inState:","left-segment-bezel-color",_themeStates[0]);
var _75=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","left-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_75,"setBackgroundColor:",_74);
var _76=objj_msgSend(_72,"valueForThemeAttribute:inState:","right-segment-bezel-color",_themeStates[_themeStates.length-1]);
var _77=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","right-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_77,"setBackgroundColor:",_76);
for(var i=0,_78=_themeStates.length;i<_78;i++){
var _79=_themeStates[i];
_79|=_themeState&CPThemeStateDisabled;
var _7a=objj_msgSend(_72,"valueForThemeAttribute:inState:","center-segment-bezel-color",_79);
var _7b=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_7b,"setBackgroundColor:",_7a);
var _7c=_segments[i];
var _7d=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-content-"+i,CPWindowAbove,"segment-bezel-"+i);
objj_msgSend(_7d,"setText:",_7c.label);
objj_msgSend(_7d,"setImage:",_7c.image);
objj_msgSend(_7d,"setFont:",objj_msgSend(_72,"valueForThemeAttribute:inState:","font",_79));
objj_msgSend(_7d,"setTextColor:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-color",_79));
objj_msgSend(_7d,"setAlignment:",objj_msgSend(_72,"valueForThemeAttribute:inState:","alignment",_79));
objj_msgSend(_7d,"setVerticalAlignment:",objj_msgSend(_72,"valueForThemeAttribute:inState:","vertical-alignment",_79));
objj_msgSend(_7d,"setLineBreakMode:",objj_msgSend(_72,"valueForThemeAttribute:inState:","line-break-mode",_79));
objj_msgSend(_7d,"setTextShadowColor:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-shadow-color",_79));
objj_msgSend(_7d,"setTextShadowOffset:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-shadow-offset",_79));
objj_msgSend(_7d,"setImageScaling:",objj_msgSend(_72,"valueForThemeAttribute:inState:","image-scaling",_79));
if(_7c.image&&_7c.label){
objj_msgSend(_7d,"setImagePosition:",objj_msgSend(_72,"valueForThemeAttribute:inState:","image-position",_79));
}else{
if(_7c.image){
objj_msgSend(_7d,"setImagePosition:",CPImageOnly);
}
}
if(i==_78-1){
continue;
}
var _7e=_themeStates[i]|_themeStates[i+1];
_7e=(_7e&CPThemeStateSelected&~CPThemeStateHighlighted)?CPThemeStateSelected:CPThemeStateNormal;
_7e|=_themeState&CPThemeStateDisabled;
var _7f=objj_msgSend(_72,"valueForThemeAttribute:inState:","divider-bezel-color",_7e);
var _80=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","divider-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_80,"setBackgroundColor:",_7f);
}
}
}),new objj_method(sel_getUid("drawSegment:highlight:"),function(_81,_82,_83,_84){
with(_81){
}
}),new objj_method(sel_getUid("tileWithChangedSegment:"),function(_85,_86,_87){
with(_85){
if(_87>=_segments.length){
return;
}
var _88=_segments[_87],_89=_88.width,_8a=_themeStates[_87]|(_themeState&CPThemeStateDisabled),_8b=objj_msgSend(_85,"valueForThemeAttribute:inState:","content-inset",_8a),_8c=objj_msgSend(_85,"valueForThemeAttribute:inState:","font",_8a);
if(!_89){
if(_88.image&&_88.label){
_89=objj_msgSend(_88.label,"sizeWithFont:",_8c).width+objj_msgSend(_88.image,"size").width+_8b.left+_8b.right;
}else{
if(_88.image){
_89=objj_msgSend(_88.image,"size").width+_8b.left+_8b.right;
}else{
if(_88.label){
_89=objj_msgSend(_88.label,"sizeWithFont:",_8c).width+_8b.left+_8b.right;
}else{
_89=0;
}
}
}
}
var _8d=_89-CGRectGetWidth(_88.frame);
if(!_8d){
return;
}
var _8e=objj_msgSend(_85,"frame");
objj_msgSend(_85,"setFrameSize:",CGSizeMake(CGRectGetWidth(_8e)+_8d,CGRectGetHeight(_8e)));
_88.width=_89;
_88.frame=objj_msgSend(_85,"frameForSegment:",_87);
var _8f=_87+1;
for(;_8f<_segments.length;++_8f){
_segments[_8f].frame.origin.x+=_8d;
objj_msgSend(_85,"drawSegmentBezel:highlight:",_8f,NO);
objj_msgSend(_85,"drawSegment:highlight:",_8f,NO);
}
objj_msgSend(_85,"drawSegmentBezel:highlight:",_87,NO);
objj_msgSend(_85,"drawSegment:highlight:",_87,NO);
objj_msgSend(_85,"setNeedsLayout");
objj_msgSend(_85,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("frameForSegment:"),function(_90,_91,_92){
with(_90){
return objj_msgSend(_90,"bezelFrameForSegment:",_92);
}
}),new objj_method(sel_getUid("bezelFrameForSegment:"),function(_93,_94,_95){
with(_93){
var _96=objj_msgSend(_93,"currentValueForThemeAttribute:","default-height"),_97=objj_msgSend(_93,"currentValueForThemeAttribute:","bezel-inset"),_98=objj_msgSend(_93,"widthForSegment:",_95),_99=objj_msgSend(_93,"_leftOffsetForSegment:",_95);
return CGRectMake(_99,_97.top,_98,_96);
}
}),new objj_method(sel_getUid("contentFrameForSegment:"),function(_9a,_9b,_9c){
with(_9a){
var _9d=objj_msgSend(_9a,"currentValueForThemeAttribute:","default-height"),_9e=objj_msgSend(_9a,"currentValueForThemeAttribute:","content-inset"),_9f=objj_msgSend(_9a,"widthForSegment:",_9c),_a0=objj_msgSend(_9a,"_leftOffsetForSegment:",_9c);
return CGRectMake(_a0+_9e.left,_9e.top,_9f-_9e.left-_9e.right,_9d-_9e.top-_9e.bottom);
}
}),new objj_method(sel_getUid("testSegment:"),function(_a1,_a2,_a3){
with(_a1){
var _a4=objj_msgSend(_a1,"convertPoint:fromView:",_a3,nil),_a5=_segments.length;
while(_a5--){
if(CGRectContainsPoint(_segments[_a5].frame,_a3)){
return _a5;
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_a6,_a7,_a8){
with(_a6){
if(!objj_msgSend(_a6,"isEnabled")){
return;
}
objj_msgSend(_a6,"trackSegment:",_a8);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_a9,_aa,_ab){
with(_a9){
}
}),new objj_method(sel_getUid("trackSegment:"),function(_ac,_ad,_ae){
with(_ac){
var _af=objj_msgSend(_ae,"type"),_b0=objj_msgSend(_ac,"convertPoint:fromView:",objj_msgSend(_ae,"locationInWindow"),nil);
if(_af==CPLeftMouseUp){
if(_trackingSegment==-1){
return;
}
if(CGRectContainsPoint(_segments[_trackingSegment].frame,_b0)){
if(_trackingMode==CPSegmentSwitchTrackingSelectAny){
objj_msgSend(_ac,"setSelected:forSegment:",!objj_msgSend(_ac,"isSelectedForSegment:",_trackingSegment),_trackingSegment);
_selectedSegment=_trackingSegment;
}else{
objj_msgSend(_ac,"setSelected:forSegment:",YES,_trackingSegment);
}
objj_msgSend(_ac,"sendAction:to:",objj_msgSend(_ac,"action"),objj_msgSend(_ac,"target"));
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
objj_msgSend(_ac,"setSelected:forSegment:",NO,_trackingSegment);
_selectedSegment=-1;
}
}
objj_msgSend(_ac,"drawSegmentBezel:highlight:",_trackingSegment,NO);
_trackingSegment=-1;
return;
}
if(_af==CPLeftMouseDown){
_trackingHighlighted=YES;
_trackingSegment=objj_msgSend(_ac,"testSegment:",_b0);
objj_msgSend(_ac,"drawSegmentBezel:highlight:",_trackingSegment,YES);
}else{
if(_af==CPLeftMouseDragged){
if(_trackingSegment==-1){
return;
}
var _b1=CGRectContainsPoint(_segments[_trackingSegment].frame,_b0);
if(_b1!=_trackingHighlighted){
_trackingHighlighted=_b1;
objj_msgSend(_ac,"drawSegmentBezel:highlight:",_trackingSegment,_trackingHighlighted);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_ac,sel_getUid("trackSegment:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFont:"),function(_b2,_b3,_b4){
with(_b2){
objj_msgSendSuper({receiver:_b2,super_class:objj_getClass("CPControl")},"setFont:",_b4);
objj_msgSend(_b2,"tileWithChangedSegment:",0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_b5,_b6){
with(_b5){
return "segmented-control";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_b7,_b8){
with(_b7){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPCenterTextAlignment,CPCenterVerticalTextAlignment,CPImageLeft,CPScaleNone,{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil,nil,nil,nil,1,24],["alignment","vertical-alignment","image-position","image-scaling","bezel-inset","content-inset","left-segment-bezel-color","right-segment-bezel-color","center-segment-bezel-color","divider-bezel-color","divider-thickness","default-height"]);
}
})]);
var _b9="CPSegmentedControlSegmentsKey",_ba="CPSegmentedControlSelectedKey",_bb="CPSegmentedControlSegmentStyleKey",_bc="CPSegmentedControlTrackingModeKey";
var _1=objj_getClass("CPSegmentedControl");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSegmentedControl\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_bd,_be,_bf){
with(_bd){
_bd=objj_msgSendSuper({receiver:_bd,super_class:objj_getClass("CPControl")},"initWithCoder:",_bf);
if(_bd){
var _c0=objj_msgSend(_bd,"frame"),_c1=_c0.size.width;
_c0.size.width=0;
objj_msgSend(_bd,"setFrame:",_c0);
_segments=objj_msgSend(_bf,"decodeObjectForKey:",_b9);
_segmentStyle=objj_msgSend(_bf,"decodeIntForKey:",_bb);
_themeStates=[];
if(objj_msgSend(_bf,"containsValueForKey:",_ba)){
_selectedSegment=objj_msgSend(_bf,"decodeIntForKey:",_ba);
}else{
_selectedSegment=-1;
}
if(objj_msgSend(_bf,"containsValueForKey:",_bc)){
_trackingMode=objj_msgSend(_bf,"decodeIntForKey:",_bc);
}else{
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
for(var i=0;i<_segments.length;i++){
_themeStates[i]=_segments[i].selected?CPThemeStateSelected:CPThemeStateNormal;
objj_msgSend(_bd,"tileWithChangedSegment:",i);
}
var _c2=MAX(_c1-objj_msgSend(_bd,"frame").size.width,0),_c3=FLOOR(_c2/_segments.length);
for(var i=0;i<_segments.length;i++){
objj_msgSend(_bd,"setWidth:forSegment:",_segments[i].width+_c3,i);
}
objj_msgSend(_bd,"tileWithChangedSegment:",0);
}
return _bd;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c4,_c5,_c6){
with(_c4){
objj_msgSendSuper({receiver:_c4,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_c6);
objj_msgSend(_c6,"encodeObject:forKey:",_segments,_b9);
objj_msgSend(_c6,"encodeInt:forKey:",_selectedSegment,_ba);
objj_msgSend(_c6,"encodeInt:forKey:",_segmentStyle,_bb);
objj_msgSend(_c6,"encodeInt:forKey:",_trackingMode,_bc);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPSegmentItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("label"),new objj_ivar("menu"),new objj_ivar("selected"),new objj_ivar("enabled"),new objj_ivar("tag"),new objj_ivar("width"),new objj_ivar("frame")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_c7,_c8){
with(_c7){
if(_c7=objj_msgSendSuper({receiver:_c7,super_class:objj_getClass("CPObject")},"init")){
image=nil;
label="";
menu=nil;
selected=NO;
enabled=NO;
tag=0;
width=0;
frame=CGRectMakeZero();
}
return _c7;
}
})]);
var _c9="CPSegmentItemImageKey",_ca="CPSegmentItemLabelKey",_cb="CPSegmentItemMenuKey",_cc="CPSegmentItemSelectedKey",_cd="CPSegmentItemEnabledKey",_ce="CPSegmentItemTagKey",_cf="CPSegmentItemWidthKey";
var _1=objj_getClass("_CPSegmentItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPSegmentItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d0,_d1,_d2){
with(_d0){
_d0=objj_msgSendSuper({receiver:_d0,super_class:objj_getClass("CPObject")},"init");
if(_d0){
image=objj_msgSend(_d2,"decodeObjectForKey:",_c9);
label=objj_msgSend(_d2,"decodeObjectForKey:",_ca);
menu=objj_msgSend(_d2,"decodeObjectForKey:",_cb);
selected=objj_msgSend(_d2,"decodeBoolForKey:",_cc);
enabled=objj_msgSend(_d2,"decodeBoolForKey:",_cd);
tag=objj_msgSend(_d2,"decodeIntForKey:",_ce);
width=objj_msgSend(_d2,"decodeFloatForKey:",_cf);
frame=CGRectMakeZero();
}
return _d0;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d3,_d4,_d5){
with(_d3){
objj_msgSend(_d5,"encodeObject:forKey:",image,_c9);
objj_msgSend(_d5,"encodeObject:forKey:",label,_ca);
objj_msgSend(_d5,"encodeObject:forKey:",menu,_cb);
objj_msgSend(_d5,"encodeBool:forKey:",selected,_cc);
objj_msgSend(_d5,"encodeBool:forKey:",enabled,_cd);
objj_msgSend(_d5,"encodeInt:forKey:",tag,_ce);
objj_msgSend(_d5,"encodeFloat:forKey:",width,_cf);
}
})]);
p;10;CPShadow.jI;21;Foundation/CPObject.jc;1307;
var _1=objj_allocateClassPair(CPObject,"CPShadow"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_offset"),new objj_ivar("_blurRadius"),new objj_ivar("_color"),new objj_ivar("_cssString")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_offset=_5;
_blurRadius=_6;
_color=_7;
_cssString=objj_msgSend(_color,"cssString")+" "+Math.round(_5.width)+"px "+Math.round(_5.height)+"px "+Math.round(_blurRadius)+"px";
}
return _3;
}
}),new objj_method(sel_getUid("shadowOffset"),function(_8,_9){
with(_8){
return _offset;
}
}),new objj_method(sel_getUid("shadowBlurRadius"),function(_a,_b){
with(_a){
return _blurRadius;
}
}),new objj_method(sel_getUid("shadowColor"),function(_c,_d){
with(_c){
return _color;
}
}),new objj_method(sel_getUid("cssString"),function(_e,_f){
with(_e){
return _cssString;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"),function(_10,_11,_12,_13,_14){
with(_10){
return objj_msgSend(objj_msgSend(CPShadow,"alloc"),"_initWithOffset:blurRadius:color:",_12,_13,_14);
}
})]);
p;14;CPShadowView.jI;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jc;5564;
CPLightShadow=0;
CPHeavyShadow=1;
var _1=nil,_2=nil;
var _3=3,_4=3,_5=3,_6=5,_7=7,_8=7,_9=5,_a=5;
var _b=objj_allocateClassPair(CPView,"CPShadowView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_weight")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"initWithFrame:",_f);
if(_d){
_weight=CPLightShadow;
objj_msgSend(_d,"setBackgroundColor:",_1);
objj_msgSend(_d,"setHitTests:",NO);
}
return _d;
}
}),new objj_method(sel_getUid("setWeight:"),function(_10,_11,_12){
with(_10){
if(_weight==_12){
return;
}
_weight=_12;
if(_weight==CPLightShadow){
objj_msgSend(_10,"setBackgroundColor:",_1);
}else{
objj_msgSend(_10,"setBackgroundColor:",_2);
}
}
}),new objj_method(sel_getUid("leftInset"),function(_13,_14){
with(_13){
return _weight==CPLightShadow?_3:_7;
}
}),new objj_method(sel_getUid("rightInset"),function(_15,_16){
with(_15){
return _weight==CPLightShadow?_4:_8;
}
}),new objj_method(sel_getUid("topInset"),function(_17,_18){
with(_17){
return _weight==CPLightShadow?_5:_9;
}
}),new objj_method(sel_getUid("bottomInset"),function(_19,_1a){
with(_19){
return _weight==CPLightShadow?_6:_a;
}
}),new objj_method(sel_getUid("horizontalInset"),function(_1b,_1c){
with(_1b){
if(_weight==CPLightShadow){
return _3+_4;
}
return _7+_8;
}
}),new objj_method(sel_getUid("verticalInset"),function(_1d,_1e){
with(_1d){
if(_weight==CPLightShadow){
return _5+_6;
}
return _9+_a;
}
}),new objj_method(sel_getUid("frameForContentFrame:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"class"),"frameForContentFrame:withWeight:",_21,_weight);
}
}),new objj_method(sel_getUid("setFrameForContentFrame:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_22,"setFrame:",objj_msgSend(_22,"frameForContentFrame:",_24));
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(_25,_26){
with(_25){
if(_25!=objj_msgSend(CPShadowView,"class")){
return;
}
var _27=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_25,"class"));
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTopLeft.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTop.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTopRight.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightLeft.png"),CGSizeMake(9,1)),nil,objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightRight.png"),CGSizeMake(9,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottomLeft.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottom.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottomRight.png"),CGSizeMake(9,9))]));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTopLeft.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTop.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTopRight.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyLeft.png"),CGSizeMake(17,1)),nil,objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyRight.png"),CGSizeMake(17,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottomLeft.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottom.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottomRight.png"),CGSizeMake(17,17))]));
}
}),new objj_method(sel_getUid("frameForContentFrame:withWeight:"),function(_28,_29,_2a,_2b){
with(_28){
if(_2b==CPLightShadow){
return CGRectMake((_2a.origin.x)-_3,(_2a.origin.y)-_5,(_2a.size.width)+_3+_4,(_2a.size.height)+_5+_6);
}else{
return CGRectMake((_2a.origin.x)-_7,(_2a.origin.y)-_9,(_2a.size.width)+_7+_8,(_2a.size.height)+_9+_a);
}
}
})]);
p;10;CPSlider.ji;11;CPControl.jc;11368;
CPLinearSlider=0;
CPCircularSlider=1;
var _1=objj_allocateClassPair(CPControl,"CPSlider"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_altIncrementValue"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_minValue=0;
_maxValue=100;
objj_msgSend(_3,"setObjectValue:",50);
objj_msgSend(_3,"setContinuous:",YES);
objj_msgSend(_3,"_recalculateIsVertical");
}
return _3;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_6,_7,_8){
with(_6){
if(_minValue===_8){
return;
}
_minValue=_8;
var _9=objj_msgSend(_6,"doubleValue");
if(_9<_minValue){
objj_msgSend(_6,"setDoubleValue:",_minValue);
}
objj_msgSend(_6,"setNeedsLayout");
objj_msgSend(_6,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("minValue"),function(_a,_b){
with(_a){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_c,_d,_e){
with(_c){
if(_maxValue===_e){
return;
}
_maxValue=_e;
var _f=objj_msgSend(_c,"doubleValue");
if(_f>_maxValue){
objj_msgSend(_c,"setDoubleValue:",_maxValue);
}
objj_msgSend(_c,"setNeedsLayout");
objj_msgSend(_c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("maxValue"),function(_10,_11){
with(_10){
return _maxValue;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",MIN(MAX(_14,_minValue),_maxValue));
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setSliderType:"),function(_15,_16,_17){
with(_15){
if(_17===CPCircularSlider){
objj_msgSend(_15,"setThemeState:",CPThemeStateCircular);
}else{
objj_msgSend(_15,"unsetThemeState:",CPThemeStateCircular);
}
}
}),new objj_method(sel_getUid("sliderType"),function(_18,_19){
with(_18){
return objj_msgSend(_18,"hasThemeState:",CPThemeStateCircular)?CPCircularSlider:CPLinearSlider;
}
}),new objj_method(sel_getUid("trackRectForBounds:"),function(_1a,_1b,_1c){
with(_1a){
if(objj_msgSend(_1a,"hasThemeState:",CPThemeStateCircular)){
var _1d=CGRectCreateCopy(_1c);
_1c.size.width=MIN(_1c.size.width,_1c.size.height);
_1c.size.height=_1c.size.width;
if(_1c.size.width<_1d.size.width){
_1c.origin.x+=(_1d.size.width-_1c.size.width)/2;
}else{
_1c.origin.y+=(_1d.size.height-_1c.size.height)/2;
}
}else{
var _1e=objj_msgSend(_1a,"currentValueForThemeAttribute:","track-width");
if(_1e<=0){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(objj_msgSend(_1a,"isVertical")){
_1c.origin.x=((_1c.size.width)-_1e)/2;
_1c.size.width=_1e;
}else{
_1c.origin.y=((_1c.size.height)-_1e)/2;
_1c.size.height=_1e;
}
}
return _1c;
}
}),new objj_method(sel_getUid("knobRectForBounds:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_1f,"currentValueForThemeAttribute:","knob-size");
if(_22.width<=0||_22.height<=0){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _23={origin:{x:0,y:0},size:{width:_22.width,height:_22.height}},_24=objj_msgSend(_1f,"trackRectForBounds:",_21);
if(!_24||(_24.size.width<=0||_24.size.height<=0)){
_24=_21;
}
if(objj_msgSend(_1f,"hasThemeState:",CPThemeStateCircular)){
var _25=3*PI_2-(1-objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue)*PI2,_26=CGRectGetWidth(_24)/2-8;
_23.origin.x=_26*COS(_25)+CGRectGetMidX(_24)-3;
_23.origin.y=_26*SIN(_25)+CGRectGetMidY(_24)-2;
}else{
if(objj_msgSend(_1f,"isVertical")){
_23.origin.x=(_24.origin.x+(_24.size.width)/2)-_22.width/2;
_23.origin.y=((objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue))*((_24.size.height)-_22.height);
}else{
_23.origin.x=((objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue))*((_24.size.width)-_22.width);
_23.origin.y=(_24.origin.y+(_24.size.height)/2)-_22.height/2;
}
}
return _23;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_27,_28,_29){
with(_27){
if(_29==="track-view"){
return objj_msgSend(_27,"trackRectForBounds:",objj_msgSend(_27,"bounds"));
}else{
if(_29==="knob-view"){
return objj_msgSend(_27,"knobRectForBounds:",objj_msgSend(_27,"bounds"));
}
}
return objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_29);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_2a,_2b,_2c){
with(_2a){
if(_2c==="track-view"||_2c==="knob-view"){
var _2d=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_2d,"setHitTests:",NO);
return _2d;
}
return objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_2c);
}
}),new objj_method(sel_getUid("setAltIncrementValue:"),function(_2e,_2f,_30){
with(_2e){
_altIncrementValue=_30;
}
}),new objj_method(sel_getUid("altIncrementValue"),function(_31,_32){
with(_31){
return _altIncrementValue;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_33,_34,_35){
with(_33){
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("CPControl")},"setFrameSize:",_35);
objj_msgSend(_33,"_recalculateIsVertical");
}
}),new objj_method(sel_getUid("_recalculateIsVertical"),function(_36,_37){
with(_36){
var _38=objj_msgSend(_36,"bounds"),_39=(_38.size.width),_3a=(_38.size.height);
_isVertical=_39<_3a?1:(_39>_3a?0:-1);
if(_isVertical===1){
objj_msgSend(_36,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("isVertical"),function(_3b,_3c){
with(_3b){
return _isVertical;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","track-view",CPWindowBelow,"knob-view");
if(_3f){
objj_msgSend(_3f,"setBackgroundColor:",objj_msgSend(_3d,"currentValueForThemeAttribute:","track-color"));
}
var _40=objj_msgSend(_3d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","knob-view",CPWindowAbove,"track-view");
if(_40){
objj_msgSend(_40,"setBackgroundColor:",objj_msgSend(_3d,"currentValueForThemeAttribute:","knob-color"));
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_41,_42){
with(_41){
return YES;
}
}),new objj_method(sel_getUid("_valueAtPoint:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"bounds"),_47=objj_msgSend(_43,"knobRectForBounds:",_46),_48=objj_msgSend(_43,"trackRectForBounds:",_46);
if(objj_msgSend(_43,"hasThemeState:",CPThemeStateCircular)){
var _49=(_47.size.width);
_48.origin.x+=_49/2;
_48.size.width-=_49;
var _4a=objj_msgSend(_43,"minValue"),dx=_45.x-(_48.origin.x+(_48.size.width)/2),dy=_45.y-(_48.origin.y+(_48.size.height)/2);
return MAX(0,MIN(1,1-(3*PI_2-ATAN2(dy,dx))%PI2/PI2))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}else{
if(objj_msgSend(_43,"isVertical")){
var _4b=(_47.size.height);
_48.origin.y+=_4b/2;
_48.size.height-=_4b;
var _4a=objj_msgSend(_43,"minValue");
return MAX(0,MIN(1,(_45.y-(_48.origin.y))/(_48.size.height)))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}else{
var _49=(_47.size.width);
_48.origin.x+=_49/2;
_48.size.width-=_49;
var _4a=objj_msgSend(_43,"minValue");
return MAX(0,MIN(1,(_45.x-(_48.origin.x))/(_48.size.width)))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}
}
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSend(_4c,"bounds"),_50=objj_msgSend(_4c,"knobRectForBounds:",{origin:{x:_4f.origin.x,y:_4f.origin.y},size:{width:_4f.size.width,height:_4f.size.height}});
if((_4e.x>=(_50.origin.x)&&_4e.y>=(_50.origin.y)&&_4e.x<(_50.origin.x+_50.size.width)&&_4e.y<(_50.origin.y+_50.size.height))){
_dragOffset={width:(_50.origin.x+(_50.size.width)/2)-_4e.x,height:(_50.origin.y+(_50.size.height)/2)-_4e.y};
}else{
var _51=objj_msgSend(_4c,"trackRectForBounds:",_4f);
if(_51&&(_4e.x>=(_51.origin.x)&&_4e.y>=(_51.origin.y)&&_4e.x<(_51.origin.x+_51.size.width)&&_4e.y<(_51.origin.y+_51.size.height))){
_dragOffset={width:0,height:0};
objj_msgSend(_4c,"setObjectValue:",objj_msgSend(_4c,"_valueAtPoint:",_4e));
}else{
return NO;
}
}
objj_msgSend(_4c,"setHighlighted:",YES);
objj_msgSend(_4c,"setNeedsLayout");
objj_msgSend(_4c,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_52,_53,_54,_55){
with(_52){
objj_msgSend(_52,"setObjectValue:",objj_msgSend(_52,"_valueAtPoint:",{x:_55.x+_dragOffset.width,y:_55.y+_dragOffset.height}));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_56,_57,_58,_59,_5a){
with(_56){
objj_msgSend(_56,"setHighlighted:",NO);
if(objj_msgSend(_target,"respondsToSelector:",sel_getUid("sliderDidFinish:"))){
objj_msgSend(_target,"sliderDidFinish:",_56);
}
objj_msgSend(_56,"setNeedsLayout");
objj_msgSend(_56,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setContinuous:"),function(_5b,_5c,_5d){
with(_5b){
if(_5d){
_sendActionOn|=CPLeftMouseDraggedMask;
}else{
_sendActionOn&=~CPLeftMouseDraggedMask;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_5e,_5f){
with(_5e){
return "slider";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_60,_61){
with(_60){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,{width:0,height:0},0,nil],["knob-color","knob-size","track-width","track-color"]);
}
})]);
var _62="CPSliderMinValueKey",_63="CPSliderMaxValueKey",_64="CPSliderAltIncrValueKey";
var _1=objj_getClass("CPSlider");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_65,_66,_67){
with(_65){
_minValue=objj_msgSend(_67,"decodeDoubleForKey:",_62);
_maxValue=objj_msgSend(_67,"decodeDoubleForKey:",_63);
_65=objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPControl")},"initWithCoder:",_67);
if(_65){
_altIncrementValue=objj_msgSend(_67,"decodeDoubleForKey:",_64);
objj_msgSend(_65,"setContinuous:",YES);
objj_msgSend(_65,"_recalculateIsVertical");
objj_msgSend(_65,"setNeedsLayout");
objj_msgSend(_65,"setNeedsDisplay:",YES);
}
return _65;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_68,_69,_6a){
with(_68){
objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_6a);
objj_msgSend(_6a,"encodeDouble:forKey:",_minValue,_62);
objj_msgSend(_6a,"encodeDouble:forKey:",_maxValue,_63);
objj_msgSend(_6a,"encodeDouble:forKey:",_altIncrementValue,_64);
}
})]);
var _1=objj_getClass("CPSlider");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("value"),function(_6b,_6c){
with(_6b){
CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
return objj_msgSend(_6b,"doubleValue");
}
}),new objj_method(sel_getUid("setValue:"),function(_6d,_6e,_6f){
with(_6d){
CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
objj_msgSend(_6d,"setObjectValue:",_6f);
}
})]);
p;21;CPSliderColorPicker.ji;15;CPColorPicker.jc;13716;
var _1=objj_allocateClassPair(CPColorPicker,"CPSliderColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_redSlider"),new objj_ivar("_greenSlider"),new objj_ivar("_blueSlider"),new objj_ivar("_hueSlider"),new objj_ivar("_saturationSlider"),new objj_ivar("_brightnessSlider"),new objj_ivar("_rgbLabel"),new objj_ivar("_hsbLabel"),new objj_ivar("_redLabel"),new objj_ivar("_greenLabel"),new objj_ivar("_blueLabel"),new objj_ivar("_hueLabel"),new objj_ivar("_saturationLabel"),new objj_ivar("_brightnessLabel"),new objj_ivar("_hexLabel"),new objj_ivar("_redValue"),new objj_ivar("_greenValue"),new objj_ivar("_blueValue"),new objj_ivar("_hueValue"),new objj_ivar("_saturationValue"),new objj_ivar("_brightnessValue"),new objj_ivar("_hexValue")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPColorPicker")},"initWithPickerMask:colorPanel:",_5,_6);
}
}),new objj_method(sel_getUid("initView"),function(_7,_8){
with(_7){
aFrame=CPRectMake(0,0,CPColorPickerViewWidth,CPColorPickerViewHeight);
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",aFrame);
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_rgbLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,10,100,20));
objj_msgSend(_rgbLabel,"setStringValue:","Red, Green, Blue");
objj_msgSend(_rgbLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_redLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,35,15,20));
objj_msgSend(_redLabel,"setStringValue:","R");
objj_msgSend(_redLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_redSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,35,aFrame.size.width-70,20));
objj_msgSend(_redSlider,"setMaxValue:",1);
objj_msgSend(_redSlider,"setMinValue:",0);
objj_msgSend(_redSlider,"setTarget:",_7);
objj_msgSend(_redSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_redSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _9=function(_a){
if(isNaN(this.value)){
return;
}
switch(this){
case _redValue:
objj_msgSend(_redSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _greenValue:
objj_msgSend(_greenSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _blueValue:
objj_msgSend(_blueSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _hueValue:
objj_msgSend(_hueSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),360),0));
break;
case _saturationValue:
objj_msgSend(_saturationSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),100),0));
break;
case _brightnessValue:
objj_msgSend(_brightnessSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),100),0));
break;
}
this.blur();
};
var _b=function(_c){
_c=_c||window.event;
if(_c.keyCode==13){
_9(_c);
if(_c.preventDefault){
_c.preventDefault();
}else{
if(_c.stopPropagation){
_c.stopPropagation();
}
}
}
};
var _d=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,35,45,20));
objj_msgSend(_d,"setAutoresizingMask:",CPViewMinXMargin);
_redValue=document.createElement("input");
_redValue.style.width="40px";
_redValue.style.backgroundColor="transparent";
_redValue.style.border="1px solid black";
_redValue.style.color="black";
_redValue.style.position="absolute";
_redValue.style.top="0px";
_redValue.style.left="0px";
_redValue.onchange=_9;
_d._DOMElement.appendChild(_redValue);
objj_msgSend(_contentView,"addSubview:",_d);
_greenLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,58,15,20));
objj_msgSend(_greenLabel,"setStringValue:","G");
objj_msgSend(_greenLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_greenSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,58,aFrame.size.width-70,20));
objj_msgSend(_greenSlider,"setMaxValue:",1);
objj_msgSend(_greenSlider,"setMinValue:",0);
objj_msgSend(_greenSlider,"setTarget:",_7);
objj_msgSend(_greenSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_greenSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,58,45,20));
objj_msgSend(_e,"setAutoresizingMask:",CPViewMinXMargin);
_greenValue=_redValue.cloneNode(false);
_greenValue.onchange=_9;
_e._DOMElement.appendChild(_greenValue);
objj_msgSend(_contentView,"addSubview:",_e);
_blueLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,81,15,20));
objj_msgSend(_blueLabel,"setStringValue:","B");
objj_msgSend(_blueLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_blueSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,81,aFrame.size.width-70,20));
objj_msgSend(_blueSlider,"setMaxValue:",1);
objj_msgSend(_blueSlider,"setMinValue:",0);
objj_msgSend(_blueSlider,"setTarget:",_7);
objj_msgSend(_blueSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_blueSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _f=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,81,45,20));
objj_msgSend(_f,"setAutoresizingMask:",CPViewMinXMargin);
_blueValue=_redValue.cloneNode(false);
_blueValue.onchange=_9;
_f._DOMElement.appendChild(_blueValue);
objj_msgSend(_contentView,"addSubview:",_f);
_hsbLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,120,190,20));
objj_msgSend(_hsbLabel,"setStringValue:","Hue, Saturation, Brightness");
objj_msgSend(_hsbLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_hueLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,145,15,20));
objj_msgSend(_hueLabel,"setStringValue:","H");
objj_msgSend(_hueLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_hueSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,145,aFrame.size.width-70,20));
objj_msgSend(_hueSlider,"setMaxValue:",359);
objj_msgSend(_hueSlider,"setMinValue:",0);
objj_msgSend(_hueSlider,"setTarget:",_7);
objj_msgSend(_hueSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_hueSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _10=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,145,45,20));
objj_msgSend(_10,"setAutoresizingMask:",CPViewMinXMargin);
_hueValue=_redValue.cloneNode(false);
_hueValue.onchange=_9;
_10._DOMElement.appendChild(_hueValue);
objj_msgSend(_contentView,"addSubview:",_10);
_saturationLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,168,15,20));
objj_msgSend(_saturationLabel,"setStringValue:","S");
objj_msgSend(_saturationLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_saturationSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,168,aFrame.size.width-70,20));
objj_msgSend(_saturationSlider,"setMaxValue:",100);
objj_msgSend(_saturationSlider,"setMinValue:",0);
objj_msgSend(_saturationSlider,"setTarget:",_7);
objj_msgSend(_saturationSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_saturationSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _11=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,168,45,20));
objj_msgSend(_11,"setAutoresizingMask:",CPViewMinXMargin);
_saturationValue=_redValue.cloneNode(false);
_saturationValue.onchange=_9;
_11._DOMElement.appendChild(_saturationValue);
objj_msgSend(_contentView,"addSubview:",_11);
_brightnessLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,191,15,20));
objj_msgSend(_brightnessLabel,"setStringValue:","B");
objj_msgSend(_brightnessLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,191,aFrame.size.width-70,20));
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setTarget:",_7);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _12=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,191,45,20));
objj_msgSend(_12,"setAutoresizingMask:",CPViewMinXMargin);
_brightnessValue=_redValue.cloneNode(false);
_brightnessValue.onchange=_9;
_12._DOMElement.appendChild(_brightnessValue);
objj_msgSend(_contentView,"addSubview:",_12);
_hexLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,230,30,20));
objj_msgSend(_hexLabel,"setStringValue:","Hex");
objj_msgSend(_hexLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_hexValue=_redValue.cloneNode(false);
_hexValue.style.top="228px";
_hexValue.style.width="80px";
_hexValue.style.left="35px";
_hexValue.onkeypress=function(_13){
_13=_13||window.event;
if(_13.keyCode==13){
var _14=objj_msgSend(CPColor,"colorWithHexString:",this.value);
if(_14){
objj_msgSend(_7,"setColor:",_14);
objj_msgSend(objj_msgSend(_7,"colorPanel"),"setColor:",_14);
}
if(_13.preventDefault){
_13.preventDefault();
}else{
if(_13.stopPropagation){
_13.stopPropagation();
}
}
this.blur();
}
};
_contentView._DOMElement.appendChild(_hexValue);
objj_msgSend(_contentView,"addSubview:",_rgbLabel);
objj_msgSend(_contentView,"addSubview:",_redLabel);
objj_msgSend(_contentView,"addSubview:",_greenLabel);
objj_msgSend(_contentView,"addSubview:",_blueLabel);
objj_msgSend(_contentView,"addSubview:",_redSlider);
objj_msgSend(_contentView,"addSubview:",_greenSlider);
objj_msgSend(_contentView,"addSubview:",_blueSlider);
objj_msgSend(_contentView,"addSubview:",_hsbLabel);
objj_msgSend(_contentView,"addSubview:",_hueLabel);
objj_msgSend(_contentView,"addSubview:",_saturationLabel);
objj_msgSend(_contentView,"addSubview:",_brightnessLabel);
objj_msgSend(_contentView,"addSubview:",_hueSlider);
objj_msgSend(_contentView,"addSubview:",_saturationSlider);
objj_msgSend(_contentView,"addSubview:",_brightnessSlider);
objj_msgSend(_contentView,"addSubview:",_hexLabel);
}
}),new objj_method(sel_getUid("provideNewView:"),function(_15,_16,_17){
with(_15){
if(_17){
objj_msgSend(_15,"initView");
}
return _contentView;
}
}),new objj_method(sel_getUid("currentMode"),function(_18,_19){
with(_18){
return CPSliderColorPickerMode;
}
}),new objj_method(sel_getUid("supportsMode:"),function(_1a,_1b,_1c){
with(_1a){
return (_1c==CPSliderColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("sliderChanged:"),function(_1d,_1e,_1f){
with(_1d){
var _20,_21=objj_msgSend(_1d,"colorPanel"),_22=objj_msgSend(_21,"opacity");
switch(_1f){
case _hueSlider:
case _saturationSlider:
case _brightnessSlider:
_20=objj_msgSend(CPColor,"colorWithHue:saturation:brightness:alpha:",objj_msgSend(_hueSlider,"floatValue"),objj_msgSend(_saturationSlider,"floatValue"),objj_msgSend(_brightnessSlider,"floatValue"),_22);
objj_msgSend(_1d,"updateRGBSliders:",_20);
break;
case _redSlider:
case _greenSlider:
case _blueSlider:
_20=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",objj_msgSend(_redSlider,"floatValue"),objj_msgSend(_greenSlider,"floatValue"),objj_msgSend(_blueSlider,"floatValue"),_22);
objj_msgSend(_1d,"updateHSBSliders:",_20);
break;
}
objj_msgSend(_1d,"updateLabels");
objj_msgSend(_1d,"updateHex:",_20);
objj_msgSend(_21,"setColor:",_20);
}
}),new objj_method(sel_getUid("setColor:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_23,"updateRGBSliders:",_25);
objj_msgSend(_23,"updateHSBSliders:",_25);
objj_msgSend(_23,"updateHex:",_25);
objj_msgSend(_23,"updateLabels");
}
}),new objj_method(sel_getUid("updateHSBSliders:"),function(_26,_27,_28){
with(_26){
var hsb=objj_msgSend(_28,"hsbComponents");
objj_msgSend(_hueSlider,"setFloatValue:",hsb[0]);
objj_msgSend(_saturationSlider,"setFloatValue:",hsb[1]);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
}
}),new objj_method(sel_getUid("updateHex:"),function(_29,_2a,_2b){
with(_29){
_hexValue.value=objj_msgSend(_2b,"hexString");
}
}),new objj_method(sel_getUid("updateRGBSliders:"),function(_2c,_2d,_2e){
with(_2c){
var rgb=objj_msgSend(_2e,"components");
objj_msgSend(_redSlider,"setFloatValue:",rgb[0]);
objj_msgSend(_greenSlider,"setFloatValue:",rgb[1]);
objj_msgSend(_blueSlider,"setFloatValue:",rgb[2]);
}
}),new objj_method(sel_getUid("updateLabels"),function(_2f,_30){
with(_2f){
_hueValue.value=ROUND(objj_msgSend(_hueSlider,"floatValue"));
_saturationValue.value=ROUND(objj_msgSend(_saturationSlider,"floatValue"));
_brightnessValue.value=ROUND(objj_msgSend(_brightnessSlider,"floatValue"));
_redValue.value=ROUND(objj_msgSend(_redSlider,"floatValue")*255);
_greenValue.value=ROUND(objj_msgSend(_greenSlider,"floatValue")*255);
_blueValue.value=ROUND(objj_msgSend(_blueSlider,"floatValue")*255);
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_31,_32){
with(_31){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","slider_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_33,_34){
with(_33){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","slider_button_h.png"),CGSizeMake(32,32));
}
})]);
p;13;CPSplitView.ji;9;CPImage.ji;8;CPView.jc;16313;
CPSplitViewDidResizeSubviewsNotification="CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification="CPSplitViewWillResizeSubviewsNotification";
var _1=nil,_2=nil;
var _3=objj_allocateClassPair(CPView,"CPSplitView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("_isVertical"),new objj_ivar("_isPaneSplitter"),new objj_ivar("_currentDivider"),new objj_ivar("_initialOffset"),new objj_ivar("_originComponent"),new objj_ivar("_sizeComponent"),new objj_ivar("_DOMDividerElements"),new objj_ivar("_dividerImagePath"),new objj_ivar("_drawingDivider"),new objj_ivar("_needsResizeSubviews")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPView")},"initWithFrame:",_7)){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
objj_msgSend(_5,"_setVertical:",YES);
}
return _5;
}
}),new objj_method(sel_getUid("dividerThickness"),function(_8,_9){
with(_8){
return _isPaneSplitter?1:10;
}
}),new objj_method(sel_getUid("isVertical"),function(_a,_b){
with(_a){
return _isVertical;
}
}),new objj_method(sel_getUid("setVertical:"),function(_c,_d,_e){
with(_c){
if(!objj_msgSend(_c,"_setVertical:",_e)){
return;
}
var _f=objj_msgSend(_c,"frame"),_10=objj_msgSend(_c,"dividerThickness");
objj_msgSend(_c,"_postNotificationWillResize");
var _11=ROUND((_f.size[_sizeComponent]-_10*(_subviews.length-1))/_subviews.length),_12=0,_13=_subviews.length;
if(objj_msgSend(_c,"isVertical")){
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(ROUND((_11+_10)*_12),0,_11,_f.size.height));
}
}else{
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(0,ROUND((_11+_10)*_12),_f.size.width,_11));
}
}
objj_msgSend(_c,"setNeedsDisplay:",YES);
objj_msgSend(_c,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("_setVertical:"),function(_14,_15,_16){
with(_14){
var _17=(_isVertical!=_16);
_isVertical=_16;
_originComponent=objj_msgSend(_14,"isVertical")?"x":"y";
_sizeComponent=objj_msgSend(_14,"isVertical")?"width":"height";
_dividerImagePath=objj_msgSend(_14,"isVertical")?objj_msgSend(_2,"filename"):objj_msgSend(_1,"filename");
return _17;
}
}),new objj_method(sel_getUid("isPaneSplitter"),function(_18,_19){
with(_18){
return _isPaneSplitter;
}
}),new objj_method(sel_getUid("setIsPaneSplitter:"),function(_1a,_1b,_1c){
with(_1a){
if(_isPaneSplitter==_1c){
return;
}
_isPaneSplitter=_1c;
objj_msgSend(_1a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_1d,_1e,_1f){
with(_1d){
_needsResizeSubviews=YES;
}
}),new objj_method(sel_getUid("isSubviewCollapsed:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_22,"frame").size[_sizeComponent]<1?YES:NO;
}
}),new objj_method(sel_getUid("rectOfDividerAtIndex:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_subviews[_25],"frame"),_27=CGRectMakeZero();
_27.size=objj_msgSend(_23,"frame").size;
_27.size[_sizeComponent]=objj_msgSend(_23,"dividerThickness");
_27.origin[_originComponent]=_26.origin[_originComponent]+_26.size[_sizeComponent];
return _27;
}
}),new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"rectOfDividerAtIndex:",_2a);
var _2c=2;
_2b.size[_sizeComponent]+=_2c*2;
_2b.origin[_originComponent]-=_2c;
return _2b;
}
}),new objj_method(sel_getUid("drawRect:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_subviews,"count")-1;
while((_30--)>0){
_drawingDivider=_30;
objj_msgSend(_2d,"drawDividerInRect:",objj_msgSend(_2d,"rectOfDividerAtIndex:",_30));
}
}
}),new objj_method(sel_getUid("drawDividerInRect:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_34,_35){
with(_34){
objj_msgSend(_34,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_36,_37){
with(_36){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
var _38=objj_msgSend(_36,"subviews"),_39=_38.length,_3a=CGSizeMakeZero();
if(objj_msgSend(_36,"isVertical")){
_3a.width+=objj_msgSend(_36,"dividerThickness")*(_39-1);
_3a.height=CGRectGetHeight(objj_msgSend(_36,"frame"));
}else{
_3a.width=CGRectGetWidth(objj_msgSend(_36,"frame"));
_3a.height+=objj_msgSend(_36,"dividerThickness")*(_39-1);
}
while(_39--){
_3a[_sizeComponent]+=objj_msgSend(_38[_39],"frame").size[_sizeComponent];
}
objj_msgSend(_36,"resizeSubviewsWithOldSize:",_3a);
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f=objj_msgSend(_subviews[_3e],"frame"),_40=_3f.origin[_originComponent]+_3f.size[_sizeComponent],_41=objj_msgSend(_3b,"effectiveRectOfDividerAtIndex:",_3e),_42=null;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_41=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_3b,_41,_41,_3e);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_42=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_3b,_3e);
}
return CGRectContainsPoint(_41,_3d)||(_42&&CGRectContainsPoint(_42,_3d));
}
}),new objj_method(sel_getUid("hitTest:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_43,"isHidden")||!objj_msgSend(_43,"hitTests")||!CGRectContainsPoint(objj_msgSend(_43,"frame"),_45)){
return nil;
}
var _46=objj_msgSend(_43,"convertPoint:fromView:",_45,objj_msgSend(_43,"superview"));
var _47=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_47;i++){
if(objj_msgSend(_43,"cursorAtPoint:hitDividerAtIndex:",_46,i)){
return _43;
}
}
return objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPView")},"hitTest:",_45);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_48,_49,_4a){
with(_48){
var _4b=objj_msgSend(_4a,"type");
if(_4b==CPLeftMouseUp){
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_48,"_postNotificationDidResize");
}
return;
}
if(_4b==CPLeftMouseDown){
var _4c=objj_msgSend(_48,"convertPoint:fromView:",objj_msgSend(_4a,"locationInWindow"),nil);
_currentDivider=CPNotFound;
var _4d=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_4d;i++){
var _4e=objj_msgSend(_subviews[i],"frame"),_4f=_4e.origin[_originComponent]+_4e.size[_sizeComponent];
if(objj_msgSend(_48,"cursorAtPoint:hitDividerAtIndex:",_4c,i)){
if(objj_msgSend(_4a,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _50=objj_msgSend(_48,"minPossiblePositionOfDividerAtIndex:",i),_51=objj_msgSend(_48,"maxPossiblePositionOfDividerAtIndex:",i);
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_48,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_48,_subviews[i],i)){
if(objj_msgSend(_48,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_48,"setPosition:ofDividerAtIndex:",(_50+(_51-_50)/2),i);
}else{
objj_msgSend(_48,"setPosition:ofDividerAtIndex:",_50,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_48,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_48,_subviews[i+1],i)){
if(objj_msgSend(_48,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_48,"setPosition:ofDividerAtIndex:",(_50+(_51-_50)/2),i);
}else{
objj_msgSend(_48,"setPosition:ofDividerAtIndex:",_51,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_4f-_4c[_originComponent];
objj_msgSend(_48,"_postNotificationWillResize");
}
}
}
if(_currentDivider===CPNotFound){
return;
}
}else{
if(_4b==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _4c=objj_msgSend(_48,"convertPoint:fromView:",objj_msgSend(_4a,"locationInWindow"),nil);
objj_msgSend(_48,"setPosition:ofDividerAtIndex:",(_4c[_originComponent]+_initialOffset),_currentDivider);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_48,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"trackDivider:",_54);
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(_subviews[_57+1],"frame");
if(_57+1<objj_msgSend(_subviews,"count")-1){
return _58.origin[_originComponent]+_58.size[_sizeComponent]-objj_msgSend(_55,"dividerThickness");
}else{
return objj_msgSend(_55,"frame").size[_sizeComponent]-objj_msgSend(_55,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_59,_5a,_5b){
with(_59){
if(_5b>0){
var _5c=objj_msgSend(_subviews[_5b-1],"frame");
return _5c.origin[_originComponent]+_5c.size[_sizeComponent]+objj_msgSend(_59,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_5d,_5e,_5f,_60){
with(_5d){
objj_msgSend(_5d,"_adjustSubviewsWithCalculatedSize");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
_5f=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_5d,_5f,_60);
}
var _61=objj_msgSend(_5d,"maxPossiblePositionOfDividerAtIndex:",_60),_62=objj_msgSend(_5d,"minPossiblePositionOfDividerAtIndex:",_60),_63=_61,_64=_62;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
_64=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_5d,_62,_60);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
_63=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_5d,_61,_60);
}
var _65=objj_msgSend(_5d,"frame"),_66=_subviews[_60],_67=objj_msgSend(_66,"frame"),_68=_subviews[_60+1],_69=objj_msgSend(_68,"frame");
var _6a=MAX(MIN(_5f,_63),_64);
if(_5f<_62+(_64-_62)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_5d,_66)){
_6a=_62;
}
}
}
_67.size[_sizeComponent]=_6a-_67.origin[_originComponent];
objj_msgSend(_subviews[_60],"setFrame:",_67);
_69.size[_sizeComponent]=_69.origin[_originComponent]+_69.size[_sizeComponent]-_6a-objj_msgSend(_5d,"dividerThickness");
_69.origin[_originComponent]=_6a+objj_msgSend(_5d,"dividerThickness");
objj_msgSend(_subviews[_60+1],"setFrame:",_69);
objj_msgSend(_5d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6b,_6c,_6d){
with(_6b){
objj_msgSend(_6b,"_adjustSubviewsWithCalculatedSize");
objj_msgSendSuper({receiver:_6b,super_class:objj_getClass("CPView")},"setFrameSize:",_6d);
objj_msgSend(_6b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6e,_6f,_70){
with(_6e){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_6e,_70);
return;
}
objj_msgSend(_6e,"_postNotificationWillResize");
var _71=0,_72=objj_msgSend(_subviews,"count"),_73=objj_msgSend(_6e,"bounds"),_74=objj_msgSend(_6e,"dividerThickness"),_75=_72-1,_76=0,_77=0,_78=-1,_79=0,_7a=objj_msgSend(_6e,"isVertical");
for(_71=0;_71<_72;++_71){
var _7b=_subviews[_71],_7c=_7a?objj_msgSend(_7b,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7b,"autoresizingMask")&CPViewHeightSizable;
if(_7c){
_76+=objj_msgSend(_7b,"frame").size[_sizeComponent];
_78=_71;
_79++;
}
}
if(_79===_72){
_76=0;
}
var _77=_76?_73.size[_sizeComponent]-_76:0,_7d=_73.size[_sizeComponent]-_70[_sizeComponent],_7e=(_70[_sizeComponent]-_75*_74-_77),_7f=_7e<=0?0:(_73.size[_sizeComponent]-_75*_74-_77)/_7e;
for(_71=0;_71<_72;++_71){
var _7b=_subviews[_71],_80=CGRectMakeCopy(_73),_7c=_7a?objj_msgSend(_7b,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7b,"autoresizingMask")&CPViewHeightSizable;
if(_71+1==_72){
_80.size[_sizeComponent]=_73.size[_sizeComponent]-_80.origin[_originComponent];
}else{
if(_76&&_7c&&_78===_71){
_80.size[_sizeComponent]=MAX(0,ROUND(objj_msgSend(_7b,"frame").size[_sizeComponent]+_7d));
}else{
if(_7c||!_76){
_80.size[_sizeComponent]=MAX(0,ROUND(_7f*objj_msgSend(_7b,"frame").size[_sizeComponent]));
_7d-=(_80.size[_sizeComponent]-objj_msgSend(_7b,"frame").size[_sizeComponent]);
}else{
if(_76&&!_7c){
_80.size[_sizeComponent]=objj_msgSend(_7b,"frame").size[_sizeComponent];
}else{
alert("SHOULD NEVER GET HERE");
}
}
}
}
_73.origin[_originComponent]+=_80.size[_sizeComponent]+_74;
objj_msgSend(_7b,"setFrame:",_80);
}
objj_msgSend(_6e,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_81,_82,_83){
with(_81){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_81);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_81);
}
_delegate=_83;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_81);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_81);
}
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_84,_85){
with(_84){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewWillResizeSubviewsNotification,_84);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_86,_87){
with(_86){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewDidResizeSubviewsNotification,_86);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_88,_89){
with(_88){
if(_88!=objj_msgSend(CPSplitView,"class")){
return;
}
var _8a=objj_msgSend(CPBundle,"bundleForClass:",_88);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8a,"pathForResource:","CPSplitView/CPSplitViewHorizontal.png"),CPSizeMake(5,10));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8a,"pathForResource:","CPSplitView/CPSplitViewVertical.png"),CPSizeMake(10,5));
}
})]);
var _8b="CPSplitViewDelegateKey",_8c="CPSplitViewIsVerticalKey",_8d="CPSplitViewIsPaneSplitterKey";
var _3=objj_getClass("CPSplitView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSplitView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_8e,_8f,_90){
with(_8e){
_8e=objj_msgSendSuper({receiver:_8e,super_class:objj_getClass("CPView")},"initWithCoder:",_90);
if(_8e){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
_delegate=objj_msgSend(_90,"decodeObjectForKey:",_8b);
_isPaneSplitter=objj_msgSend(_90,"decodeBoolForKey:",_8d);
objj_msgSend(_8e,"_setVertical:",objj_msgSend(_90,"decodeBoolForKey:",_8c));
}
return _8e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_91,_92,_93){
with(_91){
objj_msgSendSuper({receiver:_91,super_class:objj_getClass("CPView")},"encodeWithCoder:",_93);
objj_msgSend(_93,"encodeConditionalObject:forKey:",_delegate,_8b);
objj_msgSend(_93,"encodeBool:forKey:",_isVertical,_8c);
objj_msgSend(_93,"encodeBool:forKey:",_isPaneSplitter,_8d);
}
})]);
p;17;CPStringDrawing.jI;21;Foundation/CPString.ji;18;CPPlatformString.jc;601;
var _1=objj_getClass("CPString");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("cssString"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("sizeWithFont:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"sizeWithFont:inWidth:",_7,NULL);
}
}),new objj_method(sel_getUid("sizeWithFont:inWidth:"),function(_8,_9,_a,_b){
with(_8){
return objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",_8,_a,_b);
}
})]);
p;15;CPTableColumn.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;8673;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"CPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tableView"),new objj_ivar("_headerView"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_identifier"),new objj_ivar("_isEditable"),new objj_ivar("_sortDescriptorPrototype"),new objj_ivar("_isHidden"),new objj_ivar("_headerToolTip")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_dataViewData={};
_width=100;
_minWidth=10;
_maxWidth=1000000;
objj_msgSend(_5,"setIdentifier:",_7);
objj_msgSend(_5,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_5,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _5;
}
}),new objj_method(sel_getUid("setTableView:"),function(_8,_9,_a){
with(_8){
_tableView=_a;
}
}),new objj_method(sel_getUid("tableView"),function(_b,_c){
with(_b){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_d,_e,_f){
with(_d){
_f=+_f;
if(_width===_f){
return;
}
var _10=MIN(MAX(_f,objj_msgSend(_d,"minWidth")),objj_msgSend(_d,"maxWidth"));
if(_width===_10){
return;
}
var _11=_width;
_width=_10;
var _12=objj_msgSend(_d,"tableView");
if(_12){
var _13=objj_msgSend(objj_msgSend(_12,"tableColumns"),"indexOfObjectIdenticalTo:",_d);
_12._reloadAllRows=YES;
_12._dirtyTableColumnRangeIndex=_12._dirtyTableColumnRangeIndex<0?_13:MIN(_13,_12._dirtyTableColumnRangeIndex);
objj_msgSend(_12,"tile");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewColumnDidResizeNotification,_12,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_d,_11],["CPTableColumn","CPOldWidth"]));
}
}
}),new objj_method(sel_getUid("width"),function(_14,_15){
with(_14){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_16,_17,_18){
with(_16){
_18=+_18;
if(_minWidth===_18){
return;
}
_minWidth=_18;
var _19=objj_msgSend(_16,"width"),_1a=MAX(_19,objj_msgSend(_16,"minWidth"));
if(_19!==_1a){
objj_msgSend(_16,"setWidth:",_1a);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_1b,_1c){
with(_1b){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1d,_1e,_1f){
with(_1d){
_1f=+_1f;
if(_maxWidth===_1f){
return;
}
_maxWidth=_1f;
var _20=objj_msgSend(_1d,"width"),_21=MAX(_20,objj_msgSend(_1d,"maxWidth"));
if(_20!==_21){
objj_msgSend(_1d,"setWidth:",_21);
}
}
}),new objj_method(sel_getUid("maxWidth"),function(_22,_23){
with(_22){
return _maxWidth;
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_24,_25,_26){
with(_24){
_resizingMask=_26;
}
}),new objj_method(sel_getUid("resizingMask"),function(_27,_28){
with(_27){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_29,_2a){
with(_29){
var _2b=_CGRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_2b<objj_msgSend(_29,"minWidth")){
objj_msgSend(_29,"setMinWidth:",_2b);
}else{
if(_2b>objj_msgSend(_29,"maxWidth")){
objj_msgSend(_29,"setMaxWidth:",_2b);
}
}
if(_width!==_2b){
objj_msgSend(_29,"setWidth:",_2b);
}
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_2c,_2d,_2e){
with(_2c){
if(!_2e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Attempt to set nil header view on "+objj_msgSend(_2c,"description"));
}
_headerView=_2e;
var _2f=objj_msgSend(_tableView,"headerView");
objj_msgSend(_2f,"setNeedsLayout");
objj_msgSend(_2f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("headerView"),function(_30,_31){
with(_30){
return _headerView;
}
}),new objj_method(sel_getUid("setDataView:"),function(_32,_33,_34){
with(_32){
if(_dataView===_34){
return;
}
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_34;
_dataViewData[objj_msgSend(_34,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_34);
}
}),new objj_method(sel_getUid("dataView"),function(_35,_36){
with(_35){
return _dataView;
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_37,_38,_39){
with(_37){
return objj_msgSend(_37,"dataView");
}
}),new objj_method(sel_getUid("_newDataViewForRow:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"dataViewForRow:",_3c),_3e=objj_msgSend(_3d,"UID");
var x=objj_msgSend(_3a,"tableView")._cachedDataViews[_3e];
if(x&&x.length){
return x.pop();
}
if(!_dataViewData[_3e]){
_dataViewData[_3e]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_3d);
}
var _3f=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_3e]);
_3f.identifier=_3e;
return _3f;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_40,_41,_42){
with(_40){
_identifier=_42;
}
}),new objj_method(sel_getUid("identifier"),function(_43,_44){
with(_43){
return _identifier;
}
}),new objj_method(sel_getUid("setEditable:"),function(_45,_46,_47){
with(_45){
_isEditable=_47;
}
}),new objj_method(sel_getUid("isEditable"),function(_48,_49){
with(_48){
return _isEditable;
}
}),new objj_method(sel_getUid("setSortDescriptorPrototype:"),function(_4a,_4b,_4c){
with(_4a){
_sortDescriptorPrototype=_4c;
}
}),new objj_method(sel_getUid("sortDescriptorPrototype"),function(_4d,_4e){
with(_4d){
return _sortDescriptorPrototype;
}
}),new objj_method(sel_getUid("setHidden:"),function(_4f,_50,_51){
with(_4f){
_isHidden=_51;
}
}),new objj_method(sel_getUid("isHidden"),function(_52,_53){
with(_52){
return _isHidden;
}
}),new objj_method(sel_getUid("setHeaderToolTip:"),function(_54,_55,_56){
with(_54){
_headerToolTip=_56;
}
}),new objj_method(sel_getUid("headerToolTip"),function(_57,_58){
with(_57){
return _headerToolTip;
}
})]);
var _59="CPTableColumnIdentifierKey",_5a="CPTableColumnHeaderViewKey",_5b="CPTableColumnDataViewKey",_5c="CPTableColumnWidthKey",_5d="CPTableColumnMinWidthKey",_5e="CPTableColumnMaxWidthKey",_5f="CPTableColumnResizingMaskKey";
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_60,_61,_62){
with(_60){
_60=objj_msgSendSuper({receiver:_60,super_class:objj_getClass("CPObject")},"init");
if(_60){
_dataViewData={};
_width=objj_msgSend(_62,"decodeFloatForKey:",_5c);
_minWidth=objj_msgSend(_62,"decodeFloatForKey:",_5d);
_maxWidth=objj_msgSend(_62,"decodeFloatForKey:",_5e);
objj_msgSend(_60,"setIdentifier:",objj_msgSend(_62,"decodeObjectForKey:",_59));
objj_msgSend(_60,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_60,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _60;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_65,"encodeObject:forKey:",_identifier,_59);
objj_msgSend(_65,"encodeObject:forKey:",_width,_5c);
objj_msgSend(_65,"encodeObject:forKey:",_minWidth,_5d);
objj_msgSend(_65,"encodeObject:forKey:",_maxWidth,_5e);
}
})]);
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setHeaderCell:"),function(_66,_67,_68){
with(_66){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("headerCell"),function(_69,_6a){
with(_69){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"headCell is not supported. -headerView instead.");
}
}),new objj_method(sel_getUid("setDataCell:"),function(_6b,_6c,_6d){
with(_6b){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("dataCell"),function(_6e,_6f){
with(_6e){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCell is not supported. Use -dataCell instead.");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_70,_71,row){
with(_70){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
})]);
p;19;CPTableHeaderView.ji;15;CPTableColumn.ji;13;CPTableView.ji;8;CPView.jc;3366;
var _1=objj_allocateClassPair(CPView,"CPTableHeaderView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_resizedColumn"),new objj_ivar("_draggedColumn"),new objj_ivar("_draggedDistance"),new objj_ivar("_tableView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("resizedColumn"),function(_3,_4){
with(_3){
return _resizedColumn;
}
}),new objj_method(sel_getUid("draggedColumn"),function(_5,_6){
with(_5){
return _draggedColumn;
}
}),new objj_method(sel_getUid("draggedDistance"),function(_7,_8){
with(_7){
return _draggedDistance;
}
}),new objj_method(sel_getUid("tableView"),function(_9,_a){
with(_9){
return _tableView;
}
}),new objj_method(sel_getUid("setTableView:"),function(_b,_c,_d){
with(_b){
_tableView=_d;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"initWithFrame:",_10);
if(_e){
_resizedColumn=CPNotFound;
_draggedColumn=CPNotFound;
_draggedDistance=0;
}
return _e;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_11,_12,_13){
with(_11){
if(!CGRectContainsPoint(objj_msgSend(_11,"bounds"),_13)){
return CPNotFound;
}
var _14=0,_15=objj_msgSend(objj_msgSend(_tableView,"tableColumns"),"count"),_16=objj_msgSend(_tableView,"intercellSpacing"),_17=objj_msgSend(_tableView,"tableColumns"),_18=0,_19=_13.x;
for(;_14<_15;_14++){
var _1a=objj_msgSend(_17[_14],"width")+_16.width;
if(_19>=_18&&_19<_18+_1a){
return _14;
}
_18+=_1a;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("headerRectOfColumn:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(_tableView,"tableColumns"),_1f=objj_msgSend(_tableView,"intercellSpacing"),_20=objj_msgSend(_1b,"bounds");
if(_1d<0||_1d>objj_msgSend(_1e,"count")){
objj_msgSend(CPException,"raise:reason:","invalid","tried to get headerRectOfColumn: on invalid column");
}
_20.size.width=objj_msgSend(_1e[_1d],"width")+_1f.width;
while(--_1d>=0){
_20.origin.x+=objj_msgSend(_1e[_1d],"width")+_1f.width;
}
return _20;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_21,_22){
with(_21){
var _23=objj_msgSend(_tableView,"tableColumns"),_24=objj_msgSend(_23,"count"),_25=objj_msgSend(_21,"bounds"),_26=objj_msgSend(_tableView,"intercellSpacing");
for(i=0;i<_24;++i){
var _27=objj_msgSend(_23,"objectAtIndex:",i),_28=objj_msgSend(_27,"headerView");
_25.size.width=objj_msgSend(_27,"width")+_26.width;
objj_msgSend(_28,"setFrame:",_25);
_25.origin.x+=objj_msgSend(_27,"width")+_26.width;
objj_msgSend(_21,"addSubview:",_28);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(objj_msgSend(_tableView,"gridColor"),"setStroke");
var _2c=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_2d=_2d=objj_msgSend(_tableView,"columnIndexesInRect:",_2b),_2e=[];
objj_msgSend(_2d,"getIndexes:maxCount:inIndexRange:",_2e,-1,nil);
var _2f=0,_30=_2e.length;
for(;_2f<_30;++_2f){
var _31=objj_msgSend(_29,"headerRectOfColumn:",_2f);
CGContextBeginPath(_2c);
CGContextMoveToPoint(_2c,ROUND(_31.origin.x+_31.size.width)-0.5,ROUND(_31.origin.y)-0.5);
CGContextAddLineToPoint(_2c,ROUND(_31.origin.x+_31.size.width)-0.5,ROUND(_31.origin.y+_31.size.height)-0.5);
CGContextSetLineWidth(_2c,1);
CGContextStrokePath(_2c);
}
}
})]);
p;13;CPTableView.jI;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;44232;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
CPTableViewSelectionHighlightStyleRegular=0;
CPTableViewSelectionHighlightStyleSourceList=1;
CPTableViewGridNone=0;
CPTableViewSolidVerticalGridLineMask=1<<0;
CPTableViewSolidHorizontalGridLineMask=1<<1;
var _1b=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithTableView:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPView")},"init");
if(_1d){
_tableView=_1f;
}
return _1d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"frame"),_24=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_24,-(_23.origin.x),-(_23.origin.y));
objj_msgSend(_tableView,"_drawRect:",_22);
}
})]);
var _1b=objj_allocateClassPair(CPControl,"CPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_reloadAllRows"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_alternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_gridStyleMask"),new objj_ivar("_gridColor"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_tableDrawView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPControl")},"initWithFrame:",_27);
if(_25){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(_25,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_25,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_intercellSpacing={width:0,height:0};
_rowHeight=19;
objj_msgSend(_25,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_25,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_25,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_25);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_25);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_25,"addSubview:",_tableDrawView);
}
return _25;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_28,_29,_2a){
with(_28){
if(_dataSource===_2a){
return;
}
_dataSource=_2a;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_5;
}
objj_msgSend(_28,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2b,_2c){
with(_2b){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"),function(_2d,_2e,_2f,_30){
with(_2d){
objj_msgSend(_2d,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_31,_32){
with(_31){
if(!_dataSource){
return;
}
_reloadAllRows=YES;
_objectValues={};
objj_msgSend(_31,"noteNumberOfRowsChanged");
objj_msgSend(_31,"setNeedsLayout");
objj_msgSend(_31,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_33,_34,_35){
with(_33){
_doubleAction=_35;
}
}),new objj_method(sel_getUid("doubleAction"),function(_36,_37){
with(_36){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_38,_39,_3a){
with(_38){
_allowsColumnReordering=!!_3a;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_3b,_3c){
with(_3b){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_3d,_3e,_3f){
with(_3d){
_allowsColumnResizing=!!_3f;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_40,_41){
with(_40){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_42,_43,_44){
with(_42){
_allowsMultipleSelection=!!_44;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_45,_46){
with(_45){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_47,_48,_49){
with(_47){
_allowsEmptySelection=!!_49;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_4a,_4b){
with(_4a){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_4c,_4d,_4e){
with(_4c){
_allowsColumnSelection=!!_4e;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_4f,_50){
with(_4f){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_51,_52,_53){
with(_51){
if((_intercellSpacing.width==_53.width&&_intercellSpacing.height==_53.height)){
return;
}
_intercellSpacing={width:_53.width,height:_53.height};
objj_msgSend(_51,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_54,_55,_56){
with(_54){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_57,_58){
with(_57){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_59,_5a,_5b){
with(_59){
_5b=+_5b;
if(_rowHeight===_5b){
return;
}
_rowHeight=MAX(0,_5b);
objj_msgSend(_59,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_5c,_5d){
with(_5c){
return _rowHeight;
}
}),new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"),function(_5e,_5f,_60){
with(_5e){
_usesAlternatingRowBackgroundColors=_60;
}
}),new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"),function(_61,_62){
with(_61){
return _usesAlternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_alternatingRowBackgroundColors,"isEqual:",_65)){
return;
}
_alternatingRowBackgroundColors=_65;
objj_msgSend(_63,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternatingRowBackgroundColors"),function(_66,_67){
with(_66){
return _alternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("selectionHighlightStyle"),function(_68,_69){
with(_68){
return _selectionHighlightMask;
}
}),new objj_method(sel_getUid("setSelectionHighlightStyle:"),function(_6a,_6b,_6c){
with(_6a){
_selectionHighlightMask=_6c;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_6d,_6e,_6f){
with(_6d){
if(_gridColor===_6f){
return;
}
_gridColor=_6f;
objj_msgSend(_6d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridColor"),function(_70,_71){
with(_70){
return _gridColor;
}
}),new objj_method(sel_getUid("setGridStyleMask:"),function(_72,_73,_74){
with(_72){
if(_gridStyleMask===_74){
return;
}
_gridStyleMask=_74;
objj_msgSend(_72,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridStyleMask"),function(_75,_76){
with(_75){
return _gridStyleMask;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_tableColumns,"addObject:",_79);
objj_msgSend(_79,"setTableView:",_77);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_77,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_7a,_7b,_7c){
with(_7a){
if(objj_msgSend(_7c,"tableView")!==_7a){
return;
}
var _7d=objj_msgSend(_tableColumns,"indexOfObjectIdenticalTo:",_7c);
if(_7d===CPNotFound){
return;
}
objj_msgSend(_7c,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_7d);
var _7e=objj_msgSend(_7c,"UID");
if(_objectValues[_7e]){
_objectValues[_7e]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_7d;
}else{
_dirtyTableColumnRangeIndex=MIN(_7d,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_7a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_7f,_80,_81,_82){
with(_7f){
_81=+_81;
_82=+_82;
if(_81===_82){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_81,_82);
}else{
_dirtyTableColumnRangeIndex=MIN(_81,_82,_dirtyTableColumnRangeIndex);
}
if(_82>_81){
--_82;
}
var _83=_tableColumns[_81];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_81);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_83,_82);
objj_msgSend(_7f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_84,_85){
with(_84){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_86,_87,_88){
with(_86){
var _89=0,_8a=(_tableColumns.length);
for(;_89<_8a;++_89){
if(objj_msgSend(_tableColumns[_89],"identifier")===_88){
return _89;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(_8b,"columnWithIdentifier:",_8d);
if(_8e===CPNotFound){
return nil;
}
return _tableColumns[_8e];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_8f,_90,_91,_92){
with(_8f){
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_92){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_91);
}else{
_selectedColumnIndexes=objj_msgSend(_91,"copy");
}
objj_msgSend(_8f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_93,_94,_95,_96){
with(_93){
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_96){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_95);
}else{
_selectedRowIndexes=objj_msgSend(_95,"copy");
}
objj_msgSend(_93,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_97,_98){
with(_97){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_99,_9a){
with(_99){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_9d);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_a0);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_a3,_a4){
with(_a3){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_a5,_a6,_a7){
with(_a5){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_a7);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_a8,_a9,_aa){
with(_a8){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_aa);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_ab,_ac){
with(_ab){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_ad,_ae){
with(_ad){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_ad);
}
}),new objj_method(sel_getUid("cornerView"),function(_af,_b0){
with(_af){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(_b1,_b2,_b3){
with(_b1){
if(_cornerView===_b3){
return;
}
_cornerView=_b3;
var _b4=objj_msgSend(objj_msgSend(_b1,"superview"),"superview");
if(objj_msgSend(_b4,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_b4,"documentView")===_b1){
objj_msgSend(_b4,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("headerView"),function(_b5,_b6){
with(_b5){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_b7,_b8,_b9){
with(_b7){
if(_headerView===_b9){
return;
}
objj_msgSend(_headerView,"setTableView:",nil);
_headerView=_b9;
if(_headerView){
objj_msgSend(_headerView,"setTableView:",_b7);
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(_b7,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
var _ba=objj_msgSend(objj_msgSend(_b7,"superview"),"superview");
if(objj_msgSend(_ba,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_ba,"documentView")===_b7){
objj_msgSend(_ba,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_bb,_bc){
with(_bb){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _bd=_dirtyTableColumnRangeIndex,_be=(_tableColumns.length),x=_bd===0?0:CPMaxRange(_tableColumnRanges[_bd-1]);
for(;_bd<_be;++_bd){
var _bf=_tableColumns[_bd];
if(objj_msgSend(_bf,"isHidden")){
_tableColumnRanges[_bd]=CPMakeRange(x,0);
}else{
var _c0=objj_msgSend(_tableColumns[_bd],"width");
_tableColumnRanges[_bd]=CPMakeRange(x,_c0);
x+=_c0;
}
}
_tableColumnRanges.length=_be;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_c1,_c2,_c3){
with(_c1){
_c3=+_c3;
if(_c3<0||_c3>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_c1,"_recalculateTableColumnRanges");
}
var _c4=_tableColumnRanges[_c3];
return {origin:{x:_c4.location,y:0},size:{width:_c4.length,height:CGRectGetHeight(objj_msgSend(_c1,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_c5,_c6,_c7){
with(_c5){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_c7*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_c5,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_c8,_c9,_ca){
with(_c8){
if(_numberOfRows<=0){
return CPMakeRange(0,0);
}
var _cb=objj_msgSend(_c8,"bounds");
if(!CGRectIntersectsRect(_ca,_cb)){
return CPMakeRange(0,0);
}
var _cc=objj_msgSend(_c8,"rowAtPoint:",_ca.origin);
if(_cc<0){
_cc=0;
}
var _cd=objj_msgSend(_c8,"rowAtPoint:",{x:0,y:(_ca.origin.y+_ca.size.height)});
if(_cd<0){
_cd=_numberOfRows-1;
}
return CPMakeRange(_cc,_cd-_cc+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_ce,_cf,_d0){
with(_ce){
var _d1=MAX(0,objj_msgSend(_ce,"columnAtPoint:",{x:_d0.origin.x,y:0})),_d2=objj_msgSend(_ce,"columnAtPoint:",{x:(_d0.origin.x+_d0.size.width),y:0});
if(_d2===CPNotFound){
_d2=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_d1,_d2-_d1+1));
}
var _d3=objj_msgSend(CPIndexSet,"indexSet");
for(;_d1<=_d2;++_d1){
var _d4=_tableColumns[_d1];
if(!objj_msgSend(_d4,"isHidden")){
objj_msgSend(_d3,"addIndex:",_d1);
}
}
return _d3;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_d5,_d6,_d7){
with(_d5){
var _d8=objj_msgSend(_d5,"bounds");
if(!(_d7.x>=(_d8.origin.x)&&_d7.y>=(_d8.origin.y)&&_d7.x<(_d8.origin.x+_d8.size.width)&&_d7.y<(_d8.origin.y+_d8.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_d5,"_recalculateTableColumnRanges");
}
var x=_d7.x,low=0,_d9=_tableColumnRanges.length-1;
while(low<=_d9){
var _da=FLOOR(low+(_d9-low)/2),_db=_tableColumnRanges[_da];
if(x<_db.location){
_d9=_da-1;
}else{
if(x>=CPMaxRange(_db)){
low=_da+1;
}else{
var _dc=_tableColumnRanges.length;
while(_da<_dc&&objj_msgSend(_tableColumns[_da],"isHidden")){
++_da;
}
if(_da<_dc){
return _da;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_dd,_de,_df){
with(_dd){
var y=_df.y;
if(NO){
}
var row=FLOOR(y/(_rowHeight+_intercellSpacing.height));
if(row>=_numberOfRows){
return -1;
}
return row;
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_e0,_e1,_e2,_e3){
with(_e0){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_e0,"_recalculateTableColumnRanges");
}
var _e4=_tableColumnRanges[_e2],_e5=objj_msgSend(_e0,"rectOfRow:",_e3);
return {origin:{x:_e4.location,y:(_e5.origin.y)},size:{width:_e4.length,height:(_e5.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_e6,_e7){
with(_e6){
var _e8=objj_msgSend(_e6,"superview");
if(!_e8){
return;
}
var _e9=objj_msgSend(_e8,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_e6,"_recalculateTableColumnRanges");
}
var _ea=(_tableColumns.length);
while(_ea--&&objj_msgSend(_tableColumns[_ea],"isHidden")){
}
if(_ea>=0){
objj_msgSend(_tableColumns[_ea],"setWidth:",MAX(0,_e9.width-(objj_msgSend(_e6,"rectOfColumn:",_ea).origin.x)));
}
objj_msgSend(_e6,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_eb,_ec){
with(_eb){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_eb);
objj_msgSend(_eb,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_ed,_ee){
with(_ed){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_ed,"_recalculateTableColumnRanges");
}
var _ef=_tableColumnRanges.length>0?CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject")):0,_f0=(_rowHeight+_intercellSpacing.height)*_numberOfRows,_f1=objj_msgSend(_ed,"superview");
if(objj_msgSend(_f1,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _f2=objj_msgSend(_f1,"bounds").size;
_ef=MAX(_f2.width,_ef);
_f0=MAX(_f2.height,_f0);
}
objj_msgSend(_ed,"setFrameSize:",{width:_ef,height:_f0});
objj_msgSend(_ed,"setNeedsLayout");
objj_msgSend(_ed,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f3,_f4,_f5){
with(_f3){
if(_delegate===_f5){
return;
}
var _f6=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_f6,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_f3);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_f6,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_f3);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_f6,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_f3);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_f6,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_f3);
}
}
_delegate=_f5;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_f6,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_f3);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_f6,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_f3);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_f6,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_f3);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_f6,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_f3);
}
}
}),new objj_method(sel_getUid("delegate"),function(_f7,_f8){
with(_f7){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_f9,_fa,_fb,_fc){
with(_f9){
var _fd=objj_msgSend(_fb,"UID"),_fe=_objectValues[_fd];
if(!_fe){
_fe=[];
_objectValues[_fd]=_fe;
}
var _ff=_fe[_fc];
if(_ff===undefined){
_ff=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_f9,_fb,_fc);
_fe[_fc]=_ff;
}
return _ff;
}
}),new objj_method(sel_getUid("_exposedRect"),function(self,_100){
with(self){
var _101=objj_msgSend(self,"superview");
if(!objj_msgSend(_101,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_101,"bounds"),objj_msgSend(self,"frame")),_101);
}
}),new objj_method(sel_getUid("load"),function(self,_102){
with(self){
if(_reloadAllRows){
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_exposedRows,_exposedColumns);
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_reloadAllRows=NO;
}
var _103=objj_msgSend(self,"_exposedRect"),_104=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_103)),_105=objj_msgSend(self,"columnIndexesInRect:",_103),_106=objj_msgSend(_exposedRows,"copy"),_107=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_106,"removeIndexes:",_104);
objj_msgSend(_107,"removeIndexes:",_105);
var _108=objj_msgSend(_104,"copy"),_109=objj_msgSend(_105,"copy");
objj_msgSend(_108,"removeIndexes:",_exposedRows);
objj_msgSend(_109,"removeIndexes:",_exposedColumns);
var _10a=objj_msgSend(_104,"copy"),_10b=objj_msgSend(_105,"copy");
objj_msgSend(_10a,"removeIndexes:",_108);
objj_msgSend(_10b,"removeIndexes:",_109);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_10a,_107);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_106,_10b);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_106,_107);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10a,_109);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_108,_10b);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_108,_109);
_exposedRows=_104;
_exposedColumns=_105;
objj_msgSend(_tableDrawView,"setFrame:",_103);
objj_msgSend(_tableDrawView,"display");
for(identifier in _cachedDataViews){
var _10c=_cachedDataViews[identifier],_10d=_10c.length;
while(_10d--){
objj_msgSend(_10c[_10d],"removeFromSuperview");
}
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(self,_10e,rows,_10f){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_10f,"count")){
return;
}
var _110=[],_111=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_110,-1,nil);
objj_msgSend(_10f,"getIndexes:maxCount:inIndexRange:",_111,-1,nil);
var _112=0,_113=_111.length;
for(;_112<_113;++_112){
var _114=_111[_112],_115=_tableColumns[_114],_116=objj_msgSend(_115,"UID");
var _117=0,_118=_110.length;
for(;_117<_118;++_117){
var row=_110[_117],_119=_dataViewsForTableColumns[_116][row];
_dataViewsForTableColumns[_116][row]=nil;
objj_msgSend(self,"_enqueueReusableDataView:",_119);
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_11a,rows,_11b){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_11b,"count")){
return;
}
var _11c=[],_11d=[],_11e=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_11c,-1,nil);
objj_msgSend(_11b,"getIndexes:maxCount:inIndexRange:",_11e,-1,nil);
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _11f=0,_120=_11e.length;
for(;_11f<_120;++_11f){
var _121=_11e[_11f],_122=_tableColumns[_121],_123=objj_msgSend(_122,"UID");
if(!_dataViewsForTableColumns[_123]){
_dataViewsForTableColumns[_123]=[];
}
var _124=0,_125=_11c.length;
for(;_124<_125;++_124){
var row=_11c[_124],_126=objj_msgSend(self,"_newDataViewForRow:tableColumn:",row,_122);
objj_msgSend(_126,"setFrame:",objj_msgSend(self,"frameOfDataViewAtColumn:row:",_121,row));
objj_msgSend(_126,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_122,row));
if(objj_msgSend(_126,"superview")!==self){
objj_msgSend(self,"addSubview:",_126);
}
_dataViewsForTableColumns[_123][row]=_126;
}
}
}
}),new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"),function(self,_127,aRow,_128){
with(self){
return objj_msgSend(_128,"_newDataViewForRow:",aRow);
}
}),new objj_method(sel_getUid("_enqueueReusableDataView:"),function(self,_129,_12a){
with(self){
var _12b=_12a.identifier;
if(!_cachedDataViews[_12b]){
_cachedDataViews[_12b]=[_12a];
}else{
_cachedDataViews[_12b].push(_12a);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_12c,_12d){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_12d);
if(_headerView){
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(self,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
}
}),new objj_method(sel_getUid("exposedClipRect"),function(self,_12e){
with(self){
var _12f=objj_msgSend(self,"superview");
if(!objj_msgSend(_12f,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_12f,"bounds"),objj_msgSend(self,"frame")),_12f);
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_130,_131){
with(self){
var _132=objj_msgSend(self,"_exposedRect");
objj_msgSend(self,"drawBackgroundInClipRect:",_132);
objj_msgSend(self,"highlightSelectionInClipRect:",_132);
objj_msgSend(self,"drawGridInClipRect:",_132);
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(self,_133,_134){
with(self){
if(!objj_msgSend(self,"usesAlternatingRowBackgroundColors")){
return;
}
var _135=objj_msgSend(self,"alternatingRowBackgroundColors"),_136=objj_msgSend(_135,"count");
if(_136===0){
return;
}
var _137=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(_136===1){
CGContextSetFillColor(_137,_135[0]);
CGContextFillRect(_137,_134);
return;
}
var _138=objj_msgSend(self,"rowsInRect:",_134),_139=_138.location,_13a=CPMaxRange(_138)-1,_13b=MIN(_138.length,_136),_13c=0;
while(_13b--){
var row=_139%_136+_139+_13b,_13d=nil;
CGContextBeginPath(_137);
for(;row<=_13a;row+=_136){
CGContextAddRect(_137,CGRectIntersection(_134,_13d=objj_msgSend(self,"rectOfRow:",row)));
}
if(row-_136===_13a){
_13c=(_13d.origin.y+_13d.size.height);
}
CGContextClosePath(_137);
CGContextSetFillColor(_137,_135[_13b]);
CGContextFillPath(_137);
}
var _13e=(_134.origin.y+_134.size.height);
if(_13c>=_13e||_rowHeight<=0){
return;
}
var _13f=_rowHeight+_intercellSpacing.height,_13d={origin:{x:(_134.origin.x),y:(_134.origin.y)+_13c},size:{width:(_134.size.width),height:_13f}};
for(row=_13a+1;_13c<_13e;++row){
CGContextSetFillColor(_137,_135[row%_136]);
CGContextFillRect(_137,_13d);
_13c+=_13f;
_13d.origin.y+=_13f;
}
}
}),new objj_method(sel_getUid("drawGridInClipRect:"),function(self,_140,_141){
with(self){
var _142=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_143=objj_msgSend(self,"gridStyleMask");
if(!(_143&(CPTableViewSolidHorizontalGridLineMask|CPTableViewSolidVerticalGridLineMask))){
return;
}
CGContextBeginPath(_142);
if(_143&CPTableViewSolidHorizontalGridLineMask){
var _144=objj_msgSend(self,"rowsInRect:",_141);
row=_144.location,lastRow=CPMaxRange(_144)-1,rowY=0,minX=(_141.origin.x),maxX=(_141.origin.x+_141.size.width);
for(;row<=lastRow;++row){
var _145=objj_msgSend(self,"rectOfRow:",row),rowY=(_145.origin.y+_145.size.height)-0.5;
CGContextMoveToPoint(_142,minX,rowY);
CGContextAddLineToPoint(_142,maxX,rowY);
}
if(_rowHeight>0){
var _146=_rowHeight+_intercellSpacing.height,_147=(_141.origin.y+_141.size.height);
while(rowY<_147){
rowY+=_146;
CGContextMoveToPoint(_142,minX,rowY);
CGContextAddLineToPoint(_142,maxX,rowY);
}
}
}
if(_143&CPTableViewSolidVerticalGridLineMask){
var _148=objj_msgSend(self,"columnIndexesInRect:",_141),_149=[];
objj_msgSend(_148,"getIndexes:maxCount:inIndexRange:",_149,-1,nil);
var _14a=0,_14b=_149.length,minY=(_141.origin.y),maxY=(_141.origin.y+_141.size.height);
for(;_14a<_14b;++_14a){
var _14c=objj_msgSend(self,"rectOfColumn:",_14a),_14d=(_14c.origin.x+_14c.size.width)-0.5;
CGContextMoveToPoint(_142,_14d,minY);
CGContextAddLineToPoint(_142,_14d,maxY);
}
}
CGContextClosePath(_142);
CGContextSetStrokeColor(_142,_gridColor);
CGContextStrokePath(_142);
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_14e,_14f){
with(self){
if(objj_msgSend(self,"selectionHighlightStyle")===CPTableViewSelectionHighlightStyleSourceList){
objj_msgSend(objj_msgSend(CPColor,"selectionColorSourceView"),"setFill");
}else{
objj_msgSend(objj_msgSend(CPColor,"selectionColor"),"setFill");
}
var _150=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_151=[],_152=sel_getUid("rectOfRow:");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _153=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_14f)),_154=objj_msgSend(_153,"firstIndex"),_155=CPMakeRange(_154,objj_msgSend(_153,"lastIndex")-_154+1);
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_151,-1,_155);
}else{
if(objj_msgSend(_selectedColumnIndexes,"count")>=1){
_152=sel_getUid("rectOfColumn:");
var _156=objj_msgSend(self,"columnIndexesInRect:",_14f),_157=objj_msgSend(_156,"firstIndex"),_155=CPMakeRange(_157,objj_msgSend(_156,"lastIndex")-_157+1);
objj_msgSend(_selectedColumnIndexes,"getIndexes:maxCount:inIndexRange:",_151,-1,_155);
}
}
var _158=objj_msgSend(_151,"count");
if(!_158){
return;
}
CGContextBeginPath(_150);
while(_158--){
CGContextAddRect(_150,CGRectIntersection(objj_msgSend(self,_152,_151[_158]),_14f));
}
CGContextClosePath(_150);
CGContextFillPath(_150);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_159){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_15a,_15b){
with(self){
var _15c=objj_msgSend(self,"superview"),_15d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_15c){
objj_msgSend(_15d,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_15c);
objj_msgSend(_15d,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_15c);
}
if(_15b){
objj_msgSend(_15b,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_15b,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_15d,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_15b);
objj_msgSend(_15d,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_15b);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_15e,_15f){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_160,_161){
with(self){
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_162){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_163,_164){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_164);
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
_previouslySelectedRowIndexes=nil;
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_165,_166,_167){
with(self){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",objj_msgSend(self,"rowAtPoint:",_167));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_168,_169,_16a,_16b){
with(self){
if(!objj_msgSend(_previouslySelectedRowIndexes,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(self,"_noteSelectionDidChange");
}
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_16c,aRow){
with(self){
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"addIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
}else{
if(aRow>=0&&aRow<_numberOfRows){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_7&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_f){
newSelection=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,newSelection);
}
if(_implementedDelegateMethods&_11){
var _16d=[];
objj_msgSend(newSelection,"getIndexes:maxCount:inIndexRange:",_16d,-1,nil);
var _16e=_16d.length;
while(_16e--){
var _16f=_16d[_16e];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_16f)){
objj_msgSend(newSelection,"removeIndex:",_16f);
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(newSelection,"count")===0){
return;
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(!_previouslySelectedRowIndexes){
_previouslySelectedRowIndexes=objj_msgSend(_selectedRowIndexes,"copy");
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",newSelection,NO);
objj_msgSend(self,"_noteSelectionIsChanging");
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(self,_170){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(self,_171){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,self,nil);
}
})]);
var _172="CPTableViewDataSourceKey",_173="CPTableViewDelegateKey",_174="CPTableViewHeaderViewKey",_175="CPTableViewTableColumnsKey",_176="CPTableViewRowHeightKey",_177="CPTableViewIntercellSpacingKey",_178="CPTableViewMultipleSelectionKey",_179="CPTableViewEmptySelectionKey";
var _1b=objj_getClass("CPTableView");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_17a,_17b){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"initWithCoder:",_17b);
if(self){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=objj_msgSend(_17b,"decodeBoolForKey:",_178);
_allowsEmptySelection=objj_msgSend(_17b,"decodeBoolForKey:",_179);
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(self,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(self,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=objj_msgSend(_17b,"decodeObjectForKey:",_175);
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=0;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_rowHeight=objj_msgSend(_17b,"decodeFloatForKey:",_176);
_intercellSpacing=objj_msgSend(_17b,"decodeSizeForKey:",_177);
objj_msgSend(self,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(self,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(self,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",self);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(self,"setDataSource:",objj_msgSend(_17b,"decodeObjectForKey:",_172));
objj_msgSend(self,"setDelegate:",objj_msgSend(_17b,"decodeObjectForKey:",_173));
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",self);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(self,"addSubview:",_tableDrawView);
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_17c,_17d){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_17d);
objj_msgSend(_17d,"encodeObject:forKey:",_dataSource,_172);
objj_msgSend(_17d,"encodeObject:forKey:",_delegate,_173);
objj_msgSend(_17d,"encodeFloat:forKey:",_rowHeight,_176);
objj_msgSend(_17d,"encodeSize:forKey:",_intercellSpacing,_177);
objj_msgSend(_17d,"encodeBool:forKey:",_allowsMultipleSelection,_178);
objj_msgSend(_17d,"encodeBool:forKey:",_allowsEmptySelection,_179);
objj_msgSend(_17d,"encodeObject:forKey:",_tableColumns,_175);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _1c=_1b.isa;
class_addMethods(_1c,[new objj_method(sel_getUid("selectionColor"),function(self,_17e){
with(self){
return objj_msgSend(CPColor,"colorWithHexString:","5f83b9");
}
}),new objj_method(sel_getUid("selectionColorSourceView"),function(self,_17f){
with(self){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","Resources/tableviewselection.png",CGSizeMake(6,22)));
}
})]);
p;11;CPTabView.ji;13;CPImageView.ji;15;CPTabViewItem.ji;8;CPView.jc;18608;
CPTopTabsBezelBorder=0;
CPNoTabsBezelBorder=4;
CPNoTabsLineBorder=5;
CPNoTabsNoBorder=6;
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil;
var _6=7,_7=7;
var _8=1,_9=2,_a=4,_b=8;
var _c=objj_allocateClassPair(CPView,"CPTabView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_labelsView"),new objj_ivar("_backgroundView"),new objj_ivar("_separatorView"),new objj_ivar("_auxiliaryView"),new objj_ivar("_contentView"),new objj_ivar("_tabViewItems"),new objj_ivar("_selectedTabViewItem"),new objj_ivar("_tabViewType"),new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"initWithFrame:",_10);
if(_e){
_tabViewType=CPTopTabsBezelBorder;
_tabViewItems=[];
}
return _e;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_11,_12){
with(_11){
if(_tabViewType!=CPTopTabsBezelBorder||_labelsView){
return;
}
objj_msgSend(_11,"_createBezelBorder");
objj_msgSend(_11,"layoutSubviews");
}
}),new objj_method(sel_getUid("_createBezelBorder"),function(_13,_14){
with(_13){
var _15=objj_msgSend(_13,"bounds");
_labelsView=objj_msgSend(objj_msgSend(_CPTabLabelsView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_15),0));
objj_msgSend(_labelsView,"setTabView:",_13);
objj_msgSend(_labelsView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_13,"addSubview:",_labelsView);
_backgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_backgroundView,"setBackgroundColor:",_5);
objj_msgSend(_backgroundView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_13,"addSubview:",_backgroundView);
_separatorView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_separatorView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_13,"class"),"bezelBorderColor"));
objj_msgSend(_separatorView,"setAutoresizingMask:",CPViewWidthSizable|CPViewMaxYMargin);
objj_msgSend(_13,"addSubview:",_separatorView);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_16,_17){
with(_16){
if(_tabViewType==CPTopTabsBezelBorder){
var _18=objj_msgSend(_16,"bounds"),_19=objj_msgSend(_CPTabLabelsView,"height");
_18.origin.y+=_19;
_18.size.height-=_19;
objj_msgSend(_backgroundView,"setFrame:",_18);
var _1a=5;
if(_auxiliaryView){
_1a=CGRectGetHeight(objj_msgSend(_auxiliaryView,"frame"));
objj_msgSend(_auxiliaryView,"setFrame:",CGRectMake(_6,_19,CGRectGetWidth(_18)-_6-_7,_1a));
}
objj_msgSend(_separatorView,"setFrame:",CGRectMake(_6,_19+_1a,CGRectGetWidth(_18)-_6-_7,1));
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_16,"contentRect"));
}
}),new objj_method(sel_getUid("addTabViewItem:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"insertTabViewItem:atIndex:",_1d,objj_msgSend(_tabViewItems,"count"));
}
}),new objj_method(sel_getUid("insertTabViewItem:atIndex:"),function(_1e,_1f,_20,_21){
with(_1e){
if(!_labelsView&&_tabViewType==CPTopTabsBezelBorder){
objj_msgSend(_1e,"_createBezelBorder");
}
objj_msgSend(_tabViewItems,"insertObject:atIndex:",_20,_21);
objj_msgSend(_labelsView,"tabView:didAddTabViewItem:",_1e,_20);
if(objj_msgSend(_tabViewItems,"count")==1){
objj_msgSend(_1e,"selectFirstTabViewItem:",_1e);
}
if(_delegateSelectors&_b){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_1e);
}
}
}),new objj_method(sel_getUid("removeTabViewItem:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_22,"indexOfTabViewItem:",_24);
objj_msgSend(_tabViewItems,"removeObjectIdenticalTo:",_24);
objj_msgSend(_labelsView,"tabView:didRemoveTabViewItemAtIndex:",_22,_25);
if(_delegateSelectors&_b){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_22);
}
}
}),new objj_method(sel_getUid("indexOfTabViewItem:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_tabViewItems,"indexOfObjectIdenticalTo:",_28);
}
}),new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"),function(_29,_2a,_2b){
with(_29){
var _2c=0,_2d=objj_msgSend(_tabViewItems,"count");
for(;_2c<_2d;++_2c){
if(objj_msgSend(objj_msgSend(_tabViewItems[_2c],"identifier"),"isEqual:",_2b)){
return _2c;
}
}
return _2c;
}
}),new objj_method(sel_getUid("numberOfTabViewItems"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_tabViewItems,"count");
}
}),new objj_method(sel_getUid("tabViewItemAtIndex:"),function(_30,_31,_32){
with(_30){
return _tabViewItems[_32];
}
}),new objj_method(sel_getUid("tabViewItems"),function(_33,_34){
with(_33){
return _tabViewItems;
}
}),new objj_method(sel_getUid("selectFirstTabViewItem:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_tabViewItems,"count");
if(_38){
objj_msgSend(_35,"selectTabViewItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("selectLastTabViewItem:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_tabViewItems,"count");
if(_3c){
objj_msgSend(_39,"selectTabViewItemAtIndex:",_3c-1);
}
}
}),new objj_method(sel_getUid("selectNextTabViewItem:"),function(_3d,_3e,_3f){
with(_3d){
if(!_selectedTabViewItem){
return;
}
var _40=objj_msgSend(_3d,"indexOfTabViewItem:",_selectedTabViewItem),_41=objj_msgSend(_tabViewItems,"count");
objj_msgSend(_3d,"selectTabViewItemAtIndex:",_40+1%_41);
}
}),new objj_method(sel_getUid("selectPreviousTabViewItem:"),function(_42,_43,_44){
with(_42){
if(!_selectedTabViewItem){
return;
}
var _45=objj_msgSend(_42,"indexOfTabViewItem:",_selectedTabViewItem),_46=objj_msgSend(_tabViewItems,"count");
objj_msgSend(_42,"selectTabViewItemAtIndex:",_45==0?_46:_45-1);
}
}),new objj_method(sel_getUid("selectTabViewItem:"),function(_47,_48,_49){
with(_47){
if((_delegateSelectors&_9)&&!objj_msgSend(_delegate,"tabView:shouldSelectTabViewItem:",_47,_49)){
return;
}
if(_delegateSelectors&_a){
objj_msgSend(_delegate,"tabView:willSelectTabViewItem:",_47,_49);
}
if(_selectedTabViewItem){
_selectedTabViewItem._tabState=CPBackgroundTab;
objj_msgSend(_labelsView,"tabView:didChangeStateOfTabViewItem:",_47,_selectedTabViewItem);
objj_msgSend(_contentView,"removeFromSuperview");
objj_msgSend(_auxiliaryView,"removeFromSuperview");
}
_selectedTabViewItem=_49;
_selectedTabViewItem._tabState=CPSelectedTab;
_contentView=objj_msgSend(_selectedTabViewItem,"view");
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_auxiliaryView=objj_msgSend(_selectedTabViewItem,"auxiliaryView");
objj_msgSend(_auxiliaryView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_47,"addSubview:",_contentView);
if(_auxiliaryView){
objj_msgSend(_47,"addSubview:",_auxiliaryView);
}
objj_msgSend(_labelsView,"tabView:didChangeStateOfTabViewItem:",_47,_selectedTabViewItem);
objj_msgSend(_47,"layoutSubviews");
if(_delegateSelectors&_8){
objj_msgSend(_delegate,"tabView:didSelectTabViewItem:",_47,_49);
}
}
}),new objj_method(sel_getUid("selectTabViewItemAtIndex:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(_4a,"selectTabViewItem:",_tabViewItems[_4c]);
}
}),new objj_method(sel_getUid("selectedTabViewItem"),function(_4d,_4e){
with(_4d){
return _selectedTabViewItem;
}
}),new objj_method(sel_getUid("setTabViewType:"),function(_4f,_50,_51){
with(_4f){
if(_tabViewType==_51){
return;
}
_tabViewType=_51;
if(_tabViewType==CPNoTabsBezelBorder||_tabViewType==CPNoTabsLineBorder||_tabViewType==CPNoTabsNoBorder){
objj_msgSend(_labelsView,"removeFromSuperview");
}else{
if(!objj_msgSend(_labelsView,"superview")){
objj_msgSend(_4f,"addSubview:",_labelsView);
}
}
if(_tabViewType==CPNoTabsLineBorder||_tabViewType==CPNoTabsNoBorder){
objj_msgSend(_backgroundView,"removeFromSuperview");
}else{
if(!objj_msgSend(_backgroundView,"superview")){
objj_msgSend(_4f,"addSubview:",_backgroundView);
}
}
objj_msgSend(_4f,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabViewType"),function(_52,_53){
with(_52){
return _tabViewType;
}
}),new objj_method(sel_getUid("contentRect"),function(_54,_55){
with(_54){
var _56=CGRectMakeCopy(objj_msgSend(_54,"bounds"));
if(_tabViewType==CPTopTabsBezelBorder){
var _57=objj_msgSend(_CPTabLabelsView,"height"),_58=_auxiliaryView?CGRectGetHeight(objj_msgSend(_auxiliaryView,"frame")):5,_59=1;
_56.origin.y+=_57+_58+_59;
_56.size.height-=_57+_58+_59*2;
_56.origin.x+=_6;
_56.size.width-=_6+_7;
}
return _56;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5a,_5b,_5c){
with(_5a){
if(_delegate==_5c){
return;
}
_delegate=_5c;
_delegateSelectors=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:shouldSelectTabViewItem:"))){
_delegateSelectors|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:willSelectTabViewItem:"))){
_delegateSelectors|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:didSelectTabViewItem:"))){
_delegateSelectors|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabViewDidChangeNumberOfTabViewItems:"))){
_delegateSelectors|=_b;
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_5d,_5e,_5f){
with(_5d){
var _60=objj_msgSend(_labelsView,"convertPoint:fromView:",objj_msgSend(_5f,"locationInWindow"),nil),_61=objj_msgSend(_labelsView,"representedTabViewItemAtPoint:",_60);
if(_61){
objj_msgSend(_5d,"selectTabViewItem:",_61);
}
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_62,_63){
with(_62){
if(_62!=CPTabView){
return;
}
var _64=objj_msgSend(CPBundle,"bundleForClass:",_62),_65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","",CGSizeMake(7,0)),_66=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBackgroundCenter.png"),CGSizeMake(1,1)),_67=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBorderLeft.png"),CGSizeMake(7,1)),_68=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBorder.png"),CGSizeMake(1,1)),_69=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBorderRight.png"),CGSizeMake(7,1));
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[_65,_65,_65,_67,_66,_69,_67,_68,_69]));
_4=objj_msgSend(CPColor,"colorWithPatternImage:",_68);
}
}),new objj_method(sel_getUid("bezelBorderColor"),function(_6a,_6b){
with(_6a){
return _4;
}
})]);
var _6c="CPTabViewItemsKey",_6d="CPTabViewSelectedItemKey",_6e="CPTabViewTypeKey",_6f="CPTabViewDelegateKey";
var _c=objj_getClass("CPTabView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("initWithCoder:"),function(_70,_71,_72){
with(_70){
if(_70=objj_msgSendSuper({receiver:_70,super_class:objj_getClass("CPView")},"initWithCoder:",_72)){
_tabViewType=objj_msgSend(_72,"decodeIntForKey:",_6e);
_tabViewItems=[];
objj_msgSend(_70,"_createBezelBorder");
var _73=objj_msgSend(_72,"decodeObjectForKey:",_6c);
for(var i=0;_73&&i<_73.length;i++){
objj_msgSend(_70,"insertTabViewItem:atIndex:",_73[i],i);
}
var _74=objj_msgSend(_72,"decodeObjectForKey:",_6d);
if(_74){
objj_msgSend(_70,"selectTabViewItem:",_74);
}
objj_msgSend(_70,"setDelegate:",objj_msgSend(_72,"decodeObjectForKey:",_6f));
}
return _70;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_75,_76,_77){
with(_75){
var _78=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_75,super_class:objj_getClass("CPView")},"encodeWithCoder:",_77);
_subviews=_78;
objj_msgSend(_77,"encodeObject:forKey:",_tabViewItems,_6c);
objj_msgSend(_77,"encodeObject:forKey:",_selectedTabViewItem,_6d);
objj_msgSend(_77,"encodeInt:forKey:",_tabViewType,_6e);
objj_msgSend(_77,"encodeConditionalObject:forKey:",_delegate,_6f);
}
})]);
var _79=nil,_7a=10,_7b=15;
var _c=objj_allocateClassPair(CPView,"_CPTabLabelsView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_tabView"),new objj_ivar("_tabLabels")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_7c,_7d,_7e){
with(_7c){
_7c=objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPView")},"initWithFrame:",_7e);
if(_7c){
_tabLabels=[];
objj_msgSend(_7c,"setBackgroundColor:",_79);
objj_msgSend(_7c,"setFrameSize:",CGSizeMake(CGRectGetWidth(_7e),26));
}
return _7c;
}
}),new objj_method(sel_getUid("setTabView:"),function(_7f,_80,_81){
with(_7f){
_tabView=_81;
}
}),new objj_method(sel_getUid("tabView"),function(_82,_83){
with(_82){
return _tabView;
}
}),new objj_method(sel_getUid("tabView:didAddTabViewItem:"),function(_84,_85,_86,_87){
with(_84){
var _88=objj_msgSend(objj_msgSend(_CPTabLabel,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_88,"setTabViewItem:",_87);
_tabLabels.push(_88);
objj_msgSend(_84,"addSubview:",_88);
objj_msgSend(_84,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabView:didRemoveTabViewItemAtIndex:"),function(_89,_8a,_8b,_8c){
with(_89){
var _8d=_tabLabels[_8c];
objj_msgSend(_tabLabels,"removeObjectAtIndex:",_8c);
objj_msgSend(_8d,"removeFromSuperview");
objj_msgSend(_89,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabView:didChangeStateOfTabViewItem:"),function(_8e,_8f,_90,_91){
with(_8e){
objj_msgSend(_tabLabels[objj_msgSend(_90,"indexOfTabViewItem:",_91)],"setTabState:",objj_msgSend(_91,"tabState"));
}
}),new objj_method(sel_getUid("representedTabViewItemAtPoint:"),function(_92,_93,_94){
with(_92){
var _95=0,_96=_tabLabels.length;
for(;_95<_96;++_95){
var _97=_tabLabels[_95];
if(CGRectContainsPoint(objj_msgSend(_97,"frame"),_94)){
return objj_msgSend(_97,"tabViewItem");
}
}
return nil;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_98,_99){
with(_98){
var _9a=0,_9b=_tabLabels.length,_9c=((objj_msgSend(_98,"bounds").size.width)-(_9b-1)*_7a-2*_7b)/_9b,x=_7b;
for(;_9a<_9b;++_9a){
var _9d=_tabLabels[_9a],_9e={origin:{x:x,y:8},size:{width:_9c,height:18}};
objj_msgSend(_9d,"setFrame:",_9e);
x=(_9e.origin.x+_9e.size.width)+_7a;
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_9f,_a0,_a1){
with(_9f){
if(CGSizeEqualToSize(objj_msgSend(_9f,"frame").size,_a1)){
return;
}
objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("CPView")},"setFrameSize:",_a1);
objj_msgSend(_9f,"layoutSubviews");
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_a2,_a3){
with(_a2){
if(_a2!=objj_msgSend(_CPTabLabelsView,"class")){
return;
}
var _a4=objj_msgSend(CPBundle,"bundleForClass:",_a2);
_79=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a4,"pathForResource:","CPTabView/_CPTabLabelsViewLeft.png"),CGSizeMake(12,26)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a4,"pathForResource:","CPTabView/_CPTabLabelsViewCenter.png"),CGSizeMake(1,26)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a4,"pathForResource:","CPTabView/_CPTabLabelsViewRight.png"),CGSizeMake(12,26))],NO));
}
}),new objj_method(sel_getUid("height"),function(_a5,_a6){
with(_a5){
return 26;
}
})]);
var _a7=nil,_a8=nil;
var _c=objj_allocateClassPair(CPView,"_CPTabLabel"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_tabViewItem"),new objj_ivar("_labelField")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_a9,_aa,_ab){
with(_a9){
_a9=objj_msgSendSuper({receiver:_a9,super_class:objj_getClass("CPView")},"initWithFrame:",_ab);
if(_a9){
_labelField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_labelField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_labelField,"setFrame:",CGRectMake(5,0,CGRectGetWidth(_ab)-10,20));
objj_msgSend(_labelField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_labelField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",11));
objj_msgSend(_a9,"addSubview:",_labelField);
objj_msgSend(_a9,"setTabState:",CPBackgroundTab);
}
return _a9;
}
}),new objj_method(sel_getUid("setTabState:"),function(_ac,_ad,_ae){
with(_ac){
objj_msgSend(_ac,"setBackgroundColor:",_ae==CPSelectedTab?_a8:_a7);
}
}),new objj_method(sel_getUid("setTabViewItem:"),function(_af,_b0,_b1){
with(_af){
_tabViewItem=_b1;
objj_msgSend(_af,"update");
}
}),new objj_method(sel_getUid("tabViewItem"),function(_b2,_b3){
with(_b2){
return _tabViewItem;
}
}),new objj_method(sel_getUid("update"),function(_b4,_b5){
with(_b4){
objj_msgSend(_labelField,"setStringValue:",objj_msgSend(_tabViewItem,"label"));
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_b6,_b7){
with(_b6){
if(_b6!=objj_msgSend(_CPTabLabel,"class")){
return;
}
var _b8=objj_msgSend(CPBundle,"bundleForClass:",_b6);
_a7=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b8,"pathForResource:","CPTabView/_CPTabLabelBackgroundLeft.png"),CGSizeMake(6,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b8,"pathForResource:","CPTabView/_CPTabLabelBackgroundCenter.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b8,"pathForResource:","CPTabView/_CPTabLabelBackgroundRight.png"),CGSizeMake(6,18))],NO));
_a8=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b8,"pathForResource:","CPTabView/_CPTabLabelSelectedLeft.png"),CGSizeMake(3,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b8,"pathForResource:","CPTabView/_CPTabLabelSelectedCenter.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b8,"pathForResource:","CPTabView/_CPTabLabelSelectedRight.png"),CGSizeMake(3,18))],NO));
}
})]);
p;15;CPTabViewItem.jI;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;2688;
CPSelectedTab=0;
CPBackgroundTab=1;
CPPressedTab=2;
var _1=objj_allocateClassPair(CPObject,"CPTabViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_label"),new objj_ivar("_view"),new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_identifier=_7;
}
return _5;
}
}),new objj_method(sel_getUid("setLabel:"),function(_8,_9,_a){
with(_8){
_label=_a;
}
}),new objj_method(sel_getUid("label"),function(_b,_c){
with(_b){
return _label;
}
}),new objj_method(sel_getUid("tabState"),function(_d,_e){
with(_d){
return _tabState;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_f,_10,_11){
with(_f){
_identifier=_11;
}
}),new objj_method(sel_getUid("identifier"),function(_12,_13){
with(_12){
return _identifier;
}
}),new objj_method(sel_getUid("setView:"),function(_14,_15,_16){
with(_14){
_view=_16;
}
}),new objj_method(sel_getUid("view"),function(_17,_18){
with(_17){
return _view;
}
}),new objj_method(sel_getUid("setAuxiliaryView:"),function(_19,_1a,_1b){
with(_19){
_auxiliaryView=_1b;
}
}),new objj_method(sel_getUid("auxiliaryView"),function(_1c,_1d){
with(_1c){
return _auxiliaryView;
}
}),new objj_method(sel_getUid("tabView"),function(_1e,_1f){
with(_1e){
return _tabView;
}
})]);
var _20="CPTabViewItemIdentifierKey",_21="CPTabViewItemLabelKey",_22="CPTabViewItemViewKey",_23="CPTabViewItemAuxViewKey";
var _1=objj_getClass("CPTabViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_24,_25,_26){
with(_24){
_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPObject")},"init");
if(_24){
_identifier=objj_msgSend(_26,"decodeObjectForKey:",_20);
_label=objj_msgSend(_26,"decodeObjectForKey:",_21);
_view=objj_msgSend(_26,"decodeObjectForKey:",_22);
_auxiliaryView=objj_msgSend(_26,"decodeObjectForKey:",_23);
}
return _24;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_29,"encodeObject:forKey:",_identifier,_20);
objj_msgSend(_29,"encodeObject:forKey:",_label,_21);
objj_msgSend(_29,"encodeObject:forKey:",_view,_22);
objj_msgSend(_29,"encodeObject:forKey:",_auxiliaryView,_23);
}
})]);
p;13;CPTextField.ji;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;17743;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
CPTextFieldDidFocusNotification="CPTextFieldDidFocusNotification";
CPTextFieldDidBlurNotification="CPTextFieldDidBlurNotification";
var _1="•";
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("string"),function(_4,_5){
with(_4){
return _4;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _2=objj_allocateClassPair(CPControl,"CPTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isEditing"),new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setStringValue:","");
objj_msgSend(_6,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_6,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
_isEditable=_b;
}
}),new objj_method(sel_getUid("isEditable"),function(_c,_d){
with(_c){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_e,_f,_10){
with(_e){
_isSelectable=_10;
}
}),new objj_method(sel_getUid("isSelectable"),function(_11,_12){
with(_11){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_13,_14,_15){
with(_13){
_isSecure=_15;
}
}),new objj_method(sel_getUid("isSecure"),function(_16,_17){
with(_16){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_18,_19,_1a){
with(_18){
if(_1a){
objj_msgSend(_18,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_18,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_1d,_1e,_1f){
with(_1d){
var _20=_1f===CPTextFieldRoundedBezel;
if(_20){
objj_msgSend(_1d,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_1d,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_23,_24,_25){
with(_23){
if(_25){
objj_msgSend(_23,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_23,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_28,_29,_2a){
with(_28){
if(_drawsBackground==_2a){
return;
}
_drawsBackground=_2a;
objj_msgSend(_28,"setNeedsLayout");
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_2b,_2c){
with(_2b){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_2d,_2e,_2f){
with(_2d){
if(_textFieldBackgroundColor==_2f){
return;
}
_textFieldBackgroundColor=_2f;
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_30,_31){
with(_30){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"isEditable")&&objj_msgSend(_32,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_34,_35){
with(_34){
objj_msgSend(_34,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_34,"_updatePlaceholderState");
objj_msgSend(_34,"setNeedsLayout");
_isEditing=NO;
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_36,_37){
with(_36){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_36,"_updatePlaceholderState");
objj_msgSend(_36,"setNeedsLayout");
if(_isEditing){
_isEditing=NO;
objj_msgSend(_36,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_36,nil));
if(objj_msgSend(_36,"sendsActionOnEndEditing")){
objj_msgSend(_36,"sendAction:to:",objj_msgSend(_36,"action"),objj_msgSend(_36,"target"));
}
}
objj_msgSend(_36,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_36,nil));
return YES;
}
}),new objj_method(sel_getUid("textDidBlur:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_3a,"object")!=_38){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",_3a);
}
}),new objj_method(sel_getUid("textDidFocus:"),function(_3b,_3c,_3d){
with(_3b){
if(objj_msgSend(_3d,"object")!=_3b){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",_3d);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3e,_3f,_40){
with(_3e){
if(objj_msgSend(_3e,"isEditable")&&objj_msgSend(_3e,"isEnabled")){
return objj_msgSend(objj_msgSend(_3e,"window"),"makeFirstResponder:",_3e);
}else{
return objj_msgSend(objj_msgSend(_3e,"nextResponder"),"mouseDown:",_40);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_41,_42){
with(_41){
return objj_msgSendSuper({receiver:_41,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_43,"willChangeValueForKey:","objectValue");
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPControl")},"setObjectValue:",String(_45));
objj_msgSend(_43,"_updatePlaceholderState");
objj_msgSend(_43,"didChangeValueForKey:","objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_46,_47,_48){
with(_46){
objj_msgSendSuper({receiver:_46,super_class:objj_getClass("CPControl")},"setObjectValue:",_48);
objj_msgSend(_46,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_49,_4a){
with(_49){
var _4b=objj_msgSend(_49,"stringValue");
if((!_4b||_4b.length===0)&&!objj_msgSend(_49,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_49,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_49,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_4c,_4d,_4e){
with(_4c){
if(_placeholderString===_4e){
return;
}
_placeholderString=_4e;
if(objj_msgSend(_4c,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_4c,"setNeedsLayout");
objj_msgSend(_4c,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_4f,_50){
with(_4f){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_51,_52){
with(_51){
var _53=objj_msgSend((objj_msgSend(_51,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_51,"currentValueForThemeAttribute:","font")),_54=objj_msgSend(_51,"currentValueForThemeAttribute:","content-inset"),_55=objj_msgSend(_51,"currentValueForThemeAttribute:","min-size"),_56=objj_msgSend(_51,"currentValueForThemeAttribute:","max-size");
_53.width=MAX(_53.width+_54.left+_54.right,_55.width);
_53.height=MAX(_53.height+_54.top+_54.bottom,_55.height);
if(_56.width>=0){
_53.width=MIN(_53.width,_56.width);
}
if(_56.height>=0){
_53.height=MIN(_53.height,_56.height);
}
if(objj_msgSend(_51,"isEditable")){
_53.width=CGRectGetWidth(objj_msgSend(_51,"frame"));
}
objj_msgSend(_51,"setFrameSize:",_53);
}
}),new objj_method(sel_getUid("selectText:"),function(_57,_58,_59){
with(_57){
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_5d,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_5a);
objj_msgSend(_5d,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_5a);
objj_msgSend(_5d,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_5a);
objj_msgSend(_5d,"removeObserver:name:object:",_delegate,CPTextFieldDidFocusNotification,_5a);
objj_msgSend(_5d,"removeObserver:name:object:",_delegate,CPTextFieldDidBlurNotification,_5a);
}
_delegate=_5c;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_5d,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_5a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_5d,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_5a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_5d,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_5a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidFocus:"))){
objj_msgSend(_5d,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidFocus:"),CPTextFieldDidFocusNotification,_5a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBlur:"))){
objj_msgSend(_5d,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBlur:"),CPTextFieldDidBlurNotification,_5a);
}
}
}),new objj_method(sel_getUid("delegate"),function(_5e,_5f){
with(_5e){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_60,_61,_62){
with(_60){
var _63=objj_msgSend(_60,"currentValueForThemeAttribute:","content-inset");
if(!_63){
return _62;
}
_62.origin.x+=_63.left;
_62.origin.y+=_63.top;
_62.size.width-=_63.left+_63.right;
_62.size.height-=_63.top+_63.bottom;
return _62;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_64,_65,_66){
with(_64){
var _67=objj_msgSend(_64,"currentValueForThemeAttribute:","bezel-inset");
if(((_67).top===0&&(_67).right===0&&(_67).bottom===0&&(_67).left===0)){
return _66;
}
_66.origin.x+=_67.left;
_66.origin.y+=_67.top;
_66.size.width-=_67.left+_67.right;
_66.size.height-=_67.top+_67.bottom;
return _66;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_68,_69,_6a){
with(_68){
if(_6a==="bezel-view"){
return objj_msgSend(_68,"bezelRectForBounds:",objj_msgSend(_68,"bounds"));
}else{
if(_6a==="content-view"){
return objj_msgSend(_68,"contentRectForBounds:",objj_msgSend(_68,"bounds"));
}
}
return objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_6a);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6b,_6c,_6d){
with(_6b){
if(_6d==="bezel-view"){
var _6e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_6e,"setHitTests:",NO);
return _6e;
}else{
var _6e=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _6e;
}
return objj_msgSendSuper({receiver:_6b,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_6d);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_6f,_70){
with(_6f){
var _71=objj_msgSend(_6f,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_71){
objj_msgSend(_71,"setBackgroundColor:",objj_msgSend(_6f,"currentValueForThemeAttribute:","bezel-color"));
}
var _72=objj_msgSend(_6f,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_72){
objj_msgSend(_72,"setHidden:",objj_msgSend(_6f,"hasThemeState:",CPThemeStateEditing));
var _73="";
if(objj_msgSend(_6f,"hasThemeState:",CPTextFieldStatePlaceholder)){
_73=objj_msgSend(_6f,"placeholderString");
}else{
_73=objj_msgSend(_6f,"stringValue");
if(objj_msgSend(_6f,"isSecure")){
_73=_74(_73);
}
}
objj_msgSend(_72,"setText:",_73);
objj_msgSend(_72,"setTextColor:",objj_msgSend(_6f,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_72,"setFont:",objj_msgSend(_6f,"currentValueForThemeAttribute:","font"));
objj_msgSend(_72,"setAlignment:",objj_msgSend(_6f,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_72,"setVerticalAlignment:",objj_msgSend(_6f,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_72,"setLineBreakMode:",objj_msgSend(_6f,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_72,"setTextShadowColor:",objj_msgSend(_6f,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_72,"setTextShadowOffset:",objj_msgSend(_6f,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_75,_76,_77,_78,_79){
with(_75){
return objj_msgSend(_75,"textFieldWithStringValue:placeholder:width:theme:",_77,_78,_79,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_7a,_7b,_7c,_7d,_7e,_7f){
with(_7a){
var _80=objj_msgSend(objj_msgSend(_7a,"alloc"),"initWithFrame:",CGRectMake(0,0,_7e,29));
objj_msgSend(_80,"setTheme:",_7f);
objj_msgSend(_80,"setStringValue:",_7c);
objj_msgSend(_80,"setPlaceholderString:",_7d);
objj_msgSend(_80,"setBordered:",YES);
objj_msgSend(_80,"setBezeled:",YES);
objj_msgSend(_80,"setEditable:",YES);
objj_msgSend(_80,"sizeToFit");
return _80;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_81,_82,_83,_84,_85){
with(_81){
return objj_msgSend(_81,"roundedTextFieldWithStringValue:placeholder:width:theme:",_83,_84,_85,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_86,_87,_88,_89,_8a,_8b){
with(_86){
var _8c=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_8a,29));
objj_msgSend(_8c,"setTheme:",_8b);
objj_msgSend(_8c,"setStringValue:",_88);
objj_msgSend(_8c,"setPlaceholderString:",_89);
objj_msgSend(_8c,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_8c,"setBordered:",YES);
objj_msgSend(_8c,"setBezeled:",YES);
objj_msgSend(_8c,"setEditable:",YES);
objj_msgSend(_8c,"sizeToFit");
return _8c;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_8d,_8e,_8f){
with(_8d){
return objj_msgSend(_8d,"labelWithTitle:theme:",_8f,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_90,_91,_92,_93){
with(_90){
var _94=objj_msgSend(objj_msgSend(_90,"alloc"),"init");
objj_msgSend(_94,"setStringValue:",_92);
objj_msgSend(_94,"sizeToFit");
return _94;
}
}),new objj_method(sel_getUid("themeClass"),function(_95,_96){
with(_95){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_97,_98){
with(_97){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _74=function(_99){
if(!_99){
return "";
}
return Array(_99.length+1).join(_1);
};
var _9a="CPTextFieldIsEditableKey",_9b="CPTextFieldIsSelectableKey",_9c="CPTextFieldIsBorderedKey",_9d="CPTextFieldIsBezeledKey",_9e="CPTextFieldBezelStyleKey",_9f="CPTextFieldDrawsBackgroundKey",_a0="CPTextFieldLineBreakModeKey",_a1="CPTextFieldBackgroundColorKey",_a2="CPTextFieldPlaceholderStringKey";
var _2=objj_getClass("CPTextField");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_a3,_a4,_a5){
with(_a3){
_a3=objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("CPControl")},"initWithCoder:",_a5);
if(_a3){
objj_msgSend(_a3,"setEditable:",objj_msgSend(_a5,"decodeBoolForKey:",_9a));
objj_msgSend(_a3,"setSelectable:",objj_msgSend(_a5,"decodeBoolForKey:",_9b));
objj_msgSend(_a3,"setDrawsBackground:",objj_msgSend(_a5,"decodeBoolForKey:",_9f));
objj_msgSend(_a3,"setTextFieldBackgroundColor:",objj_msgSend(_a5,"decodeObjectForKey:",_a1));
objj_msgSend(_a3,"setPlaceholderString:",objj_msgSend(_a5,"decodeObjectForKey:",_a2));
}
return _a3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_a8);
objj_msgSend(_a8,"encodeBool:forKey:",_isEditable,_9a);
objj_msgSend(_a8,"encodeBool:forKey:",_isSelectable,_9b);
objj_msgSend(_a8,"encodeBool:forKey:",_drawsBackground,_9f);
objj_msgSend(_a8,"encodeObject:forKey:",_textFieldBackgroundColor,_a1);
objj_msgSend(_a8,"encodeObject:forKey:",_placeholderString,_a2);
}
})]);
p;9;CPTheme.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;10887;
var _1={},_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPTheme"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_name"),new objj_ivar("_attributes")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithName:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_name=_7;
_attributes=objj_msgSend(CPDictionary,"dictionary");
_1[_name]=_5;
}
return _5;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _name;
}
}),new objj_method(sel_getUid("_attributeWithName:forClass:"),function(_a,_b,_c,_d){
with(_a){
var _e=objj_msgSend(_attributes,"objectForKey:",_d);
if(!_e){
return nil;
}
return objj_msgSend(_e,"objectForKey:",_c);
}
}),new objj_method(sel_getUid("takeThemeFromObject:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(_11,"_themeAttributeDictionary"),_13=nil,_14=objj_msgSend(_12,"keyEnumerator"),_15=objj_msgSend(objj_msgSend(_11,"class"),"themeClass");
while(_13=objj_msgSend(_14,"nextObject")){
objj_msgSend(_f,"_recordAttribute:forClass:",objj_msgSend(_12,"objectForKey:",_13),_15);
}
}
}),new objj_method(sel_getUid("_recordAttribute:forClass:"),function(_16,_17,_18,_19){
with(_16){
if(!objj_msgSend(_18,"hasValues")){
return;
}
var _1a=objj_msgSend(_attributes,"objectForKey:",_19);
if(!_1a){
_1a=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_attributes,"setObject:forKey:",_1a,_19);
}
var _1b=objj_msgSend(_18,"name"),_1c=objj_msgSend(_1a,"objectForKey:",_1b);
if(_1c){
objj_msgSend(_1a,"setObject:forKey:",objj_msgSend(_1c,"attributeMergedWithAttribute:",_18),_1b);
}else{
objj_msgSend(_1a,"setObject:forKey:",_18,_1b);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("setDefaultTheme:"),function(_1d,_1e,_1f){
with(_1d){
_2=_1f;
}
}),new objj_method(sel_getUid("defaultTheme"),function(_20,_21){
with(_20){
return _2;
}
}),new objj_method(sel_getUid("themeNamed:"),function(_22,_23,_24){
with(_22){
return _1[_24];
}
})]);
var _25="CPThemeNameKey",_26="CPThemeAttributesKey";
var _3=objj_getClass("CPTheme");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTheme\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPObject")},"init");
if(_27){
_name=objj_msgSend(_29,"decodeObjectForKey:",_25);
_attributes=objj_msgSend(_29,"decodeObjectForKey:",_26);
_1[_name]=_27;
}
return _27;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2c,"encodeObject:forKey:",_name,_25);
objj_msgSend(_2c,"encodeObject:forKey:",_attributes,_26);
}
})]);
var _3=objj_allocateClassPair(CPKeyedUnarchiver,"_CPThemeKeyedUnarchiver"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_bundle")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initForReadingWithData:bundle:"),function(_2d,_2e,_2f,_30){
with(_2d){
_2d=objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_2f);
if(_2d){
_bundle=_30;
}
return _2d;
}
}),new objj_method(sel_getUid("bundle"),function(_31,_32){
with(_31){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_33,_34){
with(_33){
return YES;
}
})]);
var _35={},_36={},_37=0;
CPThemeState=function(_38){
var _39=_35[_38];
if(_39===undefined){
if(_38.indexOf("+")===-1){
_39=1<<_37++;
}else{
var _39=0,_3a=_38.split("+"),_3b=_3a.length;
while(_3b--){
var _3c=_3a[_3b],_3d=_35[_3c];
if(_3d===undefined){
_3d=1<<_37++;
_35[_3c]=_3d;
_36[_3d]=_3c;
}
_39|=_3d;
}
}
_35[_38]=_39;
_36[_39]=_38;
}
return _39;
};
CPThemeStateName=function(_3e){
var _3f=_36[_3e];
if(_3f!==undefined){
return _3f;
}
if(!(_3e&(_3e-1))){
return "";
}
var _40=1,_3f="";
for(;_40<_3e;_40<<=1){
if(_3e&_40){
_3f+=(_3f.length===0?"":"+")+_36[_40];
}
}
_36[_3e]=_3f;
return _3f;
};
_36[0]="normal";
CPThemeStateNormal=_35["normal"]=0;
CPThemeStateDisabled=CPThemeState("disabled");
CPThemeStateHighlighted=CPThemeState("highlighted");
CPThemeStateSelected=CPThemeState("selected");
CPThemeStateBezeled=CPThemeState("bezeled");
CPThemeStateBordered=CPThemeState("bordered");
CPThemeStateEditable=CPThemeState("editable");
CPThemeStateEditing=CPThemeState("editing");
CPThemeStateVertical=CPThemeState("vertical");
CPThemeStateDefault=CPThemeState("default");
CPThemeStateCircular=CPThemeState("circular");
var _3=objj_allocateClassPair(CPObject,"_CPThemeAttribute"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_name"),new objj_ivar("_defaultValue"),new objj_ivar("_values"),new objj_ivar("_cache"),new objj_ivar("_parentAttribute")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithName:defaultValue:"),function(_41,_42,_43,_44){
with(_41){
_41=objj_msgSendSuper({receiver:_41,super_class:objj_getClass("CPObject")},"init");
if(_41){
_cache={};
_name=_43;
_defaultValue=_44;
_values=objj_msgSend(CPDictionary,"dictionary");
}
return _41;
}
}),new objj_method(sel_getUid("name"),function(_45,_46){
with(_45){
return _name;
}
}),new objj_method(sel_getUid("defaultValue"),function(_47,_48){
with(_47){
return _defaultValue;
}
}),new objj_method(sel_getUid("hasValues"),function(_49,_4a){
with(_49){
return objj_msgSend(_values,"count")>0;
}
}),new objj_method(sel_getUid("isTrivial"),function(_4b,_4c){
with(_4b){
return (objj_msgSend(_values,"count")===1)&&(Number(objj_msgSend(_values,"allKeys")[0])===CPThemeStateNormal);
}
}),new objj_method(sel_getUid("setValue:"),function(_4d,_4e,_4f){
with(_4d){
_cache={};
if(_4f===undefined||_4f===nil){
_values=objj_msgSend(CPDictionary,"dictionary");
}else{
_values=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_4f,String(CPThemeStateNormal));
}
}
}),new objj_method(sel_getUid("setValue:forState:"),function(_50,_51,_52,_53){
with(_50){
_cache={};
if((_52===undefined)||(_52===nil)){
objj_msgSend(_values,"removeObjectForKey:",String(_53));
}else{
objj_msgSend(_values,"setObject:forKey:",_52,String(_53));
}
}
}),new objj_method(sel_getUid("value"),function(_54,_55){
with(_54){
return objj_msgSend(_54,"valueForState:",CPThemeStateNormal);
}
}),new objj_method(sel_getUid("valueForState:"),function(_56,_57,_58){
with(_56){
var _59=_cache[_58];
if(_59!==undefined){
return _59;
}
_59=objj_msgSend(_values,"objectForKey:",String(_58));
if((_59===undefined||_59===nil)&&_58!==CPThemeStateNormal){
if(_58&(_58-1)){
var _5a=0,_5b=objj_msgSend(_values,"allKeys"),_5c=_5b.length;
while(_5c--){
var _5d=Number(_5b[_5c]);
if((_5d&_58)===_5d){
var _5e=_5f[_5d];
if(_5e===undefined){
_5e=_60(_5d);
}
if(_5e>_5a){
_5a=_5e;
_59=objj_msgSend(_values,"objectForKey:",String(_5d));
}
}
}
}
if(_59===undefined||_59===nil){
_59=objj_msgSend(_values,"objectForKey:",String(CPThemeStateNormal));
}
}
if(_59===undefined||_59===nil){
_59=objj_msgSend(_parentAttribute,"valueForState:",_58);
}
if(_59===undefined||_59===nil){
_59=_defaultValue;
}
_cache[_58]=_59;
return _59;
}
}),new objj_method(sel_getUid("setParentAttribute:"),function(_61,_62,_63){
with(_61){
if(_parentAttribute===_63){
return;
}
_cache={};
_parentAttribute=_63;
}
}),new objj_method(sel_getUid("attributeMergedWithAttribute:"),function(_64,_65,_66){
with(_64){
var _67=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_name,_defaultValue);
_67._values=objj_msgSend(_values,"copy");
objj_msgSend(_67._values,"addEntriesFromDictionary:",_66._values);
return _67;
}
})]);
var _3=objj_getClass("_CPThemeAttribute");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPThemeAttribute\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_68,_69,_6a){
with(_68){
_68=objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPObject")},"init");
if(_68){
_cache={};
_name=objj_msgSend(_6a,"decodeObjectForKey:","name");
_values=objj_msgSend(CPDictionary,"dictionary");
if(objj_msgSend(_6a,"containsValueForKey:","value")){
var _6b=CPThemeStateNormal;
if(objj_msgSend(_6a,"containsValueForKey:","state")){
_6b=CPThemeState(objj_msgSend(_6a,"decodeObjectForKey:","state"));
}
objj_msgSend(_values,"setObject:forKey:",objj_msgSend(_6a,"decodeObjectForKey:","value"),_6b);
}else{
var _6c=objj_msgSend(_6a,"decodeObjectForKey:","values"),_6d=objj_msgSend(_6c,"allKeys"),_6e=_6d.length;
while(_6e--){
var key=_6d[_6e];
objj_msgSend(_values,"setObject:forKey:",objj_msgSend(_6c,"objectForKey:",key),CPThemeState(key));
}
}
}
return _68;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_71,"encodeObject:forKey:",_name,"name");
var _72=objj_msgSend(_values,"allKeys"),_73=_72.length;
if(_73===1){
var _74=_72[0];
if(Number(_74)!==CPThemeStateNormal){
objj_msgSend(_71,"encodeObject:forKey:",CPThemeStateName(Number(_74)),"state");
}
objj_msgSend(_71,"encodeObject:forKey:",objj_msgSend(_values,"objectForKey:",_74),"value");
}else{
var _75=objj_msgSend(CPDictionary,"dictionary");
while(_73--){
var key=_72[_73];
objj_msgSend(_75,"setObject:forKey:",objj_msgSend(_values,"objectForKey:",key),CPThemeStateName(Number(key)));
}
objj_msgSend(_71,"encodeObject:forKey:",_75,"values");
}
}
})]);
var _5f=[0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6];
var _60=function(_76){
var _77=0,_78=_76;
while(_76){
++_77;
_76&=(_76-1);
}
_5f[_78]=_77;
return _77;
};
_60.displayName="numberOfOnes";
CPThemeAttributeEncode=function(_79,_7a){
var _7b=_7a._values,_7c=objj_msgSend(_7b,"count"),key="$a"+objj_msgSend(_7a,"name");
if(_7c===1){
var _7d=objj_msgSend(_7b,"allKeys")[0];
if(Number(_7d)===0){
objj_msgSend(_79,"encodeObject:forKey:",objj_msgSend(_7b,"objectForKey:",_7d),key);
return YES;
}
}
if(_7c>=1){
objj_msgSend(_79,"encodeObject:forKey:",_7a,key);
return YES;
}
return NO;
};
CPThemeAttributeDecode=function(_7e,_7f,_80,_81,_82){
var key="$a"+_7f;
if(!objj_msgSend(_7e,"containsValueForKey:",key)){
var _83=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_7f,_80);
}else{
var _83=objj_msgSend(_7e,"decodeObjectForKey:",key);
if(!_83.isa||!objj_msgSend(_83,"isKindOfClass:",objj_msgSend(_CPThemeAttribute,"class"))){
var _84=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_7f,_80);
objj_msgSend(_84,"setValue:",_83);
_83=_84;
}
}
if(_81&&_82){
objj_msgSend(_83,"setParentAttribute:",objj_msgSend(_81,"_attributeWithName:forClass:",_7f,_82));
}
return _83;
};
p;14;CPThemeBlend.jI;21;Foundation/CPObject.jI;16;AppKit/CPTheme.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.jc;1364;
var _1=objj_allocateClassPair(CPObject,"CPThemeBlend"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_themes"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("themes"),function(_3,_4){
with(_3){
return _themes;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_bundle=objj_msgSend(objj_msgSend(CPBundle,"alloc"),"initWithPath:",_7+"/Info.plist");
}
return _5;
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_8,_9,_a){
with(_8){
_loadDelegate=_a;
objj_msgSend(_bundle,"loadWithDelegate:",_8);
}
}),new objj_method(sel_getUid("bundleDidFinishLoading:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_bundle,"objectForInfoDictionaryKey:","CPKeyedThemes"),_f=_e.length;
while(_f--){
var _10=objj_msgSend(_d,"pathForResource:",_e[_f]),_11=objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:",objj_msgSend(CPData,"dataWithString:",objj_files[_10].contents),_bundle);
objj_msgSend(_11,"decodeObjectForKey:","root");
objj_msgSend(_11,"finishDecoding");
}
objj_msgSend(_loadDelegate,"blendDidFinishLoading:",_b);
}
})]);
p;11;CPToolbar.jI;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;17354;
CPToolbarDisplayModeDefault=0;
CPToolbarDisplayModeIconAndLabel=1;
CPToolbarDisplayModeIconOnly=2;
CPToolbarDisplayModeLabelOnly=3;
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"CPToolbar"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_identifier"),new objj_ivar("_displayMode"),new objj_ivar("_showsBaselineSeparator"),new objj_ivar("_allowsUserCustomization"),new objj_ivar("_isVisible"),new objj_ivar("_delegate"),new objj_ivar("_itemIdentifiers"),new objj_ivar("_identifiedItems"),new objj_ivar("_defaultItems"),new objj_ivar("_allowedItems"),new objj_ivar("_selectableItems"),new objj_ivar("_items"),new objj_ivar("_itemsSortedByVisibilityPriority"),new objj_ivar("_toolbarView"),new objj_ivar("_window")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_items=[];
_identifier=_9;
_isVisible=YES;
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_7,_identifier);
}
return _7;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("identifier"),function(_d,_e){
with(_d){
return _identifier;
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("isVisible"),function(_11,_12){
with(_11){
return _isVisible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_13,_14,_15){
with(_13){
if(_isVisible===_15){
return;
}
_isVisible=_15;
objj_msgSend(_window,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("_window"),function(_16,_17){
with(_16){
return _window;
}
}),new objj_method(sel_getUid("_setWindow:"),function(_18,_19,_1a){
with(_18){
_window=_1a;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1b,_1c,_1d){
with(_1b){
if(_delegate==_1d){
return;
}
_delegate=_1d;
objj_msgSend(_1b,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("_loadConfiguration"),function(_1e,_1f){
with(_1e){
}
}),new objj_method(sel_getUid("_toolbarView"),function(_20,_21){
with(_20){
if(!_toolbarView){
_toolbarView=objj_msgSend(objj_msgSend(_CPToolbarView,"alloc"),"initWithFrame:",CPRectMake(0,0,1200,59));
objj_msgSend(_toolbarView,"setToolbar:",_20);
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
return _toolbarView;
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_22,_23){
with(_22){
if(!_delegate){
return;
}
var _24=objj_msgSend(_itemIdentifiers,"count");
if(!_24){
_itemIdentifiers=objj_msgSend(objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_22),"mutableCopy");
_24=objj_msgSend(_itemIdentifiers,"count");
}
_items=[];
var _25=0;
for(;_25<_24;++_25){
var _26=_itemIdentifiers[_25],_27=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_26);
if(!_27){
_27=objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_22,_26,YES);
}
_27=objj_msgSend(_27,"copy");
if(_27==nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_26));
}
objj_msgSend(_items,"addObject:",_27);
}
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_28,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}),new objj_method(sel_getUid("items"),function(_29,_2a){
with(_29){
return _items;
}
}),new objj_method(sel_getUid("visibleItems"),function(_2b,_2c){
with(_2b){
return objj_msgSend(_toolbarView,"visibleItems");
}
}),new objj_method(sel_getUid("itemsSortedByVisibilityPriority"),function(_2d,_2e){
with(_2d){
return _itemsSortedByVisibilityPriority;
}
}),new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_2f,_30,_31,_32){
with(_2f){
var _33=objj_msgSend(_identifiedItems,"objectForKey:",_31);
if(!_33){
_33=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_31);
if(_delegate&&!_33){
_33=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_2f,_31,_32),"copy");
if(!_33){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_31));
}
}
objj_msgSend(_identifiedItems,"setObject:forKey:",_33,_31);
}
return _33;
}
}),new objj_method(sel_getUid("_itemsWithIdentifiers:"),function(_34,_35,_36){
with(_34){
var _37=[];
for(var i=0;i<_36.length;i++){
objj_msgSend(_37,"addObject:",objj_msgSend(_34,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_36[i],NO));
}
return _37;
}
}),new objj_method(sel_getUid("_defaultToolbarItems"),function(_38,_39){
with(_38){
if(!_defaultItems){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
_defaultItems=objj_msgSend(_38,"_itemsWithIdentifiers:",objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_38));
}
}
return _defaultItems;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_3a,_3b){
with(_3a){
if(_3a!=objj_msgSend(CPToolbar,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("_addToolbar:forIdentifier:"),function(_3c,_3d,_3e,_3f){
with(_3c){
var _40=objj_msgSend(_1,"objectForKey:",_3f);
if(!_40){
_40=[];
objj_msgSend(_1,"setObject:forKey:",_40,_3f);
}
objj_msgSend(_40,"addObject:",_3e);
}
})]);
var _41="CPToolbarIdentifierKey",_42="CPToolbarDisplayModeKey",_43="CPToolbarShowsBaselineSeparatorKey",_44="CPToolbarAllowsUserCustomizationKey",_45="CPToolbarIsVisibleKey",_46="CPToolbarDelegateKey",_47="CPToolbarIdentifiedItemsKey",_48="CPToolbarDefaultItemsKey",_49="CPToolbarAllowedItemsKey",_4a="CPToolbarSelectableItemsKey";
var _3=objj_getClass("CPToolbar");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbar\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_4b,_4c,_4d){
with(_4b){
_4b=objj_msgSendSuper({receiver:_4b,super_class:objj_getClass("CPObject")},"init");
if(_4b){
_identifier=objj_msgSend(_4d,"decodeObjectForKey:",_41);
_displayMode=objj_msgSend(_4d,"decodeIntForKey:",_42);
_showsBaselineSeparator=objj_msgSend(_4d,"decodeBoolForKey:",_43);
_allowsUserCustomization=objj_msgSend(_4d,"decodeBoolForKey:",_44);
_isVisible=objj_msgSend(_4d,"decodeBoolForKey:",_45);
_identifiedItems=objj_msgSend(_4d,"decodeObjectForKey:",_47);
_defaultItems=objj_msgSend(_4d,"decodeObjectForKey:",_48);
_allowedItems=objj_msgSend(_4d,"decodeObjectForKey:",_49);
_selectableItems=objj_msgSend(_4d,"decodeObjectForKey:",_4a);
_items=[];
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_4b,_identifier);
objj_msgSend(_4b,"setDelegate:",objj_msgSend(_4d,"decodeObjectForKey:",_46));
}
return _4b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_50,"encodeObject:forKey:",_identifier,_41);
objj_msgSend(_50,"encodeInt:forKey:",_displayMode,_42);
objj_msgSend(_50,"encodeBool:forKey:",_showsBaselineSeparator,_43);
objj_msgSend(_50,"encodeBool:forKey:",_allowsUserCustomization,_44);
objj_msgSend(_50,"encodeBool:forKey:",_isVisible,_45);
objj_msgSend(_50,"encodeObject:forKey:",_identifiedItems,_47);
objj_msgSend(_50,"encodeObject:forKey:",_defaultItems,_48);
objj_msgSend(_50,"encodeObject:forKey:",_allowedItems,_49);
objj_msgSend(_50,"encodeObject:forKey:",_selectableItems,_4a);
objj_msgSend(_50,"encodeConditionalObject:forKey:",_delegate,_46);
}
})]);
var _51=nil,_52=nil,_53=nil;
var _54=5,_55=10,_56=20;
var _57=function(_58,_59,_5a,_5b){
return {index:_58,view:_59,label:_5a,minWidth:_5b};
};
var _3=objj_allocateClassPair(CPView,"_CPToolbarView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_toolbar"),new objj_ivar("_flexibleWidthIndexes"),new objj_ivar("_visibleFlexibleWidthIndexes"),new objj_ivar("_itemInfos"),new objj_ivar("_visibleItems"),new objj_ivar("_invisibleItems"),new objj_ivar("_additionalItemsButton"),new objj_ivar("_labelColor"),new objj_ivar("_labelShadowColor"),new objj_ivar("_minWidth")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5c,_5d,_5e){
with(_5c){
_5c=objj_msgSendSuper({receiver:_5c,super_class:objj_getClass("CPView")},"initWithFrame:",_5e);
if(_5c){
_minWidth=0;
_labelColor=objj_msgSend(CPColor,"blackColor");
_labelShadowColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.75);
_additionalItemsButton=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:pullsDown:",CGRectMake(0,0,10,15),YES);
objj_msgSend(_additionalItemsButton,"setBordered:",NO);
objj_msgSend(_additionalItemsButton,"setImagePosition:",CPImageOnly);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setShowsStateColumn:",NO);
objj_msgSend(_additionalItemsButton,"setAlternateImage:",_53);
}
return _5c;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_5f,_60,_61){
with(_5f){
_toolbar=_61;
}
}),new objj_method(sel_getUid("toolbar"),function(_62,_63){
with(_62){
return _toolbar;
}
}),new objj_method(sel_getUid("setLabelColor:"),function(_64,_65,_66){
with(_64){
if(_labelColor===_66){
return;
}
_labelColor=_66;
var _67=objj_msgSend(_toolbar,"items"),_68=objj_msgSend(_67,"count");
while(_68--){
objj_msgSend(objj_msgSend(_64,"labelForItem:",_67[_68]),"setTextColor:",_labelColor);
}
}
}),new objj_method(sel_getUid("setLabelShadowColor:"),function(_69,_6a,_6b){
with(_69){
if(_labelShadowColor===_6b){
return;
}
_labelShadowColor=_6b;
var _6c=objj_msgSend(_toolbar,"items"),_6d=objj_msgSend(_6c,"count");
while(_6d--){
objj_msgSend(objj_msgSend(_69,"labelForItem:",_6c[_6d]),"setTextShadowColor:",_labelShadowColor);
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(_6e,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_71,_72){
with(_71){
var _73=objj_msgSend(_toolbar,"items"),_74=CGRectGetWidth(objj_msgSend(_71,"bounds")),_75=_minWidth,_76=objj_msgSend(CPIndexSet,"indexSet"),_77=[];
_visibleItems=_73;
if(_74<_75){
_74-=_56;
_visibleItems=objj_msgSend(_visibleItems,"copy");
var _78=objj_msgSend(_toolbar,"itemsSortedByVisibilityPriority"),_79=_78.length;
while(_75>_74){
var _7a=_78[_79--];
_75-=objj_msgSend(_71,"minWidthForItem:",_7a)+_55;
objj_msgSend(_visibleItems,"removeObjectIdenticalTo:",_7a);
objj_msgSend(_77,"addObject:",_7a);
objj_msgSend(objj_msgSend(_71,"viewForItem:",_7a),"setHidden:",YES);
objj_msgSend(objj_msgSend(_71,"labelForItem:",_7a),"setHidden:",YES);
}
}
var _7b=_visibleItems.length,_7c=0;
while(_7b--){
var _7a=_visibleItems[_7b],_7d=objj_msgSend(_7a,"minSize"),_7e=objj_msgSend(_71,"viewForItem:",_7a);
if(_7d.width!=objj_msgSend(_7a,"maxSize").width){
objj_msgSend(_76,"addIndex:",_7b);
}else{
objj_msgSend(_7e,"setFrameSize:",CGSizeMake(objj_msgSend(_7a,"minSize").width,CGRectGetHeight(objj_msgSend(_7e,"frame"))));
}
objj_msgSend(_7e,"setHidden:",NO);
objj_msgSend(objj_msgSend(_71,"labelForItem:",_7a),"setHidden:",NO);
if(_7c<_7d.height){
_7c=_7d.height;
}
}
var _7f=_74-_75,_80=0;
while(_7f&&objj_msgSend(_76,"count")){
_80+=_7f/objj_msgSend(_76,"count");
_7f=0;
var _7b=CPNotFound;
while((_7b=objj_msgSend(_76,"indexGreaterThanIndex:",_7b))!=CPNotFound){
var _7a=_visibleItems[_7b];
_7e=objj_msgSend(_71,"viewForItem:",_7a),_81=objj_msgSend(_7e,"frame"),proposedWidth=objj_msgSend(_7a,"minSize").width+_80,constrainedWidth=MIN(proposedWidth,objj_msgSend(_7a,"maxSize").width);
if(constrainedWidth<proposedWidth){
objj_msgSend(_76,"removeIndex:",_7b);
_7f+=proposedWidth-constrainedWidth;
}
objj_msgSend(_7e,"setFrameSize:",CGSizeMake(constrainedWidth,CGRectGetHeight(_81)));
}
}
var _79=_visibleItems.length,x=_55,_82=[];
for(_7b=0;_7b<_79;++_7b){
var _7a=_visibleItems[_7b],_7e=objj_msgSend(_71,"viewForItem:",_7a),_81=objj_msgSend(_7e,"frame"),_83=CGRectGetWidth(_81),_84=objj_msgSend(_71,"labelForItem:",_7a),_85=objj_msgSend(_84,"frame"),_86=CGRectGetWidth(_85),_87=MAX(objj_msgSend(_71,"minWidthForItem:",_7a),_83),_88=CGRectGetHeight(_81);
objj_msgSend(_7e,"setFrame:",CGRectMake(x+(_87-_83)/2,_54+(_7c-_88)/2,_83,_88));
objj_msgSend(_84,"setFrameOrigin:",CGPointMake(x+(_87-_86)/2,_54+_7c+2));
x+=_87+_55;
if(objj_msgSend(_7a,"itemIdentifier")==CPToolbarSeparatorItemIdentifier){
_82.push(_7a);
}
}
for(_7b=0,_79=_82.length;_7b<_79;++_7b){
var _7e=objj_msgSend(_71,"viewForItem:",_82[_7b]),_88=53;
objj_msgSend(_7e,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_7e,"frame")),(59-_88)/2,CGRectGetWidth(objj_msgSend(_7e,"frame")),_88));
}
if(objj_msgSend(_77,"count")){
var _7b=0,_79=objj_msgSend(_73,"count");
_invisibleItems=[];
for(;_7b<_79;++_7b){
var _7a=_73[_7b];
if(objj_msgSend(_77,"indexOfObjectIdenticalTo:",_7a)!=CPNotFound){
objj_msgSend(_invisibleItems,"addObject:",_7a);
}
}
objj_msgSend(_additionalItemsButton,"setFrameOrigin:",CGPointMake(_74+5,(CGRectGetHeight(objj_msgSend(_71,"bounds"))-CGRectGetHeight(objj_msgSend(_additionalItemsButton,"frame")))/2));
objj_msgSend(_71,"addSubview:",_additionalItemsButton);
objj_msgSend(_additionalItemsButton,"removeAllItems");
var _7b=0,_79=objj_msgSend(_invisibleItems,"count");
objj_msgSend(_additionalItemsButton,"addItemWithTitle:","Additional Items");
objj_msgSend(objj_msgSend(_additionalItemsButton,"itemArray")[0],"setImage:",_52);
for(;_7b<_79;++_7b){
var _7a=_invisibleItems[_7b];
objj_msgSend(_additionalItemsButton,"addItemWithTitle:",objj_msgSend(_7a,"label"));
var _89=objj_msgSend(_additionalItemsButton,"itemArray")[_7b+1];
objj_msgSend(_89,"setImage:",objj_msgSend(_7a,"image"));
objj_msgSend(_89,"setTarget:",objj_msgSend(_7a,"target"));
objj_msgSend(_89,"setAction:",objj_msgSend(_7a,"action"));
}
}else{
objj_msgSend(_additionalItemsButton,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("viewForItem:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_8c,"UID"));
if(!_8d){
return nil;
}
return _8d.view;
}
}),new objj_method(sel_getUid("labelForItem:"),function(_8e,_8f,_90){
with(_8e){
var _91=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_90,"UID"));
if(!_91){
return nil;
}
return _91.label;
}
}),new objj_method(sel_getUid("minWidthForItem:"),function(_92,_93,_94){
with(_92){
var _95=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_94,"UID"));
if(!_95){
return 0;
}
return _95.minWidth;
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_96,_97){
with(_96){
var _98=objj_msgSend(_96,"subviews"),_99=_98.length;
while(_99--){
objj_msgSend(_98[_99],"removeFromSuperview");
}
var _9a=objj_msgSend(_toolbar,"items"),_9b=0;
_99=_9a.length;
_itemInfos=objj_msgSend(CPDictionary,"dictionary");
_minWidth=_55;
for(;_9b<_99;++_9b){
var _9c=_9a[_9b],_9d=objj_msgSend(_9c,"view");
if(!_9d){
_9d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,32));
objj_msgSend(_9d,"setBordered:",NO);
objj_msgSend(_9d,"setImage:",objj_msgSend(_9c,"image"));
objj_msgSend(_9d,"setAlternateImage:",objj_msgSend(_9c,"alternateImage"));
objj_msgSend(_9d,"setTarget:",objj_msgSend(_9c,"target"));
objj_msgSend(_9d,"setAction:",objj_msgSend(_9c,"action"));
objj_msgSend(_9d,"setTag:",objj_msgSend(_9c,"tag"));
objj_msgSend(_9d,"setImagePosition:",CPImageOnly);
}
objj_msgSend(_96,"addSubview:",_9d);
var _9e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_9e,"setStringValue:",objj_msgSend(_9c,"label"));
objj_msgSend(_9e,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_9e,"setTextColor:",_labelColor);
objj_msgSend(_9e,"setTextShadowColor:",_labelShadowColor);
objj_msgSend(_9e,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_9e,"sizeToFit");
objj_msgSend(_9e,"setTarget:",objj_msgSend(_9c,"target"));
objj_msgSend(_9e,"setAction:",objj_msgSend(_9c,"action"));
objj_msgSend(_96,"addSubview:",_9e);
var _9f=objj_msgSend(_9c,"minSize"),_a0=MAX(_9f.width,CGRectGetWidth(objj_msgSend(_9e,"frame")));
objj_msgSend(_itemInfos,"setObject:forKey:",_57(_9b,_9d,_9e,_a0),objj_msgSend(_9c,"UID"));
_minWidth+=_a0+_55;
}
objj_msgSend(_96,"layoutSubviews");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_a1,_a2){
with(_a1){
if(_a1!=objj_msgSend(_CPToolbarView,"class")){
return;
}
var _a3=objj_msgSend(CPBundle,"bundleForClass:",_a1);
_52=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a3,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),CPSizeMake(10,15));
_53=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a3,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"),CGSizeMake(10,15));
}
})]);
var _28=function(lhs,rhs){
var _a4=objj_msgSend(lhs,"visibilityPriority"),_a5=objj_msgSend(rhs,"visibilityPriority");
if(_a4==_a5){
return CPOrderedSame;
}
if(_a4>_a5){
return CPOrderedAscending;
}
return CPOrderedDescending;
};
p;15;CPToolbarItem.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;9830;
CPToolbarItemVisibilityPriorityStandard=0;
CPToolbarItemVisibilityPriorityLow=-1000;
CPToolbarItemVisibilityPriorityHigh=1000;
CPToolbarItemVisibilityPriorityUser=2000;
CPToolbarSeparatorItemIdentifier="CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier="CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier="CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier="CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier="CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier="CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier="CPToolbarPrintItemIdentifier";
var _1=objj_allocateClassPair(CPObject,"CPToolbarItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_itemIdentifier"),new objj_ivar("_toolbar"),new objj_ivar("_label"),new objj_ivar("_paletteLabel"),new objj_ivar("_toolTip"),new objj_ivar("_tag"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_view"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithItemIdentifier:","");
}
}),new objj_method(sel_getUid("initWithItemIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_itemIdentifier=_7;
_tag=0;
_isEnabled=YES;
_minSize=CGSizeMakeZero();
_maxSize=CGSizeMakeZero();
_visibilityPriority=CPToolbarItemVisibilityPriorityStandard;
}
return _5;
}
}),new objj_method(sel_getUid("itemIdentifier"),function(_8,_9){
with(_8){
return _itemIdentifier;
}
}),new objj_method(sel_getUid("toolbar"),function(_a,_b){
with(_a){
return _toolbar;
}
}),new objj_method(sel_getUid("label"),function(_c,_d){
with(_c){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_e,_f,_10){
with(_e){
_label=_10;
}
}),new objj_method(sel_getUid("paletteLabel"),function(_11,_12){
with(_11){
return _paletteLabel;
}
}),new objj_method(sel_getUid("setPaletteLabel:"),function(_13,_14,_15){
with(_13){
_paletteLabel=_15;
}
}),new objj_method(sel_getUid("toolTip"),function(_16,_17){
with(_16){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("toolTip"))){
return objj_msgSend(_view,"toolTip");
}
return _toolTip;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_18,_19,_1a){
with(_18){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(view,"setToolTip:",_1a);
}
_toolTip=_1a;
}
}),new objj_method(sel_getUid("tag"),function(_1b,_1c){
with(_1b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("tag"))){
return objj_msgSend(_view,"tag");
}
return _tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_1d,_1e,_1f){
with(_1d){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_1f);
}
_tag=_1f;
}
}),new objj_method(sel_getUid("target"),function(_20,_21){
with(_20){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("target"))?objj_msgSend(_view,"target"):nil;
}
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_22,_23,_24){
with(_22){
if(!_view){
_target=_24;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_view,"setTarget:",_24);
}
}
}
}),new objj_method(sel_getUid("action"),function(_25,_26){
with(_25){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("action"))?objj_msgSend(_view,"action"):nil;
}
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_27,_28,_29){
with(_27){
if(!_view){
_action=_29;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_view,"setAction:",_29);
}
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_2a,_2b){
with(_2a){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("isEnabled"))){
return objj_msgSend(_view,"isEnabled");
}
return _isEnabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_2c,_2d,_2e){
with(_2c){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_view,"setEnabled:",_2e);
}
_isEnabled=_2e;
}
}),new objj_method(sel_getUid("image"),function(_2f,_30){
with(_2f){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("image"))){
return objj_msgSend(_view,"image");
}
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_31,_32,_33){
with(_31){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setImage:"))){
objj_msgSend(_view,"setImage:",_33);
}
_image=_33;
if(!_image){
return;
}
if(_minSize.width==0&&_minSize.height==0&&_maxSize.width==0&&_maxSize.height==0){
var _34=objj_msgSend(_image,"size");
if(_34.width>0||_34.height>0){
objj_msgSend(_31,"setMinSize:",_34);
objj_msgSend(_31,"setMaxSize:",_34);
}
}
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAlternateImage:"))){
objj_msgSend(_view,"setAlternateImage:",_37);
}
_alternateImage=_37;
}
}),new objj_method(sel_getUid("alternateImage"),function(_38,_39){
with(_38){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("alternateIamge"))){
return objj_msgSend(_view,"alternateImage");
}
return _alternateImage;
}
}),new objj_method(sel_getUid("view"),function(_3a,_3b){
with(_3a){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_3c,_3d,_3e){
with(_3c){
if(_view==_3e){
return;
}
_view=_3e;
if(_view){
if(_tag!==0&&objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_tag);
}
_target=nil;
_action=nil;
}
}
}),new objj_method(sel_getUid("minSize"),function(_3f,_40){
with(_3f){
return _minSize;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_41,_42,_43){
with(_41){
_minSize=CGSizeMakeCopy(_43);
_maxSize=CGSizeMake(MAX(_minSize.width,_maxSize.width),MAX(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("maxSize"),function(_44,_45){
with(_44){
return _maxSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_46,_47,_48){
with(_46){
_maxSize=CGSizeMakeCopy(_48);
_minSize=CGSizeMake(MIN(_minSize.width,_maxSize.width),MIN(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("visibilityPriority"),function(_49,_4a){
with(_49){
return _visibilityPriority;
}
}),new objj_method(sel_getUid("setVisibilityPriority:"),function(_4b,_4c,_4d){
with(_4b){
_visibilityPriority=_4d;
}
})]);
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(objj_msgSend(objj_msgSend(_4e,"class"),"alloc"),"initWithItemIdentifier:",_itemIdentifier);
if(_view){
objj_msgSend(_50,"setView:",objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_view)));
}
objj_msgSend(_50,"setLabel:",_label);
objj_msgSend(_50,"setPaletteLabel:",_paletteLabel);
objj_msgSend(_50,"setToolTip:",objj_msgSend(_4e,"toolTip"));
objj_msgSend(_50,"setTag:",objj_msgSend(_4e,"tag"));
objj_msgSend(_50,"setTarget:",objj_msgSend(_4e,"target"));
objj_msgSend(_50,"setAction:",objj_msgSend(_4e,"action"));
objj_msgSend(_50,"setEnabled:",objj_msgSend(_4e,"isEnabled"));
objj_msgSend(_50,"setImage:",objj_msgSend(_4e,"image"));
objj_msgSend(_50,"setAlternateImage:",objj_msgSend(_4e,"alternateImage"));
objj_msgSend(_50,"setMinSize:",_minSize);
objj_msgSend(_50,"setMaxSize:",_maxSize);
objj_msgSend(_50,"setVisibilityPriority:",_visibilityPriority);
return _50;
}
})]);
var _51=nil,_52=nil;
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_separatorItemView"),function(_53,_54){
with(_53){
if(!_51){
_51=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,2,32));
sizes={};
sizes["CPToolbarItemSeparator"]=[CGSizeMake(2,26),CGSizeMake(2,1),CGSizeMake(2,26)];
objj_msgSend(_51,"setBackgroundColor:",_CPControlThreePartImagePattern(YES,sizes,"CPToolbarItem","Separator"));
}
return _51;
}
}),new objj_method(sel_getUid("_spaceItemView"),function(_55,_56){
with(_55){
if(!_52){
_52=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
return _52;
}
}),new objj_method(sel_getUid("_standardItemWithItemIdentifier:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_59);
switch(_59){
case CPToolbarSeparatorItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_separatorItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(2,0));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(2,100000));
return _5a;
case CPToolbarSpaceItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_spaceItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(32,32));
return _5a;
case CPToolbarFlexibleSpaceItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_spaceItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(10000,32));
return _5a;
case CPToolbarShowColorsItemIdentifier:
return nil;
case CPToolbarShowFontsItemIdentifier:
return nil;
case CPToolbarCustomizeToolbarItemIdentifier:
return nil;
case CPToolbarPrintItemIdentifier:
return nil;
}
return nil;
}
})]);
p;12;CPTreeNode.jI;21;Foundation/CPObject.jc;2368;
var _1=objj_allocateClassPair(CPObject,"CPTreeNode"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_representedObject"),new objj_ivar("_parentNode"),new objj_ivar("_childNodes")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("representedObject"),function(_3,_4){
with(_3){
return _representedObject;
}
}),new objj_method(sel_getUid("parentNode"),function(_5,_6){
with(_5){
return _parentNode;
}
}),new objj_method(sel_getUid("childNodes"),function(_7,_8){
with(_7){
return _childNodes;
}
}),new objj_method(sel_getUid("initWithRepresentedObject:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_representedObject=_b;
_childNodes=[];
}
return _9;
}
}),new objj_method(sel_getUid("isLeaf"),function(_c,_d){
with(_c){
return objj_msgSend(_childNodes,"count")<=0;
}
}),new objj_method(sel_getUid("mutableChildNodes"),function(_e,_f){
with(_e){
return objj_msgSend(_e,"mutableArrayValueForKey:","childNodes");
}
}),new objj_method(sel_getUid("insertObject:inChildNodesAtIndex:"),function(_10,_11,_12,_13){
with(_10){
_12._parentNode=_10;
objj_msgSend(_childNodes,"addObject:",_12);
}
}),new objj_method(sel_getUid("removeObjectFromChildNodesAtIndex:"),function(_14,_15,_16){
with(_14){
anObject._parentNode=nil;
objj_msgSend(_childNodes,"removeObjectAtIndex:",_16);
}
}),new objj_method(sel_getUid("replaceObjectFromChildNodesAtIndex:withObject:"),function(_17,_18,_19,_1a){
with(_17){
var _1b=objj_msgSend(_childNodes,"objectAtIndex:",_19);
_1b._parentNode=nil;
objj_msgSend(_childNodes,"replaceObjectAtIndex:withObject:",_19,_1a);
}
}),new objj_method(sel_getUid("objectInChildNodesAtIndex:"),function(_1c,_1d,_1e){
with(_1c){
return _childNodes[_1e];
}
}),new objj_method(sel_getUid("sortWithSortDescriptors:recursively:"),function(_1f,_20,_21,_22){
with(_1f){
objj_msgSend(_childNodes,"sortUsingDescriptors:",_21);
if(!_22){
return;
}
var _23=objj_msgSend(_childNodes,"count");
while(_23--){
objj_msgSend(_childNodes[_23],"sortWithSortDescriptors:recursively:",_21,YES);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("treeNodeWithRepresentedObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(objj_msgSend(_24,"alloc"),"initWithRepresentedObject:",_26);
}
})]);
p;8;CPView.jI;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jc;43711;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3={},_4=1<<0,_5=1<<1;
var _6=objj_allocateClassPair(CPResponder,"CPView"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("setupViewFlags"),function(_8,_9){
with(_8){
var _a=objj_msgSend(_8,"class"),_b=objj_msgSend(_a,"UID");
if(_3[_b]===undefined){
var _c=0;
if(objj_msgSend(_a,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_c|=_4;
}
if(objj_msgSend(_a,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_c|=_5;
}
_3[_b]=_c;
}
_viewClassFlags=_3[_b];
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPResponder")},"init");
if(_f){
var _12=(_11.size.width),_13=(_11.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_11.origin.x,y:_11.origin.y},size:{width:_11.size.width,height:_11.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_12,height:_13}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_f,"setupViewFlags");
objj_msgSend(_f,"_loadThemeAttributes");
}
return _f;
}
}),new objj_method(sel_getUid("superview"),function(_14,_15){
with(_14){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_16,_17){
with(_16){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_18,_19){
with(_18){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"_insertSubview:atIndex:",_1c,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
var _22=_21?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_21):CPNotFound;
if(_22===CPNotFound){
_22=(_20===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_20===CPWindowAbove){
++_22;
}
}
objj_msgSend(_1d,"_insertSubview:atIndex:",_1f,_22);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_23,_24,_25,_26){
with(_23){
var _27=_subviews.length;
objj_msgSend(objj_msgSend(_23,"window"),"_dirtyKeyViewLoop");
if(_25._superview==_23){
var _28=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_25);
if(_28===_26||_28===_27-1&&_26===_27){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_28);
if(_26>_28){
--_26;
}
--_27;
}else{
objj_msgSend(_25,"removeFromSuperview");
objj_msgSend(_25,"_setWindow:",_window);
objj_msgSend(_25,"viewWillMoveToSuperview:",_23);
_25._superview=_23;
}
if(_26===CPNotFound||_26>=_27){
_subviews.push(_25);
}else{
_subviews.splice(_26,0,_25);
}
objj_msgSend(_25,"setNextResponder:",_23);
objj_msgSend(_25,"viewDidMoveToSuperview");
objj_msgSend(_23,"didAddSubview:",_25);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_2c,_2d){
with(_2c){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_2c,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_2c);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_2c);
_superview=nil;
objj_msgSend(_2c,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30._superview!=_2e){
return;
}
var _32=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_30);
objj_msgSend(_30,"removeFromSuperview");
objj_msgSend(_2e,"_insertSubview:atIndex:",_31,_32);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_33,_34,_35){
with(_33){
if(_window===_35){
return;
}
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_33){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_33,"viewWillMoveToWindow:",_35);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_35,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_35;
var _36=objj_msgSend(_subviews,"count");
while(_36--){
objj_msgSend(_subviews[_36],"_setWindow:",_35);
}
objj_msgSend(_33,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_37,_38,_39){
with(_37){
var _3a=_37;
do{
if(_3a==_39){
return YES;
}
}while(_3a=objj_msgSend(_3a,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_3b,_3c){
with(_3b){
objj_msgSend(_3b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_3d,_3e){
with(_3d){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_48,_49){
with(_48){
var _4a=_48;
while(_4a&&!objj_msgSend(_4a,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_4a=objj_msgSend(_4a,"superview");
}
if(_4a){
return _4a._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_4b,_4c,_4d){
with(_4b){
_tag=_4d;
}
}),new objj_method(sel_getUid("tag"),function(_4e,_4f){
with(_4e){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_50,"tag")===_52){
return _50;
}
var _53=0,_54=_subviews.length;
for(;_53<_54;++_53){
var _55=objj_msgSend(_subviews[_53],"viewWithTag:",_52);
if(_55){
return _55;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_56,_57){
with(_56){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_58,_59,_5a){
with(_58){
if(((_frame.origin.x==_5a.origin.x&&_frame.origin.y==_5a.origin.y)&&(_frame.size.width==_5a.size.width&&_frame.size.height==_5a.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_58,"setFrameOrigin:",_5a.origin);
objj_msgSend(_58,"setFrameSize:",_5a.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_58);
}
}
}),new objj_method(sel_getUid("frame"),function(_5b,_5c){
with(_5b){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_5d,_5e){
with(_5d){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_5f,_60){
with(_5f){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setFrameOrigin:",CGPointMake(_63.x-_frame.size.width/2,_63.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_64,_65){
with(_64){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_66,_67,_68){
with(_66){
var _69=_frame.origin;
if(!_68||(_69.x==_68.x&&_69.y==_68.y)){
return;
}
_69.x=_68.x;
_69.y=_68.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_66);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=_frame.size;
if(!_6c||(_6d.width==_6c.width&&_6d.height==_6c.height)){
return;
}
var _6e={width:_6d.width,height:_6d.height};
_6d.width=_6c.width;
_6d.height=_6c.height;
if(YES){
_bounds.size.width=_6c.width;
_bounds.size.height=_6c.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_6a,"resizeSubviewsWithOldSize:",_6e);
}
objj_msgSend(_6a,"setNeedsLayout");
objj_msgSend(_6a,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6a);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_6f,_70,_71){
with(_6f){
if(((_bounds.origin.x==_71.origin.x&&_bounds.origin.y==_71.origin.y)&&(_bounds.size.width==_71.size.width&&_bounds.size.height==_71.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_6f,"setBoundsOrigin:",_71.origin);
objj_msgSend(_6f,"setBoundsSize:",_71.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6f);
}
}
}),new objj_method(sel_getUid("bounds"),function(_72,_73){
with(_72){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_74,_75,_76){
with(_74){
var _77=_bounds.origin;
if((_77.x==_76.x&&_77.y==_76.y)){
return;
}
_77.x=_76.x;
_77.y=_76.y;
if(_77.x!=0||_77.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_77.x,ty:-_77.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_74);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_78,_79,_7a){
with(_78){
var _7b=_bounds.size;
if((_7b.width==_7a.width&&_7b.height==_7a.height)){
return;
}
var _7c=_frame.size;
if(!(_7b.width==_7c.width&&_7b.height==_7c.height)){
var _7d=_bounds.origin;
_7d.x/=_7b.width/_7c.width;
_7d.y/=_7b.height/_7c.height;
}
_7b.width=_7a.width;
_7b.height=_7a.height;
if(!(_7b.width==_7c.width&&_7b.height==_7c.height)){
var _7d=_bounds.origin;
_7d.x*=_7b.width/_7c.width;
_7d.y*=_7b.height/_7c.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_78);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_7e,"autoresizingMask");
if(_81==CPViewNotSizable){
return;
}
var _82=_superview._frame,_83={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_82.size.width)-_80.width)/(((_81&CPViewMinXMargin)?1:0)+(_81&CPViewWidthSizable?1:0)+(_81&CPViewMaxXMargin?1:0)),dY=((_82.size.height)-_80.height)/((_81&CPViewMinYMargin?1:0)+(_81&CPViewHeightSizable?1:0)+(_81&CPViewMaxYMargin?1:0));
if(_81&CPViewMinXMargin){
_83.origin.x+=dX;
}
if(_81&CPViewWidthSizable){
_83.size.width+=dX;
}
if(_81&CPViewMinYMargin){
_83.origin.y+=dY;
}
if(_81&CPViewHeightSizable){
_83.size.height+=dY;
}
objj_msgSend(_7e,"setFrame:",_83);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_84,_85,_86){
with(_84){
var _87=_subviews.length;
while(_87--){
objj_msgSend(_subviews[_87],"resizeWithOldSuperviewSize:",_86);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_88,_89,_8a){
with(_88){
_autoresizesSubviews=!!_8a;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_8b,_8c){
with(_8b){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_8d,_8e,_8f){
with(_8d){
_autoresizingMask=_8f;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_90,_91){
with(_90){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_92,_93){
with(_92){
return objj_msgSend(_92,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_94,_95,_96,_97){
with(_94){
_fullScreenModeState=_98(_94);
var _99=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_99,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_99,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _9a=objj_msgSend(_99,"contentView");
objj_msgSend(_9a,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_9a,"addSubview:",_94);
objj_msgSend(_94,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_94,"setFrame:",CGRectMakeCopy(objj_msgSend(_9a,"bounds")));
objj_msgSend(_99,"makeKeyAndOrderFront:",_94);
objj_msgSend(_99,"makeFirstResponder:",_94);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_9b,_9c){
with(_9b){
objj_msgSend(_9b,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_9d,_9e,_9f){
with(_9d){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_9d,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_9d,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_9d,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_9d,"window"),"orderOut:",_9d);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_a0,_a1){
with(_a0){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_a2,_a3,_a4){
with(_a2){
_a4=!!_a4;
if(_isHidden===_a4){
return;
}
_isHidden=_a4;
if(_a4){
var _a5=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_a5,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_a2==_a5){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_a2,"nextValidKeyView"));
break;
}
}while(_a5=objj_msgSend(_a5,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_a6,_a7){
with(_a6){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_a8,_a9,_aa){
with(_a8){
if(_opacity==_aa){
return;
}
_opacity=_aa;
}
}),new objj_method(sel_getUid("alphaValue"),function(_ab,_ac){
with(_ab){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_ad,_ae){
with(_ad){
var _af=_ad;
while(_af&&!objj_msgSend(_af,"isHidden")){
_af=objj_msgSend(_af,"superview");
}
return _af!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_b0,_b1,_b2){
with(_b0){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_b3,_b4){
with(_b3){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_b5,_b6,_b7){
with(_b5){
_hitTests=!!_b7;
}
}),new objj_method(sel_getUid("hitTest:"),function(_b8,_b9,_ba){
with(_b8){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_ba)){
return nil;
}
var _bb=nil,i=_subviews.length,_bc={x:_ba.x-(_frame.origin.x),y:_ba.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_bc={x:_bc.x*_inverseBoundsTransform.a+_bc.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_bc.x*_inverseBoundsTransform.b+_bc.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_bb=objj_msgSend(_subviews[i],"hitTest:",_bc)){
return _bb;
}
}
return _b8;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_bd,_be){
with(_bd){
return !objj_msgSend(_bd,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_bf,_c0,_c1){
with(_bf){
if(objj_msgSend(_bf,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_bf,super_class:objj_getClass("CPResponder")},"mouseDown:",_c1);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_c2,_c3,_c4){
with(_c2){
if(_backgroundColor==_c4){
return;
}
_backgroundColor=_c4;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_c5,_c6){
with(_c5){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_c7,_c8,_c9,_ca){
with(_c7){
return CGPointApplyAffineTransform(_c9,_cb(_ca,_c7));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_cc,_cd,_ce,_cf){
with(_cc){
return CGPointApplyAffineTransform(_ce,_cb(_cc,_cf));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_d0,_d1,_d2,_d3){
with(_d0){
return CGSizeApplyAffineTransform(_d2,_cb(_d3,_d0));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_d4,_d5,_d6,_d7){
with(_d4){
return CGSizeApplyAffineTransform(_d6,_cb(_d4,_d7));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_d8,_d9,_da,_db){
with(_d8){
return CGRectApplyAffineTransform(_da,_cb(_db,_d8));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_dc,_dd,_de,_df){
with(_dc){
return CGRectApplyAffineTransform(_de,_cb(_dc,_df));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_e0,_e1,_e2){
with(_e0){
_e2=!!_e2;
if(_postsFrameChangedNotifications===_e2){
return;
}
_postsFrameChangedNotifications=_e2;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_e0);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_e3,_e4){
with(_e3){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_e5,_e6,_e7){
with(_e5){
_e7=!!_e7;
if(_postsBoundsChangedNotifications===_e7){
return;
}
_postsBoundsChangedNotifications=_e7;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_e5);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_e8,_e9){
with(_e8){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_ea,_eb,_ec,_ed,_ee,_ef,_f0,_f1,_f2){
with(_ea){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_ec,objj_msgSend(_ea,"convertPoint:toView:",_ed,nil),_ee,_ef,_f0,_f1,_f2);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f3,_f4,_f5,_f6,_f7,_f8,_f9,_fa,_fb){
with(_f3){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_f5,objj_msgSend(_f3,"convertPoint:toView:",_f6,nil),_f7,_f8,_f9,_fa,_fb);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_fc,_fd,_fe){
with(_fc){
if(!_fe||!objj_msgSend(_fe,"count")){
return;
}
var _ff=objj_msgSend(_fc,"window");
objj_msgSend(_ff,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_fe);
objj_msgSend(_ff,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_100){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_101){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_102,_103){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_104,_105){
with(self){
if(_105){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_106,_107){
with(self){
if(!(_viewClassFlags&_4)){
return;
}
if((_107.size.width<=0||_107.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_107,_dirtyRect);
}else{
_dirtyRect={origin:{x:_107.origin.x,y:_107.origin.y},size:{width:_107.size.width,height:_107.size.height}};
}
_CPDisplayServerAddDisplayObject(self);
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_108){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_109){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_10a){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_10b,_10c){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_10c);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_10d,_10e){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_10e,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_10f,_110,_111){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_110);
objj_msgSend(self,"drawRect:",_110);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_112){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_113){
with(self){
if(!_graphicsContext){
var _114=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_114.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_114,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_115){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_116){
with(self){
if(!(_viewClassFlags&_5)){
return;
}
_needsLayout=YES;
_CPDisplayServerAddLayoutObject(self);
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_117){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_118){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_119){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_11a){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_11b){
with(self){
var _11c=_superview,_11d=objj_msgSend(CPClipView,"class");
while(_11c&&!objj_msgSend(_11c,"isKindOfClass:",_11d)){
_11c=_11c._superview;
}
return _11c;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_11e,_11f){
with(self){
var _120=objj_msgSend(self,"_enclosingClipView");
if(!_120){
return;
}
objj_msgSend(_120,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_11f,_120));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_121,_122){
with(self){
var _123=objj_msgSend(self,"visibleRect");
_122=CGRectIntersection(_122,_bounds);
if((_122.size.width<=0||_122.size.height<=0)||CGRectContainsRect(_123,_122)){
return NO;
}
var _124=objj_msgSend(self,"_enclosingClipView");
if(!_124){
return NO;
}
var _125={x:_123.origin.x,y:_123.origin.y};
if((_122.origin.x)<=(_123.origin.x)){
_125.x=(_122.origin.x);
}else{
if((_122.origin.x+_122.size.width)>(_123.origin.x+_123.size.width)){
_125.x+=(_122.origin.x+_122.size.width)-(_123.origin.x+_123.size.width);
}
}
if((_122.origin.y)<=(_123.origin.y)){
_125.y=CGRectGetMinY(_122);
}else{
if((_122.origin.y+_122.size.height)>(_123.origin.y+_123.size.height)){
_125.y+=(_122.origin.y+_122.size.height)-(_123.origin.y+_123.size.height);
}
}
objj_msgSend(_124,"scrollToPoint:",CGPointMake(_125.x,_125.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_126,_127){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_127);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_128,_129){
with(self){
return _129;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_12a,_12b,_12c){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_12d){
with(self){
var _12e=_superview,_12f=objj_msgSend(CPScrollView,"class");
while(_12e&&!objj_msgSend(_12e,"isKindOfClass:",_12f)){
_12e=_12e._superview;
}
return _12e;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_130,_131,_132){
with(self){
objj_msgSend(_131,"scrollToPoint:",_132);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_133,_134){
with(self){
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(self,_135){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_136){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("performKeyEquivalent:"),function(self,_137,_138){
with(self){
var _139=objj_msgSend(self,"subviews"),_13a=objj_msgSend(_139,"count");
while(_13a--){
if(objj_msgSend(_139[_13a],"performKeyEquivalent:",_138)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("canBecomeKeyView"),function(self,_13b){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_13c){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_13d){
with(self){
var _13e=objj_msgSend(self,"nextKeyView");
while(_13e&&!objj_msgSend(_13e,"canBecomeKeyView")){
_13e=objj_msgSend(_13e,"nextKeyView");
}
return _13e;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_13f){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_140){
with(self){
var _141=objj_msgSend(self,"previousKeyView");
while(_141&&!objj_msgSend(_141,"canBecomeKeyView")){
_141=objj_msgSend(_141,"previousKeyView");
}
return _141;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_142,_143){
with(self){
_previousKeyView=_143;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_144,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("setLayer:"),function(self,_145,_146){
with(self){
if(_layer==_146){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_146;
if(_layer){
var _147=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_148){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_149,_14a){
with(self){
_wantsLayer=!!_14a;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_14b){
with(self){
return _wantsLayer;
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("themeState"),function(self,_14c){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_14d,_14e){
with(self){
return !!(_themeState&((typeof _14e==="string")?CPThemeState(_14e):_14e));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_14f,_150){
with(self){
var _151=(typeof _150==="string")?CPThemeState(_150):_150;
if(_themeState&_151){
return NO;
}
_themeState|=_151;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_152,_153){
with(self){
var _154=((typeof _153==="string")?CPThemeState(_153):_153);
if(!(_themeState&_154)){
return NO;
}
_themeState&=~_154;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_155){
with(self){
var _156=objj_msgSend(self,"class"),_157=objj_msgSend(_156,"_themeAttributes"),_158=_157.length;
if(!_158){
return;
}
var _159=objj_msgSend(self,"theme"),_15a=objj_msgSend(_156,"themeClass");
_themeAttributes={};
while(_158--){
var _15b=_157[_158--],_15c=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_15b,_157[_158]);
objj_msgSend(_15c,"setParentAttribute:",objj_msgSend(_159,"_attributeWithName:forClass:",_15b,_15a));
_themeAttributes[_15b]=_15c;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_15d,_15e){
with(self){
if(_theme===_15e){
return;
}
_theme=_15e;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_15f){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_160){
with(self){
if(!_themeAttributes){
return;
}
var _161=objj_msgSend(self,"theme"),_162=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _163 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_163)){
objj_msgSend(_themeAttributes[_163],"setParentAttribute:",objj_msgSend(_161,"_attributeWithName:forClass:",_163,_162));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_164){
with(self){
var _165=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _166=objj_msgSend(self,"theme");
for(var _167 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_167)){
objj_msgSend(_165,"setObject:forKey:",_themeAttributes[_167],_167);
}
}
}
return _165;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_168,_169,_16a,_16b){
with(self){
if(!_themeAttributes||!_themeAttributes[_16a]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_16a+"'");
}
var _16c=objj_msgSend(self,"currentValueForThemeAttribute:",_16a);
objj_msgSend(_themeAttributes[_16a],"setValue:forState:",_169,_16b);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_16a)===_16c){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_16d,_16e,_16f){
with(self){
if(!_themeAttributes||!_themeAttributes[_16f]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_16f+"'");
}
var _170=objj_msgSend(self,"currentValueForThemeAttribute:",_16f);
objj_msgSend(_themeAttributes[_16f],"setValue:",_16e);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_16f)===_170){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_171,_172,_173){
with(self){
if(!_themeAttributes||!_themeAttributes[_172]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_172+"'");
}
return objj_msgSend(_themeAttributes[_172],"valueForState:",_173);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_174,_175){
with(self){
if(!_themeAttributes||!_themeAttributes[_175]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_175+"'");
}
return objj_msgSend(_themeAttributes[_175],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_176,_177){
with(self){
if(!_themeAttributes||!_themeAttributes[_177]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_177+"'");
}
return objj_msgSend(_themeAttributes[_177],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_178,_179){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_17a,_17b){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_17c,_17d,_17e,_17f){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _180=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_17d);
if(_180&&!(_180.size.width<=0||_180.size.height<=0)){
if(!_ephemeralSubviewsForNames[_17d]){
_ephemeralSubviewsForNames[_17d]=objj_msgSend(self,"createEphemeralSubviewNamed:",_17d);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_17d]);
if(_ephemeralSubviewsForNames[_17d]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_17d],_17e,_ephemeralSubviewsForNames[_17f]);
}
}
if(_ephemeralSubviewsForNames[_17d]){
objj_msgSend(_ephemeralSubviewsForNames[_17d],"setFrame:",_180);
}
}else{
if(_ephemeralSubviewsForNames[_17d]){
objj_msgSend(_ephemeralSubviewsForNames[_17d],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_17d]);
delete _ephemeralSubviewsForNames[_17d];
}
}
return _ephemeralSubviewsForNames[_17d];
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("themeClass"),function(self,_181){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_182){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_183){
with(self){
if(!_2){
_2={};
}
var _184=objj_msgSend(self,"class"),_185=objj_msgSend(CPView,"class"),_186=[];
for(;_184&&_184!==_185;_184=objj_msgSend(_184,"superclass")){
var _187=_2[class_getName(_184)];
if(_187){
_186=_186.length?_186.concat(_187):_186;
_2[objj_msgSend(self,"className")]=_186;
break;
}
var _188=objj_msgSend(_184,"themeAttributes");
if(!_188){
continue;
}
var _189=objj_msgSend(_188,"allKeys"),_18a=_189.length;
while(_18a--){
var _18b=_189[_18a];
_186.push(objj_msgSend(_188,"objectForKey:",_18b));
_186.push(_18b);
}
}
return _186;
}
})]);
var _18c="CPViewAutoresizingMask",_18d="CPViewAutoresizesSubviews",_18e="CPViewBackgroundColor",_18f="CPViewBoundsKey",_190="CPViewFrameKey",_191="CPViewHitTestsKey",_192="CPViewIsHiddenKey",_193="CPViewOpacityKey",_194="CPViewSubviewsKey",_195="CPViewSuperviewKey",_196="CPViewTagKey",_197="CPViewThemeStateKey",_198="CPViewWindowKey",_199="CPViewNextKeyViewKey",_19a="CPViewPreviousKeyViewKey";
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(self,_19b,_19c){
with(self){
_frame=objj_msgSend(_19c,"decodeRectForKey:",_190);
_bounds=objj_msgSend(_19c,"decodeRectForKey:",_18f);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_19c);
if(self){
_tag=objj_msgSend(_19c,"containsValueForKey:",_196)?objj_msgSend(_19c,"decodeIntForKey:",_196):-1;
_window=objj_msgSend(_19c,"decodeObjectForKey:",_198);
_subviews=objj_msgSend(_19c,"decodeObjectForKey:",_194)||[];
_superview=objj_msgSend(_19c,"decodeObjectForKey:",_195);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_19c,"decodeIntForKey:",_18c)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_19c,"containsValueForKey:",_18d)||objj_msgSend(_19c,"decodeBoolForKey:",_18d);
_hitTests=!objj_msgSend(_19c,"containsValueForKey:",_191)||objj_msgSend(_19c,"decodeObjectForKey:",_191);
if(objj_msgSend(_19c,"containsValueForKey:",_192)){
objj_msgSend(self,"setHidden:",objj_msgSend(_19c,"decodeBoolForKey:",_192));
}else{
_isHidden=NO;
}
if(objj_msgSend(_19c,"containsValueForKey:",_193)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_19c,"decodeIntForKey:",_193));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_19c,"decodeObjectForKey:",_18e));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_19c,"decodeIntForKey:",_197));
_themeAttributes={};
var _19d=objj_msgSend(self,"class"),_19e=objj_msgSend(_19d,"themeClass"),_19f=objj_msgSend(_19d,"_themeAttributes"),_1a0=_19f.length;
while(_1a0--){
var _1a1=_19f[_1a0--];
_themeAttributes[_1a1]=CPThemeAttributeDecode(_19c,_1a1,_19f[_1a0],_theme,_19e);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_1a2,_1a3){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1a3);
if(_tag!==-1){
objj_msgSend(_1a3,"encodeInt:forKey:",_tag,_196);
}
objj_msgSend(_1a3,"encodeRect:forKey:",_frame,_190);
objj_msgSend(_1a3,"encodeRect:forKey:",_bounds,_18f);
if(_window!==nil){
objj_msgSend(_1a3,"encodeConditionalObject:forKey:",_window,_198);
}
var _1a4=objj_msgSend(_subviews,"count"),_1a5=_subviews;
if(_1a4>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1a5=objj_msgSend(_1a5,"copy");
while(_1a4--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1a5[_1a4])){
_1a5.splice(_1a4,1);
}
}
}
if(_1a5.length>0){
objj_msgSend(_1a3,"encodeObject:forKey:",_1a5,_194);
}
if(_superview!==nil){
objj_msgSend(_1a3,"encodeConditionalObject:forKey:",_superview,_195);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1a3,"encodeInt:forKey:",_autoresizingMask,_18c);
}
if(!_autoresizesSubviews){
objj_msgSend(_1a3,"encodeBool:forKey:",_autoresizesSubviews,_18d);
}
if(_backgroundColor!==nil){
objj_msgSend(_1a3,"encodeObject:forKey:",_backgroundColor,_18e);
}
if(_hitTests!==YES){
objj_msgSend(_1a3,"encodeBool:forKey:",_hitTests,_191);
}
if(_opacity!==1){
objj_msgSend(_1a3,"encodeFloat:forKey:",_opacity,_193);
}
if(_isHidden){
objj_msgSend(_1a3,"encodeBool:forKey:",_isHidden,_192);
}
var _1a6=objj_msgSend(self,"nextKeyView");
if(_1a6!==nil){
objj_msgSend(_1a3,"encodeConditionalObject:forKey:",_1a6,_199);
}
var _1a7=objj_msgSend(self,"previousKeyView");
if(_1a7!==nil){
objj_msgSend(_1a3,"encodeConditionalObject:forKey:",_1a7,_19a);
}
objj_msgSend(_1a3,"encodeInt:forKey:",CPThemeStateName(_themeState),_197);
for(var _1a8 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1a8)){
CPThemeAttributeEncode(_1a3,_themeAttributes[_1a8]);
}
}
}
})]);
var _98=function(_1a9){
var _1aa=_1a9._superview;
return {autoresizingMask:_1a9._autoresizingMask,frame:CGRectMakeCopy(_1a9._frame),index:(_1aa?objj_msgSend(_1aa._subviews,"indexOfObjectIdenticalTo:",_1a9):0),superview:_1aa};
};
var _cb=function(_1ab,_1ac){
var _1ad=CGAffineTransformMakeIdentity(),_1ae=YES,_1af=nil,_1b0=nil;
if(_1ab){
var view=_1ab;
while(view&&view!=_1ac){
var _1b1=view._frame;
_1ad.tx+=(_1b1.origin.x);
_1ad.ty+=(_1b1.origin.y);
if(view._boundsTransform){
var tx=_1ad.tx*view._boundsTransform.a+_1ad.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1ad.ty=_1ad.tx*view._boundsTransform.b+_1ad.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1ad.tx=tx;
var a=_1ad.a*view._boundsTransform.a+_1ad.b*view._boundsTransform.c,b=_1ad.a*view._boundsTransform.b+_1ad.b*view._boundsTransform.d,c=_1ad.c*view._boundsTransform.a+_1ad.d*view._boundsTransform.c;
_1ad.d=_1ad.c*view._boundsTransform.b+_1ad.d*view._boundsTransform.d;
_1ad.a=a;
_1ad.b=b;
_1ad.c=c;
}
view=view._superview;
}
if(view===_1ac){
return _1ad;
}else{
if(_1ab&&_1ac){
_1af=objj_msgSend(_1ab,"window");
_1b0=objj_msgSend(_1ac,"window");
if(_1af&&_1b0&&_1af!==_1b0){
_1ae=NO;
var _1b1=objj_msgSend(_1af,"frame");
_1ad.tx+=(_1b1.origin.x);
_1ad.ty+=(_1b1.origin.y);
}
}
}
}
var view=_1ac;
while(view){
var _1b1=view._frame;
_1ad.tx-=(_1b1.origin.x);
_1ad.ty-=(_1b1.origin.y);
if(view._boundsTransform){
var tx=_1ad.tx*view._inverseBoundsTransform.a+_1ad.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1ad.ty=_1ad.tx*view._inverseBoundsTransform.b+_1ad.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1ad.tx=tx;
var a=_1ad.a*view._inverseBoundsTransform.a+_1ad.b*view._inverseBoundsTransform.c,b=_1ad.a*view._inverseBoundsTransform.b+_1ad.b*view._inverseBoundsTransform.d,c=_1ad.c*view._inverseBoundsTransform.a+_1ad.d*view._inverseBoundsTransform.c;
_1ad.d=_1ad.c*view._inverseBoundsTransform.b+_1ad.d*view._inverseBoundsTransform.d;
_1ad.a=a;
_1ad.b=b;
_1ad.c=c;
}
view=view._superview;
}
if(!_1ae){
var _1b1=objj_msgSend(_1b0,"frame");
_1ad.tx-=(_1b1.origin.x);
_1ad.ty-=(_1b1.origin.y);
}
return _1ad;
};
p;18;CPViewController.jI;20;AppKit/CPResponder.jc;4478;
var _1=objj_allocateClassPair(CPResponder,"CPViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_view"),new objj_ivar("_representedObject"),new objj_ivar("_title"),new objj_ivar("_cibName"),new objj_ivar("_cibBundle"),new objj_ivar("_cibExternalNameTable")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("representedObject"),function(_3,_4){
with(_3){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_5,_6,_7){
with(_5){
_representedObject=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
_title=_c;
}
}),new objj_method(sel_getUid("cibName"),function(_d,_e){
with(_d){
return _cibName;
}
}),new objj_method(sel_getUid("cibBundle"),function(_f,_10){
with(_f){
return _cibBundle;
}
}),new objj_method(sel_getUid("cibExternalNameTable"),function(_11,_12){
with(_11){
return _cibExternalNameTable;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
return objj_msgSend(_13,"initWithCibName:bundle:",nil,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:"),function(_15,_16,_17,_18){
with(_15){
return objj_msgSend(_15,"initWithCibName:bundle:externalNameTable:",_17,_18,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:owner:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
return objj_msgSend(_19,"initWithCibName:bundle:externalNameTable:",_1b,_1c,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1d,CPCibOwner));
}
}),new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("CPResponder")},"init");
if(_1e){
_cibName=_20;
_cibBundle=_21||objj_msgSend(CPBundle,"mainBundle");
_cibExternalNameTable=_22||objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1e,CPCibOwner);
}
return _1e;
}
}),new objj_method(sel_getUid("loadView"),function(_23,_24){
with(_23){
if(_view){
return;
}
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",objj_msgSend(_cibBundle,"pathForResource:",_cibName+".cib"));
objj_msgSend(cib,"instantiateCibWithExternalNameTable:",_cibExternalNameTable);
}
}),new objj_method(sel_getUid("view"),function(_25,_26){
with(_25){
if(!_view){
var _27=objj_msgSend(_cibExternalNameTable,"objectForKey:",CPCibOwner);
if(objj_msgSend(_27,"respondsToSelector:",sel_getUid("viewControllerWillLoadCib:"))){
objj_msgSend(_27,"viewControllerWillLoadCib:",_25);
}
objj_msgSend(_25,"loadView");
if(_view===nil&&objj_msgSend(_27,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_25,"setView:",objj_msgSend(_27,"valueForKey:","view"));
}
if(objj_msgSend(_27,"respondsToSelector:",sel_getUid("viewControllerDidLoadCib:"))){
objj_msgSend(_27,"viewControllerDidLoadCib:",_25);
}
}
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_28,_29,_2a){
with(_28){
_view=_2a;
}
})]);
var _2b="CPViewControllerViewKey",_2c="CPViewControllerTitleKey",_2d="CPViewControllerCibNameKey",_2e="CPViewControllerBundleKey";
var _1=objj_getClass("CPViewController");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPViewController\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2f,_30,_31){
with(_2f){
_2f=objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("CPResponder")},"initWithCoder:",_31);
if(_2f){
_view=objj_msgSend(_31,"decodeObjectForKey:",_2b);
_title=objj_msgSend(_31,"decodeObjectForKey:",_2c);
_cibName=objj_msgSend(_31,"decodeObjectForKey:",_2d);
var _32=objj_msgSend(_31,"decodeObjectForKey:",_2e);
_cibBundle=_32?objj_msgSend(CPBundle,"bundleWithPath:",_32):objj_msgSend(CPBundle,"mainBundle");
_cibExternalNameTable=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_2f,CPCibOwner);
}
return _2f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_33,_34,_35){
with(_33){
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_35);
objj_msgSend(_35,"encodeObject:forKey:",_view,_2b);
objj_msgSend(_35,"encodeObject:forKey:",_title,_2c);
objj_msgSend(_35,"encodeObject:forKey:",_cibName,_2d);
objj_msgSend(_35,"encodeObject:forKey:",objj_msgSend(_cibBundle,"bundlePath"),_2e);
}
})]);
p;11;CPWebView.jI;15;AppKit/CPView.jc;13060;
CPWebViewProgressStartedNotification="CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification="CPWebViewProgressFinishedNotification";
CPWebViewScrollAppKit=1;
CPWebViewScrollNative=2;
var _1=objj_allocateClassPair(CPView,"CPWebView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_scrollView"),new objj_ivar("_frameView"),new objj_ivar("_iframe"),new objj_ivar("_mainFrameURL"),new objj_ivar("_backwardStack"),new objj_ivar("_forwardStack"),new objj_ivar("_ignoreLoadStart"),new objj_ivar("_ignoreLoadEnd"),new objj_ivar("_downloadDelegate"),new objj_ivar("_frameLoadDelegate"),new objj_ivar("_policyDelegate"),new objj_ivar("_resourceLoadDelegate"),new objj_ivar("_UIDelegate"),new objj_ivar("_wso"),new objj_ivar("_url"),new objj_ivar("_html"),new objj_ivar("_loadCallback"),new objj_ivar("_scrollMode"),new objj_ivar("_scrollSize")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:frameName:groupName:"),function(_3,_4,_5,_6,_7){
with(_3){
if(_3=objj_msgSend(_3,"initWithFrame:",_5)){
_iframe.name=_6;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPView")},"initWithFrame:",_a)){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
_scrollMode=CPWebViewScrollNative;
objj_msgSend(_8,"_initDOMWithFrame:",_a);
}
return _8;
}
}),new objj_method(sel_getUid("_initDOMWithFrame:"),function(_b,_c,_d){
with(_b){
_ignoreLoadStart=YES;
_ignoreLoadEnd=YES;
_iframe=document.createElement("iframe");
_iframe.name="iframe_"+Math.floor(Math.random()*10000);
_iframe.style.width="100%";
_iframe.style.height="100%";
_iframe.style.borderWidth="0px";
objj_msgSend(_b,"setDrawsBackground:",YES);
_loadCallback=function(){
if(!_ignoreLoadStart){
objj_msgSend(_b,"_startedLoading");
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_iframe.src;
_mainFrameURL=_iframe.src;
objj_msgSend(_forwardStack,"removeAllObjects");
}else{
_ignoreLoadStart=NO;
}
if(!_ignoreLoadEnd){
objj_msgSend(_b,"_finishedLoading");
}else{
_ignoreLoadEnd=NO;
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(_iframe.addEventListener){
_iframe.addEventListener("load",_loadCallback,false);
}else{
if(_iframe.attachEvent){
_iframe.attachEvent("onload",_loadCallback);
}
}
_frameView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_b,"bounds"));
_scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",objj_msgSend(_b,"bounds"));
objj_msgSend(_scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_scrollView,"setDocumentView:",_frameView);
_frameView._DOMElement.appendChild(_iframe);
objj_msgSend(_b,"_setScrollMode:",_scrollMode);
objj_msgSend(_b,"addSubview:",_scrollView);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_e,_f,_10){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"setFrameSize:",_10);
objj_msgSend(_e,"_resizeWebFrame");
}
}),new objj_method(sel_getUid("_resizeWebFrame"),function(_11,_12){
with(_11){
if(_scrollMode===CPWebViewScrollAppKit){
if(_scrollSize){
objj_msgSend(_frameView,"setFrameSize:",_scrollSize);
}else{
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"bounds").size);
var win=null;
try{
win=objj_msgSend(_11,"DOMWindow");
}
catch(e){
}
if(win&&win.document){
var _13=win.document.body.scrollWidth,_14=win.document.body.scrollHeight;
_iframe.setAttribute("width",_13);
_iframe.setAttribute("height",_14);
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(_13,_14));
}else{
CPLog.warn("using default size 800*1600");
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(800,1600));
}
}
}
}
}),new objj_method(sel_getUid("setScrollMode:"),function(_15,_16,_17){
with(_15){
if(_scrollMode==_17){
return;
}
objj_msgSend(_15,"_setScrollMode:",_17);
}
}),new objj_method(sel_getUid("_setScrollMode:"),function(_18,_19,_1a){
with(_18){
_scrollMode=_1a;
_ignoreLoadStart=YES;
_ignoreLoadEnd=YES;
var _1b=_iframe.parentNode;
_1b.removeChild(_iframe);
if(_scrollMode===CPWebViewScrollAppKit){
objj_msgSend(_scrollView,"setHasHorizontalScroller:",YES);
objj_msgSend(_scrollView,"setHasVerticalScroller:",YES);
_iframe.setAttribute("scrolling","no");
}else{
objj_msgSend(_scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_scrollView,"setHasVerticalScroller:",NO);
_iframe.setAttribute("scrolling","auto");
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"bounds").size);
}
_1b.appendChild(_iframe);
}
}),new objj_method(sel_getUid("loadHTMLString:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"loadHTMLString:baseURL:",_1e,nil);
}
}),new objj_method(sel_getUid("loadHTMLString:baseURL:"),function(_1f,_20,_21,URL){
with(_1f){
objj_msgSend(_1f,"_setScrollMode:",CPWebViewScrollAppKit);
objj_msgSend(_1f,"_startedLoading");
_ignoreLoadStart=YES;
_ignoreLoadEnd=NO;
_url=null;
_html=_21;
objj_msgSend(_1f,"_load");
}
}),new objj_method(sel_getUid("_loadMainFrameURL"),function(_22,_23){
with(_22){
objj_msgSend(_22,"_setScrollMode:",CPWebViewScrollNative);
objj_msgSend(_22,"_startedLoading");
_ignoreLoadStart=YES;
_ignoreLoadEnd=NO;
_url=_mainFrameURL;
_html=null;
objj_msgSend(_22,"_load");
}
}),new objj_method(sel_getUid("_load"),function(_24,_25){
with(_24){
if(_url){
_iframe.src=_url;
}else{
if(_html){
_iframe.src="";
window.setTimeout(function(){
var win=objj_msgSend(_24,"DOMWindow");
win.document.write(_html);
window.setTimeout(_loadCallback,1);
},0);
}
}
}
}),new objj_method(sel_getUid("_startedLoading"),function(_26,_27){
with(_26){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressStartedNotification,_26);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didStartProvisionalLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didStartProvisionalLoadForFrame:",_26,nil);
}
}
}),new objj_method(sel_getUid("_finishedLoading"),function(_28,_29){
with(_28){
objj_msgSend(_28,"_resizeWebFrame");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressFinishedNotification,_28);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didFinishLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didFinishLoadForFrame:",_28,nil);
}
}
}),new objj_method(sel_getUid("mainFrameURL"),function(_2a,_2b){
with(_2a){
return _mainFrameURL;
}
}),new objj_method(sel_getUid("setMainFrameURL:"),function(_2c,_2d,_2e){
with(_2c){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_2e;
objj_msgSend(_forwardStack,"removeAllObjects");
objj_msgSend(_2c,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("goBack"),function(_2f,_30){
with(_2f){
if(_backwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_forwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_backwardStack,"lastObject");
objj_msgSend(_backwardStack,"removeLastObject");
objj_msgSend(_2f,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("goForward"),function(_31,_32){
with(_31){
if(_forwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_forwardStack,"lastObject");
objj_msgSend(_forwardStack,"removeLastObject");
objj_msgSend(_31,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("canGoBack"),function(_33,_34){
with(_33){
return (_backwardStack.length>0);
}
}),new objj_method(sel_getUid("canGoForward"),function(_35,_36){
with(_35){
return (_forwardStack.length>0);
}
}),new objj_method(sel_getUid("backForwardList"),function(_37,_38){
with(_37){
return {back:_backwardStack,forward:_forwardStack};
}
}),new objj_method(sel_getUid("close"),function(_39,_3a){
with(_39){
_iframe.parentNode.removeChild(_iframe);
}
}),new objj_method(sel_getUid("DOMWindow"),function(_3b,_3c){
with(_3b){
return (_iframe.contentDocument&&_iframe.contentDocument.defaultView)||_iframe.contentWindow;
}
}),new objj_method(sel_getUid("windowScriptObject"),function(_3d,_3e){
with(_3d){
var win=objj_msgSend(_3d,"DOMWindow");
if(!_wso||win!=objj_msgSend(_wso,"window")){
if(win){
_wso=objj_msgSend(objj_msgSend(CPWebScriptObject,"alloc"),"initWithWindow:",win);
}else{
_wso=nil;
}
}
return _wso;
}
}),new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(_3f,"objectByEvaluatingJavaScriptFromString:",_41);
return _42?String(_42):nil;
}
}),new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(objj_msgSend(_43,"windowScriptObject"),"evaluateWebScript:",_45);
}
}),new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"),function(_46,_47,_48,_49){
with(_46){
var win=objj_msgSend(objj_msgSend(_46,"windowScriptObject"),"window");
if(win){
return win.document.defaultView.getComputedStyle(_48,_49);
}
return nil;
}
}),new objj_method(sel_getUid("drawsBackground"),function(_4a,_4b){
with(_4a){
return _iframe.style.backgroundColor!="";
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_4c,_4d,_4e){
with(_4c){
_iframe.style.backgroundColor=_4e?"white":"";
}
}),new objj_method(sel_getUid("takeStringURLFrom:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_4f,"setMainFrameURL:",objj_msgSend(_51,"stringValue"));
}
}),new objj_method(sel_getUid("goBack:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"goBack");
}
}),new objj_method(sel_getUid("goForward:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"goForward");
}
}),new objj_method(sel_getUid("stopLoading:"),function(_58,_59,_5a){
with(_58){
}
}),new objj_method(sel_getUid("reload:"),function(_5b,_5c,_5d){
with(_5b){
objj_msgSend(_5b,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("print:"),function(_5e,_5f,_60){
with(_5e){
try{
objj_msgSend(_5e,"DOMWindow").print();
}
catch(e){
alert("Please click the webpage and select \"Print\" from the \"File\" menu");
}
}
}),new objj_method(sel_getUid("downloadDelegate"),function(_61,_62){
with(_61){
return _downloadDelegate;
}
}),new objj_method(sel_getUid("setDownloadDelegate:"),function(_63,_64,_65){
with(_63){
_downloadDelegate=_65;
}
}),new objj_method(sel_getUid("frameLoadDelegate"),function(_66,_67){
with(_66){
return _frameLoadDelegate;
}
}),new objj_method(sel_getUid("setFrameLoadDelegate:"),function(_68,_69,_6a){
with(_68){
_frameLoadDelegate=_6a;
}
}),new objj_method(sel_getUid("policyDelegate"),function(_6b,_6c){
with(_6b){
return _policyDelegate;
}
}),new objj_method(sel_getUid("setPolicyDelegate:"),function(_6d,_6e,_6f){
with(_6d){
_policyDelegate=_6f;
}
}),new objj_method(sel_getUid("resourceLoadDelegate"),function(_70,_71){
with(_70){
return _resourceLoadDelegate;
}
}),new objj_method(sel_getUid("setResourceLoadDelegate:"),function(_72,_73,_74){
with(_72){
_resourceLoadDelegate=_74;
}
}),new objj_method(sel_getUid("UIDelegate"),function(_75,_76){
with(_75){
return _UIDelegate;
}
}),new objj_method(sel_getUid("setUIDelegate:"),function(_77,_78,_79){
with(_77){
_UIDelegate=_79;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPWebScriptObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithWindow:"),function(_7a,_7b,_7c){
with(_7a){
if(_7a=objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPObject")},"init")){
_window=_7c;
}
return _7a;
}
}),new objj_method(sel_getUid("callWebScriptMethod:withArguments:"),function(_7d,_7e,_7f,_80){
with(_7d){
if(typeof _window[_7f]=="function"){
try{
return _window[_7f].apply(_80);
}
catch(e){
}
}
return undefined;
}
}),new objj_method(sel_getUid("evaluateWebScript:"),function(_81,_82,_83){
with(_81){
try{
return _window.eval(_83);
}
catch(e){
}
return undefined;
}
}),new objj_method(sel_getUid("window"),function(_84,_85){
with(_84){
return _window;
}
})]);
var _1=objj_getClass("CPWebView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWebView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_86,_87,_88){
with(_86){
_86=objj_msgSendSuper({receiver:_86,super_class:objj_getClass("CPView")},"initWithCoder:",_88);
if(_86){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
_scrollMode=CPWebViewScrollNative;
objj_msgSend(_86,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
}
return _86;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_89,_8a,_8b){
with(_89){
var _8c=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_89,super_class:objj_getClass("CPView")},"encodeWithCoder:",_8b);
_subviews=_8c;
}
})]);
p;20;CPWindowController.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;9453;
var _1=objj_allocateClassPair(CPResponder,"CPWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window"),new objj_ivar("_documents"),new objj_ivar("_document"),new objj_ivar("_shouldCloseDocument"),new objj_ivar("_supportsMultipleDocuments"),new objj_ivar("_cibOwner"),new objj_ivar("_windowCibName"),new objj_ivar("_windowCibPath"),new objj_ivar("_viewController"),new objj_ivar("_viewControllerContainerView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithWindow:",nil);
}
}),new objj_method(sel_getUid("initWithWindow:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
objj_msgSend(_5,"setWindow:",_7);
objj_msgSend(_5,"setShouldCloseDocument:",NO);
objj_msgSend(_5,"setNextResponder:",CPApp);
_documents=[];
}
return _5;
}
}),new objj_method(sel_getUid("initWithWindowCibName:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithWindowCibName:owner:",_a,_8);
}
}),new objj_method(sel_getUid("initWithWindowCibName:owner:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSend(_b,"initWithWindow:",nil);
if(_b){
_cibOwner=_e;
_windowCibName=_d;
}
return _b;
}
}),new objj_method(sel_getUid("initWithWindowCibPath:owner:"),function(_f,_10,_11,_12){
with(_f){
_f=objj_msgSend(_f,"initWithWindow:",nil);
if(_f){
_cibOwner=_12;
_windowCibPath=_11;
}
return _f;
}
}),new objj_method(sel_getUid("loadWindow"),function(_13,_14){
with(_13){
if(_window){
return;
}
objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"loadCibFile:externalNameTable:",objj_msgSend(_13,"windowCibPath"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_cibOwner,CPCibOwner));
}
}),new objj_method(sel_getUid("showWindow:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(_15,"window");
if(objj_msgSend(_18,"respondsToSelector:",sel_getUid("becomesKeyOnlyIfNeeded"))&&objj_msgSend(_18,"becomesKeyOnlyIfNeeded")){
objj_msgSend(_18,"orderFront:",_17);
}else{
objj_msgSend(_18,"makeKeyAndOrderFront:",_17);
}
}
}),new objj_method(sel_getUid("isWindowLoaded"),function(_19,_1a){
with(_19){
return _window!==nil;
}
}),new objj_method(sel_getUid("window"),function(_1b,_1c){
with(_1b){
if(!_window){
objj_msgSend(_1b,"windowWillLoad");
objj_msgSend(_document,"windowControllerWillLoadCib:",_1b);
objj_msgSend(_1b,"loadWindow");
if(_window===nil&&objj_msgSend(_cibOwner,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_1b,"setWindow:",objj_msgSend(_cibOwner,"valueForKey:","window"));
}
objj_msgSend(_1b,"windowDidLoad");
objj_msgSend(_document,"windowControllerDidLoadCib:",_1b);
objj_msgSend(_1b,"synchronizeWindowTitleWithDocumentName");
}
return _window;
}
}),new objj_method(sel_getUid("setWindow:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_window,"setWindowController:",nil);
_window=_1f;
objj_msgSend(_window,"setWindowController:",_1d);
objj_msgSend(_window,"setNextResponder:",_1d);
}
}),new objj_method(sel_getUid("windowDidLoad"),function(_20,_21){
with(_20){
}
}),new objj_method(sel_getUid("windowWillLoad"),function(_22,_23){
with(_22){
}
}),new objj_method(sel_getUid("setDocument:"),function(_24,_25,_26){
with(_24){
if(_document===_26){
return;
}
var _27=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_document){
if(!objj_msgSend(_24,"supportsMultipleDocuments")){
objj_msgSend(_24,"removeDocument:",_document);
}
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentWillSaveNotification,_document);
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentDidSaveNotification,_document);
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentDidFailToSaveNotification,_document);
}
_document=_26;
if(_document){
objj_msgSend(_24,"addDocument:",_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentWillSave:"),CPDocumentWillSaveNotification,_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentDidSave:"),CPDocumentDidSaveNotification,_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentDidFailToSave:"),CPDocumentDidFailToSaveNotification,_document);
objj_msgSend(_24,"setDocumentEdited:",objj_msgSend(_document,"isDocumentEdited"));
}
var _28=objj_msgSend(_document,"viewControllerForWindowController:",_24);
if(_28){
objj_msgSend(_24,"setViewController:",_28);
}
objj_msgSend(_24,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("setSupportsMultipleDocuments:"),function(_29,_2a,_2b){
with(_29){
_supportsMultipleDocuments=_2b;
}
}),new objj_method(sel_getUid("supportsMultipleDocuments"),function(_2c,_2d){
with(_2c){
return _supportsMultipleDocuments;
}
}),new objj_method(sel_getUid("addDocument:"),function(_2e,_2f,_30){
with(_2e){
if(_30&&!objj_msgSend(_documents,"containsObject:",_30)){
objj_msgSend(_documents,"addObject:",_30);
}
}
}),new objj_method(sel_getUid("removeDocument:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_documents,"indexOfObjectIdenticalTo:",_33);
if(_34===CPNotFound){
return;
}
objj_msgSend(_documents,"removeObjectAtIndex:",_34);
if(_document===_33&&objj_msgSend(_documents,"count")){
objj_msgSend(_31,"setDocument:",objj_msgSend(_documents,"objectAtIndex:",MIN(_34,objj_msgSend(_documents,"count")-1)));
}
}
}),new objj_method(sel_getUid("removeDocumentAndCloseIfNecessary:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"removeDocument:",_37);
if(!objj_msgSend(_documents,"count")){
objj_msgSend(_35,"close");
}
}
}),new objj_method(sel_getUid("documents"),function(_38,_39){
with(_38){
return _documents;
}
}),new objj_method(sel_getUid("setViewController:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"viewControllerContainerView")||objj_msgSend(objj_msgSend(_3a,"window"),"contentView"),_3e=objj_msgSend(_viewController,"view"),_3f=_3e?objj_msgSend(_3e,"frame"):objj_msgSend(_3d,"bounds");
objj_msgSend(_3e,"removeFromSuperview");
_viewController=_3c;
_3e=objj_msgSend(_viewController,"view");
if(_3e){
objj_msgSend(_3e,"setFrame:",_3f);
objj_msgSend(_3d,"addSubview:",_3e);
}
}
}),new objj_method(sel_getUid("setViewControllerContainerView:"),function(_40,_41,_42){
with(_40){
_viewControllerContainerView=_42;
}
}),new objj_method(sel_getUid("viewControllerContainerView"),function(_43,_44){
with(_43){
return _viewControllerContainerView;
}
}),new objj_method(sel_getUid("setViewController:"),function(_45,_46,_47){
with(_45){
var _48=objj_msgSend(_45,"viewControllerContainerView")||objj_msgSend(objj_msgSend(_45,"window"),"contentView"),_49=objj_msgSend(_viewController,"view"),_4a=_49?objj_msgSend(_49,"frame"):objj_msgSend(_48,"bounds");
objj_msgSend(_49,"removeFromSuperview");
_viewController=_47;
_49=objj_msgSend(_viewController,"view");
if(_49){
objj_msgSend(_49,"setFrame:",_4a);
objj_msgSend(_48,"addSubview:",_49);
}
}
}),new objj_method(sel_getUid("viewController"),function(_4b,_4c){
with(_4b){
return _viewController;
}
}),new objj_method(sel_getUid("_documentWillSave:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(objj_msgSend(_4d,"window"),"setDocumentSaving:",YES);
}
}),new objj_method(sel_getUid("_documentDidSave:"),function(_50,_51,_52){
with(_50){
objj_msgSend(objj_msgSend(_50,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("_documentDidFailToSave:"),function(_53,_54,_55){
with(_53){
objj_msgSend(objj_msgSend(_53,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("document"),function(_56,_57){
with(_56){
return _document;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_58,"_synchronizeDocumentEditedState");
}
}),new objj_method(sel_getUid("_synchronizeDocumentEditedState"),function(_5b,_5c){
with(_5b){
var _5d=objj_msgSend(_5b,"documents"),_5e=objj_msgSend(_5d,"count"),_5f=NO;
while(_5e--){
if(objj_msgSend(_5d[_5e],"isDocumentEdited")){
_5f=YES;
break;
}
}
objj_msgSend(objj_msgSend(_5b,"window"),"setDocumentEdited:",_5f);
}
}),new objj_method(sel_getUid("close"),function(_60,_61){
with(_60){
objj_msgSend(objj_msgSend(_60,"window"),"close");
}
}),new objj_method(sel_getUid("setShouldCloseDocument:"),function(_62,_63,_64){
with(_62){
_shouldCloseDocument=_64;
}
}),new objj_method(sel_getUid("shouldCloseDocument"),function(_65,_66){
with(_65){
return _shouldCloseDocument;
}
}),new objj_method(sel_getUid("owner"),function(_67,_68){
with(_67){
return _cibOwner;
}
}),new objj_method(sel_getUid("windowCibName"),function(_69,_6a){
with(_69){
if(_windowCibName){
return _windowCibName;
}
return objj_msgSend(objj_msgSend(_windowCibPath,"lastPathComponent"),"stringByDeletingPathExtension");
}
}),new objj_method(sel_getUid("windowCibPath"),function(_6b,_6c){
with(_6b){
if(_windowCibPath){
return _windowCibPath;
}
return objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"pathForResource:",_windowCibName+".cib");
}
}),new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"),function(_6d,_6e){
with(_6d){
if(!_document||!_window){
return;
}
objj_msgSend(_window,"setTitle:",objj_msgSend(_6d,"windowTitleForDocumentDisplayName:",objj_msgSend(_document,"displayName")));
}
}),new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"),function(_6f,_70,_71){
with(_6f){
return _71;
}
})]);
p;20;_CPCibClassSwapper.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1259;
var _1="_CPCibClassSwapperClassNameKey",_2="_CPCibClassSwapperOriginalClassNameKey";
var _3=objj_allocateClassPair(CPObject,"_CPCibClassSwapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("allocObjectWithCoder:className:"),function(_5,_6,_7,_8){
with(_5){
var _9=objj_msgSend(_7,"classForClassName:",_8);
if(!_9){
_9=objj_lookUpClass(_8);
if(!_9){
return nil;
}
}
return objj_msgSend(_9,"alloc");
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_c,"respondsToSelector:",sel_getUid("usesOriginalClasses"))&&objj_msgSend(_c,"usesOriginalClasses")){
var _d=objj_msgSend(_c,"decodeObjectForKey:",_2),_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,_d);
}else{
var _d=objj_msgSend(_c,"decodeObjectForKey:",_1),_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,_d);
if(!_e){
CPLog.error("Unable to find class "+_d+" in cib file.");
_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,objj_msgSend(_c,"decodeObjectForKey:",_2));
}
}
if(!_e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unable to find class "+_d+" in cib file.");
}
return _e;
}
})]);
p;20;_CPCibCustomObject.jI;21;Foundation/CPObject.jc;1705;
var _1="_CPCibCustomObjectClassName";
var _2=objj_allocateClassPair(CPObject,"_CPCibCustomObject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_className")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("customClassName"),function(_4,_5){
with(_4){
return _className;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_6,_7,_8){
with(_6){
_className=_8;
}
}),new objj_method(sel_getUid("description"),function(_9,_a){
with(_9){
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"description")+" ("+objj_msgSend(_9,"customClassName")+")";
}
})]);
var _2=objj_getClass("_CPCibCustomObject");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomObject\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_className);
if(_13===objj_msgSend(_11,"class")){
_className="CPObject";
return _11;
}
if(!_13){
_13=objj_msgSend(CPObject,"class");
}
if(_13===objj_msgSend(CPApplication,"class")){
return objj_msgSend(CPApplication,"sharedApplication");
}
return objj_msgSend(objj_msgSend(_13,"alloc"),"init");
}
})]);
p;22;_CPCibCustomResource.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;2848;
var _1="_CPCibCustomResourceClassNameKey",_2="_CPCibCustomResourceResourceNameKey",_3="_CPCibCustomResourcePropertiesKey";
var _4=objj_allocateClassPair(CPObject,"_CPCibCustomResource"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_className"),new objj_ivar("_resourceName"),new objj_ivar("_properties")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithClassName:resourceName:properties:"),function(_6,_7,_8,_9,_a){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_className=_8;
_resourceName=_9;
_properties=_a;
}
return _6;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
_resourceName=objj_msgSend(_d,"decodeObjectForKey:",_2);
_properties=objj_msgSend(_d,"decodeObjectForKey:",_3);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
objj_msgSend(_10,"encodeObject:forKey:",_resourceName,_2);
objj_msgSend(_10,"encodeObject:forKey:",_properties,_3);
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_11,_12,_13){
with(_11){
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("bundle"))&&(!objj_msgSend(_13,"respondsToSelector:",sel_getUid("awakenCustomResources"))||objj_msgSend(_13,"awakenCustomResources"))){
if(_className==="CPImage"){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(_13,"bundle"),"pathForResource:",_resourceName),objj_msgSend(_properties,"objectForKey:","size"));
}
}
return _11;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("imageResourceWithName:size:"),function(_14,_15,_16,_17){
with(_14){
return objj_msgSend(objj_msgSend(_14,"alloc"),"initWithClassName:resourceName:properties:","CPImage",_16,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_17,"size"));
}
})]);
var _4=objj_getClass("_CPCibCustomResource");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomResource\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("filename"),function(_18,_19){
with(_18){
return objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_resourceName);
}
}),new objj_method(sel_getUid("size"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_properties,"objectForKey:","size");
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_1c,_1d){
with(_1c){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_1e,_1f){
with(_1e){
return NO;
}
})]);
p;18;_CPCibCustomView.ji;8;CPView.jc;2330;
var _1=objj_allocateClassPair(CPView,"_CPCibCustomView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_className")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("customClassName"),function(_3,_4){
with(_3){
return _className;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_5,_6,_7){
with(_5){
_className=_7;
}
})]);
var _8="_CPCibCustomViewClassNameKey";
var _1=objj_getClass("_CPCibCustomView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPView")},"initWithCoder:",_b);
if(_9){
_className=objj_msgSend(_b,"decodeObjectForKey:",_8);
}
return _9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPView")},"encodeWithCoder:",_e);
objj_msgSend(_e,"encodeObject:forKey:",_className,_8);
}
}),new objj_method(sel_getUid("customClassName"),function(_f,_10){
with(_f){
return _className;
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_className);
if(!_13){
_13=objj_msgSend(CPView,"class");
}
if(_13===objj_msgSend(_11,"class")){
_className="CPView";
return _11;
}
var _14=objj_msgSend(objj_msgSend(_13,"alloc"),"initWithFrame:",objj_msgSend(_11,"frame"));
if(_14){
objj_msgSend(_14,"setBounds:",objj_msgSend(_11,"bounds"));
var _15=objj_msgSend(objj_msgSend(_11,"subviews"),"copy"),_16=0,_17=_15.length;
for(;_16<_17;++_16){
objj_msgSend(_14,"addSubview:",_15[_16]);
}
objj_msgSend(_14,"setAutoresizingMask:",objj_msgSend(_11,"autoresizingMask"));
objj_msgSend(_14,"setAutoresizesSubviews:",objj_msgSend(_11,"autoresizesSubviews"));
objj_msgSend(_14,"setHitTests:",objj_msgSend(_11,"hitTests"));
objj_msgSend(_14,"setHidden:",objj_msgSend(_11,"isHidden"));
objj_msgSend(_14,"setAlphaValue:",objj_msgSend(_11,"alphaValue"));
objj_msgSend(_superview,"replaceSubview:with:",_11,_14);
objj_msgSend(_14,"setBackgroundColor:",objj_msgSend(_11,"backgroundColor"));
}
return _14;
}
})]);
p;23;_CPCibKeyedUnarchiver.jI;30;Foundation/CPKeyedUnarchiver.jc;1437;
var _1=objj_allocateClassPair(CPKeyedUnarchiver,"_CPCibKeyedUnarchiver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_externalObjectsForProxyIdentifiers")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_5);
if(_3){
_bundle=_6;
_awakenCustomResources=_7;
objj_msgSend(_3,"setDelegate:",_3);
}
return _3;
}
}),new objj_method(sel_getUid("bundle"),function(_8,_9){
with(_8){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_a,_b){
with(_a){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("setExternalObjectsForProxyIdentifiers:"),function(_c,_d,_e){
with(_c){
_externalObjectsForProxyIdentifiers=_e;
}
}),new objj_method(sel_getUid("externalObjectForProxyIdentifier:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(_externalObjectsForProxyIdentifiers,"objectForKey:",_11);
}
}),new objj_method(sel_getUid("replaceObjectAtUID:withObject:"),function(_12,_13,_14,_15){
with(_12){
_objects[_14]=_15;
}
}),new objj_method(sel_getUid("objectAtUID:"),function(_16,_17,_18){
with(_16){
return _objects[_18];
}
})]);
p;18;_CPCibObjectData.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;22;CPCibOutletConnector.jc;5807;
var _1=objj_allocateClassPair(CPObject,"_CPCibObjectData"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_namesKeys"),new objj_ivar("_namesValues"),new objj_ivar("_accessibilityConnectors"),new objj_ivar("_accessibilityOidsKeys"),new objj_ivar("_accessibilityOidsValues"),new objj_ivar("_classesKeys"),new objj_ivar("_classesValues"),new objj_ivar("_connections"),new objj_ivar("_fontManager"),new objj_ivar("_framework"),new objj_ivar("_nextOid"),new objj_ivar("_objectsKeys"),new objj_ivar("_objectsValues"),new objj_ivar("_oidKeys"),new objj_ivar("_oidValues"),new objj_ivar("_fileOwner"),new objj_ivar("_visibleWindows"),new objj_ivar("_replacementObjects")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_namesKeys=[];
_namesValues=[];
_classesKeys=[];
_classesValues=[];
_connections=[];
_framework="";
_nextOid=[];
_objectsKeys=[];
_objectsValues=[];
_oidKeys=[];
_oidValues=[];
_fileOwner=nil;
_visibleWindows=objj_msgSend(CPSet,"set");
}
return _3;
}
}),new objj_method(sel_getUid("displayVisibleWindows"),function(_5,_6){
with(_5){
var _7=nil,_8=objj_msgSend(_visibleWindows,"objectEnumerator");
while(_7=objj_msgSend(_8,"nextObject")){
objj_msgSend(_replacementObjects[objj_msgSend(_7,"UID")],"makeKeyAndOrderFront:",_5);
}
}
})]);
var _9="_CPCibObjectDataNamesKeysKey",_a="_CPCibObjectDataNamesValuesKey",_b="_CPCibObjectDataAccessibilityConnectors",_c="_CPCibObjectDataAccessibilityOidsKeys",_d="_CPCibObjectDataAccessibilityOidsValues",_e="_CPCibObjectDataClassesKeysKey",_f="_CPCibObjectDataClassesValuesKey",_10="_CPCibObjectDataConnectionsKey",_11="_CPCibObjectDataFontManagerKey",_12="_CPCibObjectDataFrameworkKey",_13="_CPCibObjectDataNextOidKey",_14="_CPCibObjectDataObjectsKeysKey",_15="_CPCibObjectDataObjectsValuesKey",_16="_CPCibObjectDataOidKeysKey",_17="_CPCibObjectDataOidValuesKey",_18="_CPCibObjectDataFileOwnerKey",_19="_CPCibObjectDataVisibleWindowsKey";
var _1=objj_getClass("_CPCibObjectData");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibObjectData\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_replacementObjects={};
_namesKeys=objj_msgSend(_1c,"decodeObjectForKey:",_9);
_namesValues=objj_msgSend(_1c,"decodeObjectForKey:",_a);
_classesKeys=objj_msgSend(_1c,"decodeObjectForKey:",_e);
_classesValues=objj_msgSend(_1c,"decodeObjectForKey:",_f);
_connections=objj_msgSend(_1c,"decodeObjectForKey:",_10);
_framework=objj_msgSend(_1c,"decodeObjectForKey:",_12);
_nextOid=objj_msgSend(_1c,"decodeIntForKey:",_13);
_objectsKeys=objj_msgSend(_1c,"decodeObjectForKey:",_14);
_objectsValues=objj_msgSend(_1c,"decodeObjectForKey:",_15);
_oidKeys=objj_msgSend(_1c,"decodeObjectForKey:",_16);
_oidValues=objj_msgSend(_1c,"decodeObjectForKey:",_17);
_fileOwner=objj_msgSend(_1c,"decodeObjectForKey:",_18);
_visibleWindows=objj_msgSend(_1c,"decodeObjectForKey:",_19);
}
return _1a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1f,"encodeObject:forKey:",_namesKeys,_9);
objj_msgSend(_1f,"encodeObject:forKey:",_namesValues,_a);
objj_msgSend(_1f,"encodeObject:forKey:",_classesKeys,_e);
objj_msgSend(_1f,"encodeObject:forKey:",_classesValues,_f);
objj_msgSend(_1f,"encodeObject:forKey:",_connections,_10);
objj_msgSend(_1f,"encodeObject:forKey:",_framework,_12);
objj_msgSend(_1f,"encodeInt:forKey:",_nextOid,_13);
objj_msgSend(_1f,"encodeObject:forKey:",_objectsKeys,_14);
objj_msgSend(_1f,"encodeObject:forKey:",_objectsValues,_15);
objj_msgSend(_1f,"encodeObject:forKey:",_oidKeys,_16);
objj_msgSend(_1f,"encodeObject:forKey:",_oidValues,_17);
objj_msgSend(_1f,"encodeObject:forKey:",_fileOwner,_18);
objj_msgSend(_1f,"encodeObject:forKey:",_visibleWindows,_19);
}
}),new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(_objectsKeys,"count");
while(_24--){
var _25=_objectsKeys[_24],_26=_objectsValues[_24],_27=_25;
if(objj_msgSend(_25,"respondsToSelector:",sel_getUid("_cibInstantiate"))){
var _27=objj_msgSend(_25,"_cibInstantiate");
if(_27!==_25){
_replacementObjects[objj_msgSend(_25,"UID")]=_27;
if(objj_msgSend(_27,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _28=objj_msgSend(_27,"superview");
if(objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _29=objj_msgSend(_28,"superview");
if(objj_msgSend(_29,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_29,"setDocumentView:",_27);
}
}
}
}
}
if(_23&&_26===_fileOwner&&_25!==_fileOwner){
_23.push(_27);
}
}
}
}),new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"),function(_2a,_2b,_2c,_2d){
with(_2a){
_replacementObjects[objj_msgSend(_fileOwner,"UID")]=_2c;
var _2e=0,_2f=_connections.length;
for(;_2e<_2f;++_2e){
var _30=_connections[_2e];
objj_msgSend(_30,"replaceObjects:",_replacementObjects);
objj_msgSend(_30,"establishConnection");
}
}
}),new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"),function(_31,_32,_33,_34){
with(_31){
var _35=objj_msgSend(_objectsKeys,"count");
while(_35--){
var _36=_objectsKeys[_35],_37=_replacementObjects[objj_msgSend(_36,"UID")];
if(_37){
_36=_37;
}
if(_36!==_33&&objj_msgSend(_36,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_36,"awakeFromCib");
}
}
if(objj_msgSend(_33,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_33,"awakeFromCib");
}
}
})]);
p;19;_CPCibProxyObject.jI;21;Foundation/CPObject.jc;1021;
var _1=objj_allocateClassPair(CPObject,"_CPCibProxyObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _3="CPIdentifier";
var _1=objj_getClass("_CPCibProxyObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibProxyObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_identifier=objj_msgSend(_6,"decodeObjectForKey:",_3);
}
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("externalObjectForProxyIdentifier:"))){
return objj_msgSend(_6,"externalObjectForProxyIdentifier:",_identifier);
}
return _4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_9,"encodeObject:forKey:",_identifier,_3);
}
})]);
p;22;_CPCibWindowTemplate.jI;21;Foundation/CPObject.jc;4509;
var _1="_CPCibWindowTemplateMinSizeKey",_2="_CPCibWindowTemplateMaxSizeKey",_3="_CPCibWindowTemplateViewClassKey",_4="_CPCibWindowTemplateWindowClassKey",_5="_CPCibWindowTemplateWindowRectKey",_6="_CPCibWindowTempatStyleMaskKey",_7="_CPCibWindowTemplateWindowTitleKey",_8="_CPCibWindowTemplateWindowViewKey",_9="_CPCibWindowTemplateWindowAutorecalculatesKeyViewLoop";
_CPCibWindowTemplateWindowIsFullPlatformWindowKey="_CPCibWindowTemplateWindowIsFullPlatformWindowKey";
var _a=objj_allocateClassPair(CPObject,"_CPCibWindowTemplate"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_viewClass"),new objj_ivar("_windowClass"),new objj_ivar("_windowRect"),new objj_ivar("_windowStyleMask"),new objj_ivar("_windowTitle"),new objj_ivar("_windowView"),new objj_ivar("_windowAutorecalculatesKeyViewLoop"),new objj_ivar("_windowIsFullPlatformWindow")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_windowClass="CPWindow";
_windowRect=CGRectMake(0,0,400,200);
_windowStyleMask=CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask;
_windowTitle="Window";
_windowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,400,200));
_windowIsFullPlatformWindow=NO;
}
return _c;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPObject")},"init");
if(_e){
if(objj_msgSend(_10,"containsValueForKey:",_1)){
_minSize=objj_msgSend(_10,"decodeSizeForKey:",_1);
}
if(objj_msgSend(_10,"containsValueForKey:",_2)){
_maxSize=objj_msgSend(_10,"decodeSizeForKey:",_2);
}
_viewClass=objj_msgSend(_10,"decodeObjectForKey:",_3);
_windowClass=objj_msgSend(_10,"decodeObjectForKey:",_4);
_windowRect=objj_msgSend(_10,"decodeRectForKey:",_5);
_windowStyleMask=objj_msgSend(_10,"decodeIntForKey:",_6);
_windowTitle=objj_msgSend(_10,"decodeObjectForKey:",_7);
_windowView=objj_msgSend(_10,"decodeObjectForKey:",_8);
_windowAutorecalculatesKeyViewLoop=!!objj_msgSend(_10,"decodeObjectForKey:",_9);
_windowIsFullPlatformWindow=!!objj_msgSend(_10,"decodeObjectForKey:",_CPCibWindowTemplateWindowIsFullPlatformWindowKey);
}
return _e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_11,_12,_13){
with(_11){
if(_minSize){
objj_msgSend(_13,"encodeSize:forKey:",_minSize,_1);
}
if(_maxSize){
objj_msgSend(_13,"encodeSize:forKey:",_maxSize,_2);
}
objj_msgSend(_13,"encodeObject:forKey:",_viewClass,_3);
objj_msgSend(_13,"encodeObject:forKey:",_windowClass,_4);
objj_msgSend(_13,"encodeRect:forKey:",_windowRect,_5);
objj_msgSend(_13,"encodeInt:forKey:",_windowStyleMask,_6);
objj_msgSend(_13,"encodeObject:forKey:",_windowTitle,_7);
objj_msgSend(_13,"encodeObject:forKey:",_windowView,_8);
if(_windowAutorecalculatesKeyViewLoop){
objj_msgSend(_13,"encodeObject:forKey:",_windowAutorecalculatesKeyViewLoop,_9);
}
if(_windowIsFullPlatformWindow){
objj_msgSend(_13,"encodeObject:forKey:",_windowIsFullPlatformWindow,_CPCibWindowTemplateWindowIsFullPlatformWindowKey);
}
}
}),new objj_method(sel_getUid("customClassName"),function(_14,_15){
with(_14){
return _windowClass;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_16,_17,_18){
with(_16){
_windowClass=_18;
}
}),new objj_method(sel_getUid("windowClass"),function(_19,_1a){
with(_19){
return _windowClass;
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_1b,_1c){
with(_1b){
var _1d=CPClassFromString(objj_msgSend(_1b,"windowClass"));
var _1e=objj_msgSend(objj_msgSend(_1d,"alloc"),"initWithContentRect:styleMask:",_windowRect,_windowStyleMask);
if(_minSize){
objj_msgSend(_1e,"setMinSize:",_minSize);
}
if(_maxSize){
objj_msgSend(_1e,"setMaxSize:",_maxSize);
}
objj_msgSend(_1e,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_1e,"setTitle:",_windowTitle);
objj_msgSend(_windowView,"setAutoresizesSubviews:",NO);
objj_msgSend(_1e,"setContentView:",_windowView);
objj_msgSend(_windowView,"setAutoresizesSubviews:",YES);
if(objj_msgSend(_viewClass,"isKindOfClass:",objj_msgSend(CPToolbar,"class"))){
objj_msgSend(_1e,"setToolbar:",_viewClass);
}
objj_msgSend(_1e,"setAutorecalculatesKeyViewLoop:",_windowAutorecalculatesKeyViewLoop);
objj_msgSend(_1e,"setFullBridge:",_windowIsFullPlatformWindow);
return _1e;
}
})]);
p;7;CPCib.jI;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibClassSwapper.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;19;_CPCibProxyObject.ji;22;_CPCibWindowTemplate.jc;4545;
CPCibOwner="CPCibOwner",CPCibTopLevelObjects="CPCibTopLevelObjects",CPCibReplacementClasses="CPCibReplacementClasses",CPCibExternalObjects="CPCibExternalObjects";
var _1="CPCibObjectDataKey";
var _2=objj_allocateClassPair(CPObject,"CPCib"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_data"),new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_data=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_6),nil,nil);
_awakenCustomResources=YES;
}
return _4;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:loadDelegate:"),function(_7,_8,_9,_a){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_9),_7);
_awakenCustomResources=YES;
_loadDelegate=_a;
}
return _7;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:"),function(_b,_c,_d,_e){
with(_b){
if(!objj_msgSend(_d,"hasSuffix:",".cib")){
_d=objj_msgSend(_d,"stringByAppendingString:",".cib");
}
_b=objj_msgSend(_b,"initWithContentsOfURL:",objj_msgSend(_e||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_d));
if(_b){
_bundle=_e;
}
return _b;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:loadDelegate:"),function(_f,_10,_11,_12,_13){
with(_f){
if(!objj_msgSend(_11,"hasSuffix:",".cib")){
_11=objj_msgSend(_11,"stringByAppendingString:",".cib");
}
_f=objj_msgSend(_f,"initWithContentsOfURL:loadDelegate:",objj_msgSend(_12||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_11),_13);
if(_f){
_bundle=_12;
}
return _f;
}
}),new objj_method(sel_getUid("_setAwakenCustomResources:"),function(_14,_15,_16){
with(_14){
_awakenCustomResources=_16;
}
}),new objj_method(sel_getUid("_awakenCustomResources"),function(_17,_18){
with(_17){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"),function(_19,_1a,_1b){
with(_19){
var _1c=_bundle,_1d=objj_msgSend(_1b,"objectForKey:",CPCibOwner);
if(!_1c&&_1d){
_1c=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_1d,"class"));
}
var _1e=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:awakenCustomResources:",_data,_1c,_awakenCustomResources),_1f=objj_msgSend(_1b,"objectForKey:",CPCibReplacementClasses);
if(_1f){
var key=nil,_20=objj_msgSend(_1f,"keyEnumerator");
while(key=objj_msgSend(_20,"nextObject")){
objj_msgSend(_1e,"setClass:forClassName:",objj_msgSend(_1f,"objectForKey:",key),key);
}
}
objj_msgSend(_1e,"setExternalObjectsForProxyIdentifiers:",objj_msgSend(_1b,"objectForKey:",CPCibExternalObjects));
var _21=objj_msgSend(_1e,"decodeObjectForKey:",_1);
if(!_21||!objj_msgSend(_21,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
var _22=objj_msgSend(_1b,"objectForKey:",CPCibTopLevelObjects);
objj_msgSend(_21,"instantiateWithOwner:topLevelObjects:",_1d,_22);
objj_msgSend(_21,"establishConnectionsWithOwner:topLevelObjects:",_1d,_22);
objj_msgSend(_21,"awakeWithOwner:topLevelObjects:",_1d,_22);
objj_msgSend(_21,"displayVisibleWindows");
return YES;
}
}),new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"),function(_23,_24,_25,_26){
with(_23){
return objj_msgSend(_23,"instantiateCibWithExternalNameTable:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_25,CPCibOwner,_26,CPCibTopLevelObjects));
}
})]);
var _2=objj_getClass("CPCib");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCib\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("connection:didReceiveData:"),function(_27,_28,_29,_2a){
with(_27){
_data=objj_msgSend(CPData,"dataWithString:",_2a);
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_2b,_2c,_2d,_2e){
with(_2b){
alert("cib: connection failed.");
_loadDelegate=nil;
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_2f,_30,_31){
with(_2f){
if(objj_msgSend(_loadDelegate,"respondsToSelector:",sel_getUid("cibDidFinishLoading:"))){
objj_msgSend(_loadDelegate,"cibDidFinishLoading:",_2f);
}
_loadDelegate=nil;
}
})]);
p;16;CPCibConnector.jI;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;2366;
var _1="_CPCibConnectorSourceKey",_2="_CPCibConnectorDestinationKey",_3="_CPCibConnectorLabelKey";
var _4=objj_allocateClassPair(CPObject,"CPCibConnector"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_source"),new objj_ivar("_destination"),new objj_ivar("_label")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("source"),function(_6,_7){
with(_6){
return _source;
}
}),new objj_method(sel_getUid("setSource:"),function(_8,_9,_a){
with(_8){
_source=_a;
}
}),new objj_method(sel_getUid("destination"),function(_b,_c){
with(_b){
return _destination;
}
}),new objj_method(sel_getUid("setDestination:"),function(_d,_e,_f){
with(_d){
_destination=_f;
}
}),new objj_method(sel_getUid("label"),function(_10,_11){
with(_10){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_12,_13,_14){
with(_12){
_label=_14;
}
}),new objj_method(sel_getUid("replaceObject:withObject:"),function(_15,_16,_17,_18){
with(_15){
if(_source===_17){
_source=_18;
}
if(_destination===_17){
_destination=_18;
}
}
}),new objj_method(sel_getUid("replaceObjects:"),function(_19,_1a,_1b){
with(_19){
var _1c=_1b[objj_msgSend(_source,"UID")];
if(_1c!==undefined){
_source=_1c;
}
_1c=_1b[objj_msgSend(_destination,"UID")];
if(_1c!==undefined){
_destination=_1c;
}
}
})]);
var _4=objj_getClass("CPCibConnector");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCibConnector\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
_source=objj_msgSend(_1f,"decodeObjectForKey:",_1);
_destination=objj_msgSend(_1f,"decodeObjectForKey:",_2);
_label=objj_msgSend(_1f,"decodeObjectForKey:",_3);
}
return _1d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_22,"encodeObject:forKey:",_source,_1);
objj_msgSend(_22,"encodeObject:forKey:",_destination,_2);
objj_msgSend(_22,"encodeObject:forKey:",_label,_3);
}
})]);
var _4=objj_allocateClassPair(CPCibConnector,"_CPCibConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;23;CPCibControlConnector.ji;16;CPCibConnector.jc;1599;
var _1=objj_allocateClassPair(CPCibConnector,"CPCibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("establishConnection"),function(_3,_4){
with(_3){
var _5=_label,_6=objj_msgSend(_5,"length");
if(_6&&_5[_6-1]!==":"){
_5+=":";
}
var _7=CPSelectorFromString(_5);
if(!_7){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] selector "+_5+" does not exist.");
}
if(_destination&&!objj_msgSend(_destination,"respondsToSelector:",_7)){
CPLog.warn("Could not connect the action "+_7+" to target of class "+objj_msgSend(_destination,"className"));
return;
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_source,sel_getUid("setAction:"),_7);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] "+objj_msgSend(_source,"description")+" does not respond to setAction:");
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_source,sel_getUid("setTarget:"),_destination);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] "+objj_msgSend(_source,"description")+" does not respond to setTarget:");
}
}
})]);
var _1=objj_allocateClassPair(CPCibControlConnector,"_CPCibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;14;CPCibLoading.jI;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2894;
var _1="CPCibOwner";
var _2={};
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
}
})]);
var _3=objj_getClass("CPBundle");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_7,_8,_9,_a){
with(_7){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_9),"instantiateCibWithExternalNameTable:",_a);
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_b,_c,_d,_e,_f){
with(_b){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:loadDelegate:",_d,_b,objj_msgSend(_b,"class"));
_2[objj_msgSend(cib,"UID")]={loadDelegate:_f,externalNameTable:_e};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_10,_11,_12,_13){
with(_10){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_12),"instantiateCibWithExternalNameTable:",_13);
}
}),new objj_method(sel_getUid("loadCibNamed:owner:"),function(_14,_15,_16,_17){
with(_14){
if(!objj_msgSend(_16,"hasSuffix:",".cib")){
_16=objj_msgSend(_16,"stringByAppendingString:",".cib");
}
var _18=_17?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_17,"class")):objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"pathForResource:",_16);
objj_msgSend(_14,"loadCibFile:externalNameTable:",_19,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_17,_1));
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:loadDelegate:",_1c,_1a);
_2[objj_msgSend(cib,"UID")]={loadDelegate:_1e,externalNameTable:_1d};
}
}),new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"),function(_1f,_20,_21,_22,_23){
with(_1f){
if(!objj_msgSend(_21,"hasSuffix:",".cib")){
_21=objj_msgSend(_21,"stringByAppendingString:",".cib");
}
var _24=_22?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_22,"class")):objj_msgSend(CPBundle,"mainBundle"),_25=objj_msgSend(_24,"pathForResource:",_21);
objj_msgSend(_1f,"loadCibFile:externalNameTable:loadDelegate:",_25,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_22,_1),_23);
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_26,_27,_28){
with(_26){
var _29=_2[objj_msgSend(_28,"UID")];
delete _2[objj_msgSend(_28,"UID")];
objj_msgSend(_28,"instantiateCibWithExternalNameTable:",_29.externalNameTable);
objj_msgSend(_29.loadDelegate,"cibDidFinishLoading:",_28);
}
})]);
p;22;CPCibOutletConnector.ji;16;CPCibConnector.jc;776;
var _1=objj_allocateClassPair(CPCibConnector,"CPCibOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("establishConnection"),function(_3,_4){
with(_3){
try{
objj_msgSend(_source,"setValue:forKey:",_destination,_label);
}
catch(anException){
if(objj_msgSend(anException,"name")===CPUndefinedKeyException){
CPLog.warn("Could not connect the outlet "+_label+" of target of class "+objj_msgSend(_source,"className"));
}else{
throw anException;
}
}
}
})]);
var _1=objj_allocateClassPair(CPCibOutletConnector,"_CPCibOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;13;CAAnimation.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;3790;
var _1=objj_allocateClassPair(CPObject,"CAAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isRemovedOnCompletion"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_isRemovedOnCompletion=YES;
}
return _3;
}
}),new objj_method(sel_getUid("shouldArchiveValueForKey:"),function(_5,_6,_7){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("setRemovedOnCompletion:"),function(_8,_9,_a){
with(_8){
_isRemovedOnCompletion=_a;
}
}),new objj_method(sel_getUid("removedOnCompletion"),function(_b,_c){
with(_b){
return _isRemovedOnCompletion;
}
}),new objj_method(sel_getUid("isRemovedOnCompletion"),function(_d,_e){
with(_d){
return _isRemovedOnCompletion;
}
}),new objj_method(sel_getUid("timingFunction"),function(_f,_10){
with(_f){
return nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_11,_12,_13){
with(_11){
_delegate=_13;
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("runActionForKey:object:arguments:"),function(_16,_17,_18,_19,_1a){
with(_16){
objj_msgSend(_19,"addAnimation:forKey:",_16,_18);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("animation"),function(_1b,_1c){
with(_1b){
return objj_msgSend(objj_msgSend(_1b,"alloc"),"init");
}
}),new objj_method(sel_getUid("defaultValueForKey:"),function(_1d,_1e,_1f){
with(_1d){
return nil;
}
})]);
var _1=objj_allocateClassPair(CAAnimation,"CAPropertyAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyPath"),new objj_ivar("_isCumulative"),new objj_ivar("_isAdditive")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setKeyPath:"),function(_20,_21,_22){
with(_20){
_keyPath=_22;
}
}),new objj_method(sel_getUid("keyPath"),function(_23,_24){
with(_23){
return _keyPath;
}
}),new objj_method(sel_getUid("setCumulative:"),function(_25,_26,_27){
with(_25){
_isCumulative=_27;
}
}),new objj_method(sel_getUid("cumulative"),function(_28,_29){
with(_28){
return _isCumulative;
}
}),new objj_method(sel_getUid("isCumulative"),function(_2a,_2b){
with(_2a){
return _isCumulative;
}
}),new objj_method(sel_getUid("setAdditive:"),function(_2c,_2d,_2e){
with(_2c){
_isAdditive=_2e;
}
}),new objj_method(sel_getUid("additive"),function(_2f,_30){
with(_2f){
return _isAdditive;
}
}),new objj_method(sel_getUid("isAdditive"),function(_31,_32){
with(_31){
return _isAdditive;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("animationWithKeyPath:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_33,"animation");
objj_msgSend(_36,"setKeyPath:",_35);
return _36;
}
})]);
var _1=objj_allocateClassPair(CAPropertyAnimation,"CABasicAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fromValue"),new objj_ivar("_toValue"),new objj_ivar("_byValue")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setFromValue:"),function(_37,_38,_39){
with(_37){
_fromValue=_39;
}
}),new objj_method(sel_getUid("fromValue"),function(_3a,_3b){
with(_3a){
return _fromValue;
}
}),new objj_method(sel_getUid("setToValue:"),function(_3c,_3d,_3e){
with(_3c){
_toValue=_3e;
}
}),new objj_method(sel_getUid("toValue"),function(_3f,_40){
with(_3f){
return _toValue;
}
}),new objj_method(sel_getUid("setByValue:"),function(_41,_42,_43){
with(_41){
_byValue=_43;
}
}),new objj_method(sel_getUid("byValue"),function(_44,_45){
with(_44){
return _byValue;
}
})]);
p;16;CABackingStore.ji;12;CGGeometry.ji;17;CPCompatibility.jc;599;
CABackingStoreGetContext=function(_1){
return _1.context;
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CABackingStoreCreate=function(){
var _2=document.createElement("canvas");
_2.style.position="absolute";
return {context:_2.getContext("2d"),buffer:_2,_image:_2};
};
CABackingStoreSetSize=function(_3,_4){
var _5=_3.buffer;
_5.width=_4.width;
_5.height=_4.height;
_5.style.width=_4.width+"px";
_5.style.height=_4.height+"px";
};
}else{
CABackingStoreCreate=function(){
var _6=CGBitmapGraphicsContextCreate();
_6.buffer="";
return {context:_6};
};
CABackingStoreSetSize=function(_7,_8){
};
}
p;14;CAFlashLayer.ji;9;CALayer.ji;14;CPFlashMovie.jc;803;
var _1=objj_allocateClassPair(CALayer,"CAFlashLayer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_flashMovie")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setFlashMovie:"),function(_3,_4,_5){
with(_3){
if(_flashMovie==_5){
return;
}
_flashMovie=_5;
_DOMElement.innerHTML="<object width = \"100%\" height = \"100%\"><param name = \"movie\" value = \""+_5._fileName+"\"></param><param name = \"wmode\" value = \"transparent\"></param><embed src = \""+_5._fileName+"\" type = \"application/x-shockwave-flash\" wmode = \"transparent\" width = \"100%\" height = \"100%\"></embed></object>";
}
}),new objj_method(sel_getUid("flashMovie"),function(_6,_7){
with(_6){
return _flashMovie;
}
})]);
p;9;CALayer.jI;21;Foundation/CPObject.jI;23;AppKit/CABackingStore.jI;18;AppKit/CGContext.jI;19;AppKit/CGGeometry.ji;12;CGGeometry.jc;24559;
CGAffineTransformMake=function(a,b,c,d,tx,ty){
return {a:a,b:b,c:c,d:d,tx:tx,ty:ty};
};
CGAffineTransformMakeIdentity=function(){
return {a:1,b:0,c:0,d:1,tx:0,ty:0};
};
CGAffineTransformMakeCopy=function(_1){
return {a:_1.a,b:_1.b,c:_1.c,d:_1.d,tx:_1.tx,ty:_1.ty};
};
CGAffineTransformMakeScale=function(sx,sy){
return {a:sx,b:0,c:0,d:sy,tx:0,ty:0};
};
CGAffineTransformMakeTranslation=function(tx,ty){
return {a:1,b:0,c:0,d:1,tx:tx,ty:ty};
};
CGAffineTransformTranslate=function(_2,tx,ty){
return {a:_2.a,b:_2.b,c:_2.c,d:_2.d,tx:_2.tx+_2.a*tx+_2.c*ty,ty:_2.ty+_2.b*tx+_2.d*ty};
};
CGAffineTransformScale=function(_3,sx,sy){
return {a:_3.a*sx,b:_3.b*sx,c:_3.c*sy,d:_3.d*sy,tx:_3.tx,ty:_3.ty};
};
CGAffineTransformConcat=function(_4,_5){
return {a:_4.a*_5.a+_4.b*_5.c,b:_4.a*_5.b+_4.b*_5.d,c:_4.c*_5.a+_4.d*_5.c,d:_4.c*_5.b+_4.d*_5.d,tx:_4.tx*_5.a+_4.ty*_5.c+_5.tx,ty:_4.tx*_5.b+_4.ty*_5.d+_5.ty};
};
CGPointApplyAffineTransform=function(_6,_7){
return {x:_6.x*_7.a+_6.y*_7.c+_7.tx,y:_6.x*_7.b+_6.y*_7.d+_7.ty};
};
CGSizeApplyAffineTransform=function(_8,_9){
return {width:_8.width*_9.a+_8.height*_9.c,height:_8.width*_9.b+_8.height*_9.d};
};
CGAffineTransformIsIdentity=function(_a){
return (_a.a==1&&_a.b==0&&_a.c==0&&_a.d==1&&_a.tx==0&&_a.ty==0);
};
CGAffineTransformEqualToTransform=function(_b,_c){
return (_b.a==_c.a&&_b.b==_c.b&&_b.c==_c.c&&_b.d==_c.d&&_b.tx==_c.tx&&_b.ty==_c.ty);
};
CGStringCreateWithCGAffineTransform=function(_d){
return (" [[ "+_d.a+", "+_d.b+", 0 ], [ "+_d.c+", "+_d.d+", 0 ], [ "+_d.tx+", "+_d.ty+", 1]]");
};
CGAffineTransformCreateCopy=function(_e){
return {a:_e.a,b:_e.b,c:_e.c,d:_e.d,tx:_e.tx,ty:_e.ty};
};
CGAffineTransformMakeRotation=function(_f){
var sin=SIN(_f),cos=COS(_f);
return {a:cos,b:sin,c:-sin,d:cos,tx:0,ty:0};
};
CGAffineTransformRotate=function(_10,_11){
var sin=SIN(_11),cos=COS(_11);
return {a:_10.a*cos+_10.c*sin,b:_10.b*cos+_10.d*sin,c:_10.c*cos-_10.a*sin,d:_10.d*cos-_10.b*sin,tx:_10.tx,ty:_10.ty};
};
CGAffineTransformInvert=function(_12){
var _13=1/(_12.a*_12.d-_12.b*_12.c);
return {a:_13*_12.d,b:-_13*_12.b,c:-_13*_12.c,d:_13*_12.a,tx:_13*(_12.c*_12.ty-_12.d*_12.tx),ty:_13*(_12.b*_12.tx-_12.a*_12.ty)};
};
CGRectApplyAffineTransform=function(_14,_15){
var top=(_14.origin.y),_16=(_14.origin.x),_17=(_14.origin.x+_14.size.width),_18=(_14.origin.y+_14.size.height),_19=CGPointApplyAffineTransform({x:_16,y:top},_15),_1a=CGPointApplyAffineTransform({x:_17,y:top},_15),_1b=CGPointApplyAffineTransform({x:_16,y:_18},_15),_1c=CGPointApplyAffineTransform({x:_17,y:_18},_15),_1d=MIN(_19.x,_1a.x,_1b.x,_1c.x),_1e=MAX(_19.x,_1a.x,_1b.x,_1c.x),_1f=MIN(_19.y,_1a.y,_1b.y,_1c.y),_20=MAX(_19.y,_1a.y,_1b.y,_1c.y);
return {origin:{x:_1d,y:_1f},size:{width:(_1e-_1d),height:(_20-_1f)}};
};
CPStringFromCGAffineTransform=function(_21){
return "{"+_21.a+", "+_21.b+", "+_21.c+", "+_21.d+", "+_21.tx+", "+_21.ty+"}";
};
var _22=1,_23=2,_24=4,_25=8,_26=16;
var _27=NO;
var _28=1,_29=2,_2a=4,_2b=8,_2c=16,_2d=_2a|_28|_29;
var _2e=nil;
var _2f=objj_allocateClassPair(CPObject,"CALayer"),_30=_2f.isa;
class_addIvars(_2f,[new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_position"),new objj_ivar("_zPosition"),new objj_ivar("_anchorPoint"),new objj_ivar("_affineTransform"),new objj_ivar("_sublayerTransform"),new objj_ivar("_sublayerTransformForSublayers"),new objj_ivar("_backingStoreFrame"),new objj_ivar("_standardBackingStoreFrame"),new objj_ivar("_hasSublayerTransform"),new objj_ivar("_hasCustomBackingStoreFrame"),new objj_ivar("_opacity"),new objj_ivar("_isHidden"),new objj_ivar("_backgroundColor"),new objj_ivar("_superlayer"),new objj_ivar("_sublayers"),new objj_ivar("_runLoopUpdateMask"),new objj_ivar("_needsDisplayOnBoundsChange"),new objj_ivar("_delegate"),new objj_ivar("_delegateRespondsToDisplayLayerSelector"),new objj_ivar("_delegateRespondsToDrawLayerInContextSelector"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_contents"),new objj_ivar("_context"),new objj_ivar("_owningView"),new objj_ivar("_transformToLayer"),new objj_ivar("_transformFromLayer")]);
objj_registerClassPair(_2f);
objj_addClassForBundle(_2f,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2f,[new objj_method(sel_getUid("init"),function(_31,_32){
with(_31){
_31=objj_msgSendSuper({receiver:_31,super_class:objj_getClass("CPObject")},"init");
if(_31){
_frame=CGRectMakeZero();
_backingStoreFrame=CGRectMakeZero();
_standardBackingStoreFrame=CGRectMakeZero();
_bounds=CGRectMakeZero();
_position=CGPointMakeZero();
_zPosition=0;
_anchorPoint=CGPointMake(0.5,0.5);
_affineTransform=CGAffineTransformMakeIdentity();
_sublayerTransform=CGAffineTransformMakeIdentity();
_transformToLayer=CGAffineTransformMakeIdentity();
_transformFromLayer=CGAffineTransformMakeIdentity();
_opacity=1;
_isHidden=NO;
_masksToBounds=NO;
_sublayers=[];
_DOMElement=document.createElement("div");
_DOMElement.style.overflow="visible";
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.top="0px";
_DOMElement.style.left="0px";
_DOMElement.style.zIndex=0;
_DOMElement.style.width="0px";
_DOMElement.style.height="0px";
}
return _31;
}
}),new objj_method(sel_getUid("setBounds:"),function(_33,_34,_35){
with(_33){
if(CGRectEqualToRect(_bounds,_35)){
return;
}
var _36=_bounds.origin;
_bounds={origin:{x:_35.origin.x,y:_35.origin.y},size:{width:_35.size.width,height:_35.size.height}};
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_33);
}
_CALayerRecalculateGeometry(_33,_22);
}
}),new objj_method(sel_getUid("bounds"),function(_37,_38){
with(_37){
return _bounds;
}
}),new objj_method(sel_getUid("setPosition:"),function(_39,_3a,_3b){
with(_39){
if(CGPointEqualToPoint(_position,_3b)){
return;
}
_position={x:_3b.x,y:_3b.y};
_CALayerRecalculateGeometry(_39,_23);
}
}),new objj_method(sel_getUid("position"),function(_3c,_3d){
with(_3c){
return _position;
}
}),new objj_method(sel_getUid("setZPosition:"),function(_3e,_3f,_40){
with(_3e){
if(_zPosition==_40){
return;
}
_zPosition=_40;
objj_msgSend(_3e,"registerRunLoopUpdateWithMask:",_2a);
}
}),new objj_method(sel_getUid("setAnchorPoint:"),function(_41,_42,_43){
with(_41){
_43={x:_43.x,y:_43.y};
_43.x=MIN(1,MAX(0,_43.x));
_43.y=MIN(1,MAX(0,_43.y));
if(CGPointEqualToPoint(_anchorPoint,_43)){
return;
}
_anchorPoint=_43;
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_41);
}
if(_owningView){
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
}
_CALayerRecalculateGeometry(_41,_24);
}
}),new objj_method(sel_getUid("anchorPoint"),function(_44,_45){
with(_44){
return _anchorPoint;
}
}),new objj_method(sel_getUid("setAffineTransform:"),function(_46,_47,_48){
with(_46){
if(CGAffineTransformEqualToTransform(_affineTransform,_48)){
return;
}
_affineTransform={a:_48.a,b:_48.b,c:_48.c,d:_48.d,tx:_48.tx,ty:_48.ty};
_CALayerRecalculateGeometry(_46,_25);
}
}),new objj_method(sel_getUid("affineTransform"),function(_49,_4a){
with(_49){
return _affineTransform;
}
}),new objj_method(sel_getUid("setSublayerTransform:"),function(_4b,_4c,_4d){
with(_4b){
if(CGAffineTransformEqualToTransform(_sublayerTransform,_4d)){
return;
}
var _4e=_hasSublayerTransform;
_sublayerTransform={a:_4d.a,b:_4d.b,c:_4d.c,d:_4d.d,tx:_4d.tx,ty:_4d.ty};
_hasSublayerTransform=!(_sublayerTransform.a==1&&_sublayerTransform.b==0&&_sublayerTransform.c==0&&_sublayerTransform.d==1&&_sublayerTransform.tx==0&&_sublayerTransform.ty==0);
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_4b);
var _4f=_sublayers.length;
while(_4f--){
_CALayerRecalculateGeometry(_sublayers[_4f],_26);
}
}
}
}),new objj_method(sel_getUid("sublayerTransform"),function(_50,_51){
with(_50){
return _sublayerTransform;
}
}),new objj_method(sel_getUid("transformToLayer"),function(_52,_53){
with(_52){
return _transformToLayer;
}
}),new objj_method(sel_getUid("setFrame:"),function(_54,_55,_56){
with(_54){
alert("FIXME IMPLEMENT");
}
}),new objj_method(sel_getUid("frame"),function(_57,_58){
with(_57){
if(!_frame){
_frame=objj_msgSend(_57,"convertRect:toLayer:",_bounds,_superlayer);
}
return _frame;
}
}),new objj_method(sel_getUid("backingStoreFrame"),function(_59,_5a){
with(_59){
return _backingStoreFrame;
}
}),new objj_method(sel_getUid("setBackingStoreFrame:"),function(_5b,_5c,_5d){
with(_5b){
_hasCustomBackingStoreFrame=(_5d!=nil);
if(_5d==nil){
_5d=CGRectMakeCopy(_standardBackingStoreFrame);
}else{
if(_superlayer){
_5d=objj_msgSend(_superlayer,"convertRect:toLayer:",_5d,nil);
var _5e=objj_msgSend(_superlayer,"bounds"),_5f=objj_msgSend(_superlayer,"convertRect:toLayer:",_5e,nil);
_5d.origin.x-=(_5f.origin.x);
_5d.origin.y-=(_5f.origin.y);
}else{
_5d=CGRectMakeCopy(_5d);
}
}
if(!CGPointEqualToPoint(_backingStoreFrame.origin,_5d.origin)){
objj_msgSend(_5b,"registerRunLoopUpdateWithMask:",_28);
}
if(!CGSizeEqualToSize(_backingStoreFrame.size,_5d.size)){
objj_msgSend(_5b,"registerRunLoopUpdateWithMask:",_29);
}
_backingStoreFrame=_5d;
}
}),new objj_method(sel_getUid("contents"),function(_60,_61){
with(_60){
return _contents;
}
}),new objj_method(sel_getUid("setContents:"),function(_62,_63,_64){
with(_62){
if(_contents==_64){
return;
}
_contents=_64;
objj_msgSend(_62,"composite");
}
}),new objj_method(sel_getUid("composite"),function(_65,_66){
with(_65){
if(_27&&!_contents||!_context){
return;
}
CGContextClearRect(_context,{origin:{x:0,y:0},size:{width:(_backingStoreFrame.size.width),height:(_backingStoreFrame.size.height)}});
var _67=_transformFromLayer;
if(_superlayer){
var _68=_CALayerGetTransform(_superlayer,nil),_69=CGPointApplyAffineTransform(_superlayer._bounds.origin,_68);
_67=CGAffineTransformConcat(_67,_68);
_67.tx-=_69.x;
_67.ty-=_69.y;
}
_67.tx-=(_backingStoreFrame.origin.x);
_67.ty-=(_backingStoreFrame.origin.y);
CGContextSaveGState(_context);
CGContextConcatCTM(_context,_67);
if(_27){
_context.drawImage(_contents.buffer,(_bounds.origin.x),(_bounds.origin.y));
}else{
objj_msgSend(_65,"drawInContext:",_context);
}
CGContextRestoreGState(_context);
}
}),new objj_method(sel_getUid("display"),function(_6a,_6b){
with(_6a){
if(!_context){
_context=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_context.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_backingStoreFrame.size.width));
_DOMContentsElement.height=ROUND((_backingStoreFrame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_backingStoreFrame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_backingStoreFrame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
}
if(_27){
if(_delegateRespondsToDisplayLayerSelector){
return objj_msgSend(_delegate,"displayInLayer:",_6a);
}
if((_backingStoreFrame.size.width)==0||(_backingStoreFrame.size.height)==0){
return;
}
if(!_contents){
_contents=CABackingStoreCreate();
}
CABackingStoreSetSize(_contents,_bounds.size);
objj_msgSend(_6a,"drawInContext:",CABackingStoreGetContext(_contents));
}
objj_msgSend(_6a,"composite");
}
}),new objj_method(sel_getUid("drawInContext:"),function(_6c,_6d,_6e){
with(_6c){
if(_backgroundColor){
CGContextSetFillColor(_6e,_backgroundColor);
CGContextFillRect(_6e,_bounds);
}
if(_delegateRespondsToDrawLayerInContextSelector){
objj_msgSend(_delegate,"drawLayer:inContext:",_6c,_6e);
}
}
}),new objj_method(sel_getUid("opacity"),function(_6f,_70){
with(_6f){
return _opacity;
}
}),new objj_method(sel_getUid("setOpacity:"),function(_71,_72,_73){
with(_71){
if(_opacity==_73){
return;
}
_opacity=_73;
_DOMElement.style.opacity=_73;
_DOMElement.style.filter="alpha(opacity="+_73*100+")";
}
}),new objj_method(sel_getUid("setHidden:"),function(_74,_75,_76){
with(_74){
_isHidden=_76;
_DOMElement.style.display=_76?"none":"block";
}
}),new objj_method(sel_getUid("hidden"),function(_77,_78){
with(_77){
return _isHidden;
}
}),new objj_method(sel_getUid("isHidden"),function(_79,_7a){
with(_79){
return _isHidden;
}
}),new objj_method(sel_getUid("setMasksToBounds:"),function(_7b,_7c,_7d){
with(_7b){
if(_masksToBounds==_7d){
return;
}
_masksToBounds=_7d;
_DOMElement.style.overflow=_masksToBounds?"hidden":"visible";
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_7e,_7f,_80){
with(_7e){
_backgroundColor=_80;
objj_msgSend(_7e,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("backgroundColor"),function(_81,_82){
with(_81){
return _backgroundColor;
}
}),new objj_method(sel_getUid("sublayers"),function(_83,_84){
with(_83){
return _sublayers;
}
}),new objj_method(sel_getUid("superlayer"),function(_85,_86){
with(_85){
return _superlayer;
}
}),new objj_method(sel_getUid("addSublayer:"),function(_87,_88,_89){
with(_87){
objj_msgSend(_87,"insertSublayer:atIndex:",_89,_sublayers.length);
return;
if(_DOMContentsElement&&_89._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"addObject:",_89);
_DOMElement.appendChild(_89._DOMElement);
}
}),new objj_method(sel_getUid("removeFromSuperlayer"),function(_8a,_8b){
with(_8a){
if(_owningView){
objj_msgSend(_owningView,"setLayer:",nil);
}
if(!_superlayer){
return;
}
_superlayer._DOMElement.removeChild(_DOMElement);
objj_msgSend(_superlayer._sublayers,"removeObject:",_8a);
_superlayer=nil;
}
}),new objj_method(sel_getUid("insertSublayer:atIndex:"),function(_8c,_8d,_8e,_8f){
with(_8c){
if(!_8e){
return;
}
var _90=objj_msgSend(_8e,"superlayer");
if(_90==_8c){
var _91=objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_8e);
if(_91==_8f){
return;
}
objj_msgSend(_sublayers,"removeObjectAtIndex:",_91);
if(_91<_8f){
--_8f;
}
}else{
if(_90!=nil){
objj_msgSend(_8e,"removeFromSuperlayer");
}
}
if(_DOMContentsElement&&_8e._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"insertObject:atIndex:",_8e,_8f);
if(_8f>=_sublayers.length-1){
_DOMElement.appendChild(_8e._DOMElement);
}else{
_DOMElement.insertBefore(_8e._DOMElement,_sublayers[_8f+1]._DOMElement);
}
_8e._superlayer=_8c;
if(_8c!=_90){
_CALayerRecalculateGeometry(_8e,268435455);
}
}
}),new objj_method(sel_getUid("insertSublayer:below:"),function(_92,_93,_94,_95){
with(_92){
var _96=_95?objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_95):0;
objj_msgSend(_92,"insertSublayer:atIndex:",_94,_96==CPNotFound?_sublayers.length:_96);
}
}),new objj_method(sel_getUid("insertSublayer:above:"),function(_97,_98,_99,_9a){
with(_97){
var _9b=_9a?objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_9a):_sublayers.length;
if(_9b==CPNotFound){
objj_msgSend(CPException,"raise:reason:","CALayerNotFoundException","aSublayer is not a sublayer of this layer");
}
objj_msgSend(_sublayers,"insertObject:atIndex:",_99,_9b==CPNotFound?_sublayers.length:_9b+1);
}
}),new objj_method(sel_getUid("replaceSublayer:with:"),function(_9c,_9d,_9e,_9f){
with(_9c){
if(_9e==_9f){
return;
}
if(_9e._superlayer!=_9c){
alert("EXCEPTION");
return;
}
if(_DOMContentsElement&&_9f._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"replaceObjectAtIndex:withObject:",objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_9e),_9f);
_DOMElement.replaceChild(_9e._DOMElement,_9f._DOMElement);
}
}),new objj_method(sel_getUid("registerRunLoopUpdateWithMask:"),function(_a0,_a1,_a2){
with(_a0){
if(_2e==nil){
_2e={};
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("runLoopUpdateLayers"),CALayer,nil,0,[CPDefaultRunLoopMode]);
}
_runLoopUpdateMask|=_a2;
_2e[objj_msgSend(_a0,"UID")]=_a0;
}
}),new objj_method(sel_getUid("setNeedsComposite"),function(_a3,_a4){
with(_a3){
objj_msgSend(_a3,"registerRunLoopUpdateWithMask:",_2c);
}
}),new objj_method(sel_getUid("setNeedsDisplay"),function(_a5,_a6){
with(_a5){
objj_msgSend(_a5,"registerRunLoopUpdateWithMask:",_2b);
}
}),new objj_method(sel_getUid("setNeedsDisplayOnBoundsChange:"),function(_a7,_a8,_a9){
with(_a7){
_needsDisplayOnBoundsChange=_a9;
}
}),new objj_method(sel_getUid("needsDisplayOnBoundsChange"),function(_aa,_ab){
with(_aa){
return _needsDisplayOnBoundsChange;
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(_ac,_ad,_ae){
with(_ac){
_dirtyRect=_ae;
objj_msgSend(_ac,"display");
}
}),new objj_method(sel_getUid("convertPoint:fromLayer:"),function(_af,_b0,_b1,_b2){
with(_af){
return CGPointApplyAffineTransform(_b1,_CALayerGetTransform(_b2,_af));
}
}),new objj_method(sel_getUid("convertPoint:toLayer:"),function(_b3,_b4,_b5,_b6){
with(_b3){
return CGPointApplyAffineTransform(_b5,_CALayerGetTransform(_b3,_b6));
}
}),new objj_method(sel_getUid("convertRect:fromLayer:"),function(_b7,_b8,_b9,_ba){
with(_b7){
return CGRectApplyAffineTransform(_b9,_CALayerGetTransform(_ba,_b7));
}
}),new objj_method(sel_getUid("convertRect:toLayer:"),function(_bb,_bc,_bd,_be){
with(_bb){
return CGRectApplyAffineTransform(_bd,_CALayerGetTransform(_bb,_be));
}
}),new objj_method(sel_getUid("containsPoint:"),function(_bf,_c0,_c1){
with(_bf){
return (_c1.x>=(_bounds.origin.x)&&_c1.y>=(_bounds.origin.y)&&_c1.x<(_bounds.origin.x+_bounds.size.width)&&_c1.y<(_bounds.origin.y+_bounds.size.height));
}
}),new objj_method(sel_getUid("hitTest:"),function(_c2,_c3,_c4){
with(_c2){
if(_isHidden){
return nil;
}
var _c5=CGPointApplyAffineTransform(_c4,_transformToLayer);
if(!(_c5.x>=(_bounds.origin.x)&&_c5.y>=(_bounds.origin.y)&&_c5.x<(_bounds.origin.x+_bounds.size.width)&&_c5.y<(_bounds.origin.y+_bounds.size.height))){
return nil;
}
var _c6=nil,_c7=_sublayers.length;
while(_c7--){
if(_c6=objj_msgSend(_sublayers[_c7],"hitTest:",_c5)){
return _c6;
}
}
return _c2;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_c8,_c9,_ca){
with(_c8){
if(_delegate==_ca){
return;
}
_delegate=_ca;
_delegateRespondsToDisplayLayerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("displayLayer:"));
_delegateRespondsToDrawLayerInContextSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("drawLayer:inContext:"));
if(_delegateRespondsToDisplayLayerSelector||_delegateRespondsToDrawLayerInContextSelector){
objj_msgSend(_c8,"setNeedsDisplay");
}
}
}),new objj_method(sel_getUid("delegate"),function(_cb,_cc){
with(_cb){
return _delegate;
}
}),new objj_method(sel_getUid("_setOwningView:"),function(_cd,_ce,_cf){
with(_cd){
_owningView=_cf;
if(_owningView){
_owningView=_cf;
_bounds.size=CGSizeMakeCopy(objj_msgSend(_owningView,"bounds").size);
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
}
_CALayerRecalculateGeometry(_cd,_23|_22);
}
}),new objj_method(sel_getUid("_owningViewBoundsChanged"),function(_d0,_d1){
with(_d0){
_bounds.size=CGSizeMakeCopy(objj_msgSend(_owningView,"bounds").size);
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
_CALayerRecalculateGeometry(_d0,_23|_22);
}
}),new objj_method(sel_getUid("_update"),function(_d2,_d3){
with(_d2){
window.loop=true;
var _d4=_runLoopUpdateMask;
if(_d4&_2d){
_CALayerUpdateDOM(_d2,_d4);
}
if(_d4&_2b){
objj_msgSend(_d2,"display");
}else{
if(_d4&_29||_d4&_2c){
objj_msgSend(_d2,"composite");
}
}
_runLoopUpdateMask=0;
window.loop=false;
}
})]);
class_addMethods(_30,[new objj_method(sel_getUid("layer"),function(_d5,_d6){
with(_d5){
return objj_msgSend(objj_msgSend(objj_msgSend(_d5,"class"),"alloc"),"init");
}
}),new objj_method(sel_getUid("runLoopUpdateLayers"),function(_d7,_d8){
with(_d7){
if(window.oops){
alert(window.latest);
objj_debug_print_backtrace();
}
window.loop=true;
for(UID in _2e){
var _d9=_2e[UID],_da=_d9._runLoopUpdateMask;
if(_da&_2d){
_CALayerUpdateDOM(_d9,_da);
}
if(_da&_2b){
objj_msgSend(_d9,"display");
}else{
if(_da&_29||_da&_2c){
objj_msgSend(_d9,"composite");
}
}
_d9._runLoopUpdateMask=0;
}
window.loop=false;
_2e=nil;
}
})]);
_CALayerUpdateSublayerTransformForSublayers=function(_db){
var _dc=_db._bounds,_dd=_db._anchorPoint,_de=(_dc.size.width)*_dd.x,_df=(_dc.size.height)*_dd.y;
_db._sublayerTransformForSublayers=CGAffineTransformConcat(CGAffineTransformMakeTranslation(-_de,-_df),CGAffineTransformConcat(_db._sublayerTransform,CGAffineTransformMakeTranslation(_de,_df)));
};
_CALayerUpdateDOM=function(_e0,_e1){
var _e2=_e0._DOMElement.style;
if(_e1&_2a){
_e2.zIndex=_e0._zPosition;
}
var _e3=_e0._backingStoreFrame;
if(_e1&_28){
_e2.top=ROUND((_e3.origin.y))+"px";
_e2.left=ROUND((_e3.origin.x))+"px";
}
if(_e1&_29){
var _e4=MAX(0,ROUND((_e3.size.width))),_e5=MAX(0,ROUND((_e3.size.height))),_e6=_e0._DOMContentsElement;
_e2.width=_e4+"px";
_e2.height=_e5+"px";
if(_e6){
_e6.width=_e4;
_e6.height=_e5;
_e6.style.width=_e4+"px";
_e6.style.height=_e5+"px";
}
}
};
_CALayerRecalculateGeometry=function(_e7,_e8){
var _e9=_e7._bounds,_ea=_e7._superlayer,_eb=(_e9.size.width),_ec=(_e9.size.height),_ed=_e7._position,_ee=_e7._anchorPoint,_ef=_e7._affineTransform,_f0={width:_e7._backingStoreFrame.width,height:_e7._backingStoreFrame.height},_f1=_e7._hasCustomBackingStoreFrame;
_e7._transformFromLayer=CGAffineTransformConcat(CGAffineTransformMakeTranslation(-_eb*_ee.x-(_e7._bounds.origin.x),-_ec*_ee.y-(_e7._bounds.origin.y)),CGAffineTransformConcat(_ef,CGAffineTransformMakeTranslation(_ed.x,_ed.y)));
if(_ea&&_ea._hasSublayerTransform){
var tx=_e7._transformFromLayer.tx*_ea._sublayerTransformForSublayers.a+_e7._transformFromLayer.ty*_ea._sublayerTransformForSublayers.c+_ea._sublayerTransformForSublayers.tx;
_e7._transformFromLayer.ty=_e7._transformFromLayer.tx*_ea._sublayerTransformForSublayers.b+_e7._transformFromLayer.ty*_ea._sublayerTransformForSublayers.d+_ea._sublayerTransformForSublayers.ty;
_e7._transformFromLayer.tx=tx;
var a=_e7._transformFromLayer.a*_ea._sublayerTransformForSublayers.a+_e7._transformFromLayer.b*_ea._sublayerTransformForSublayers.c,b=_e7._transformFromLayer.a*_ea._sublayerTransformForSublayers.b+_e7._transformFromLayer.b*_ea._sublayerTransformForSublayers.d,c=_e7._transformFromLayer.c*_ea._sublayerTransformForSublayers.a+_e7._transformFromLayer.d*_ea._sublayerTransformForSublayers.c;
_e7._transformFromLayer.d=_e7._transformFromLayer.c*_ea._sublayerTransformForSublayers.b+_e7._transformFromLayer.d*_ea._sublayerTransformForSublayers.d;
_e7._transformFromLayer.a=a;
_e7._transformFromLayer.b=b;
_e7._transformFromLayer.c=c;
}
_e7._transformToLayer=CGAffineTransformInvert(_e7._transformFromLayer);
_e7._frame=nil;
_e7._standardBackingStoreFrame=objj_msgSend(_e7,"convertRect:toLayer:",_e9,nil);
if(_ea){
var _e9=objj_msgSend(_ea,"bounds"),_f2=objj_msgSend(_ea,"convertRect:toLayer:",_e9,nil);
_e7._standardBackingStoreFrame.origin.x-=(_f2.origin.x);
_e7._standardBackingStoreFrame.origin.y-=(_f2.origin.y);
}
var _f3=_e7._standardBackingStoreFrame.origin,_f4=_e7._standardBackingStoreFrame.size;
_f3.x=FLOOR(_f3.x);
_f3.y=FLOOR(_f3.y);
_f4.width=CEIL(_f4.width)+1;
_f4.height=CEIL(_f4.height)+1;
if(!_f1){
var _f5=CGRectMakeCopy(_e7._standardBackingStoreFrame);
if(ROUND((_f5.origin.x))!=ROUND((_e7._backingStoreFrame.origin.x))||ROUND((_f5.origin.y))!=ROUND((_e7._backingStoreFrame.origin.y))){
objj_msgSend(_e7,"registerRunLoopUpdateWithMask:",_28);
}
if(((_f5.size.width)!=ROUND((_e7._backingStoreFrame.size.width))||(_f5.size.height)!=ROUND((_e7._backingStoreFrame.size.height)))){
objj_msgSend(_e7,"registerRunLoopUpdateWithMask:",_29);
}
_e7._backingStoreFrame=_f5;
}
if(_e8&_22&&_e7._needsDisplayOnBoundsChange){
objj_msgSend(_e7,"setNeedsDisplay");
}else{
if(_f1||(_e8&~(_23|_24))){
objj_msgSend(_e7,"setNeedsComposite");
}
}
var _f6=_e7._sublayers,_f7=0,_f8=_f6.length;
for(;_f7<_f8;++_f7){
_CALayerRecalculateGeometry(_f6[_f7],_e8);
}
};
_CALayerGetTransform=function(_f9,_fa){
var _fb=CGAffineTransformMakeIdentity();
if(_f9){
var _fc=_f9;
while(_fc&&_fc!=_fa){
var _fd=_fc._transformFromLayer;
var tx=_fb.tx*_fd.a+_fb.ty*_fd.c+_fd.tx;
_fb.ty=_fb.tx*_fd.b+_fb.ty*_fd.d+_fd.ty;
_fb.tx=tx;
var a=_fb.a*_fd.a+_fb.b*_fd.c,b=_fb.a*_fd.b+_fb.b*_fd.d,c=_fb.c*_fd.a+_fb.d*_fd.c;
_fb.d=_fb.c*_fd.b+_fb.d*_fd.d;
_fb.a=a;
_fb.b=b;
_fb.c=c;
_fc=_fc._superlayer;
}
if(_fc==_fa){
return _fb;
}
}
var _fe=[],_fc=_fa;
while(_fc){
_fe.push(_fc);
_fc=_fc._superlayer;
}
var _ff=_fe.length;
while(_ff--){
var _100=_fe[_ff]._transformToLayer;
var tx=_fb.tx*_100.a+_fb.ty*_100.c+_100.tx;
_fb.ty=_fb.tx*_100.b+_fb.ty*_100.d+_100.ty;
_fb.tx=tx;
var a=_fb.a*_100.a+_fb.b*_100.c,b=_fb.a*_100.b+_fb.b*_100.d,c=_fb.c*_100.a+_fb.d*_100.c;
_fb.d=_fb.c*_100.b+_fb.d*_100.d;
_fb.a=a;
_fb.b=b;
_fb.c=c;
}
return _fb;
};
p;23;CAMediaTimingFunction.jI;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2072;
kCAMediaTimingFunctionLinear="kCAMediaTimingFunctionLinear";
kCAMediaTimingFunctionEaseIn="kCAMediaTimingFunctionEaseIn";
kCAMediaTimingFunctionEaseOut="kCAMediaTimingFunctionEaseOut";
kCAMediaTimingFunctionEaseInEaseOut="kCAMediaTimingFunctionEaseInEaseOut";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CAMediaTimingFunction"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_c1x"),new objj_ivar("_c1y"),new objj_ivar("_c2x"),new objj_ivar("_c2y")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithControlPoints::::"),function(_4,_5,_6,_7,_8,_9){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_c1x=_6;
_c1y=_7;
_c2x=_8;
_c2y=_9;
}
return _4;
}
}),new objj_method(sel_getUid("getControlPointAtIndex:values:"),function(_a,_b,_c,_d){
with(_a){
if(_c==0){
_d[0]=0;
_d[1]=0;
}else{
if(_c==1){
_d[0]=_c1x;
_d[1]=_c1y;
}else{
if(_c==2){
_d[0]=_c2x;
_d[1]=_c2y;
}else{
_d[0]=1;
_d[1]=1;
}
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("functionWithName:"),function(_e,_f,_10){
with(_e){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0,0,1,1),kCAMediaTimingFunctionLinear);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.42,0,1,1),kCAMediaTimingFunctionEaseIn);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0,0,0.58,1),kCAMediaTimingFunctionEaseOut);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.42,0,0.58,1),kCAMediaTimingFunctionEaseInEaseOut);
}
return objj_msgSend(_1,"objectForKey:",_10);
}
}),new objj_method(sel_getUid("functionWithControlPoints::::"),function(_11,_12,c1x,c1y,c2x,c2y){
with(_11){
return objj_msgSend(objj_msgSend(_11,"alloc"),"initWithControlPoints::::",c1x,c1y,c2x,c2y);
}
})]);
p;19;CGAffineTransform.ji;12;CGGeometry.jc;2862;
CGAffineTransformMake=function(a,b,c,d,tx,ty){
return {a:a,b:b,c:c,d:d,tx:tx,ty:ty};
};
CGAffineTransformMakeIdentity=function(){
return {a:1,b:0,c:0,d:1,tx:0,ty:0};
};
CGAffineTransformMakeCopy=function(_1){
return {a:_1.a,b:_1.b,c:_1.c,d:_1.d,tx:_1.tx,ty:_1.ty};
};
CGAffineTransformMakeScale=function(sx,sy){
return {a:sx,b:0,c:0,d:sy,tx:0,ty:0};
};
CGAffineTransformMakeTranslation=function(tx,ty){
return {a:1,b:0,c:0,d:1,tx:tx,ty:ty};
};
CGAffineTransformTranslate=function(_2,tx,ty){
return {a:_2.a,b:_2.b,c:_2.c,d:_2.d,tx:_2.tx+_2.a*tx+_2.c*ty,ty:_2.ty+_2.b*tx+_2.d*ty};
};
CGAffineTransformScale=function(_3,sx,sy){
return {a:_3.a*sx,b:_3.b*sx,c:_3.c*sy,d:_3.d*sy,tx:_3.tx,ty:_3.ty};
};
CGAffineTransformConcat=function(_4,_5){
return {a:_4.a*_5.a+_4.b*_5.c,b:_4.a*_5.b+_4.b*_5.d,c:_4.c*_5.a+_4.d*_5.c,d:_4.c*_5.b+_4.d*_5.d,tx:_4.tx*_5.a+_4.ty*_5.c+_5.tx,ty:_4.tx*_5.b+_4.ty*_5.d+_5.ty};
};
CGPointApplyAffineTransform=function(_6,_7){
return {x:_6.x*_7.a+_6.y*_7.c+_7.tx,y:_6.x*_7.b+_6.y*_7.d+_7.ty};
};
CGSizeApplyAffineTransform=function(_8,_9){
return {width:_8.width*_9.a+_8.height*_9.c,height:_8.width*_9.b+_8.height*_9.d};
};
CGAffineTransformIsIdentity=function(_a){
return (_a.a==1&&_a.b==0&&_a.c==0&&_a.d==1&&_a.tx==0&&_a.ty==0);
};
CGAffineTransformEqualToTransform=function(_b,_c){
return (_b.a==_c.a&&_b.b==_c.b&&_b.c==_c.c&&_b.d==_c.d&&_b.tx==_c.tx&&_b.ty==_c.ty);
};
CGStringCreateWithCGAffineTransform=function(_d){
return (" [[ "+_d.a+", "+_d.b+", 0 ], [ "+_d.c+", "+_d.d+", 0 ], [ "+_d.tx+", "+_d.ty+", 1]]");
};
CGAffineTransformCreateCopy=function(_e){
return {a:_e.a,b:_e.b,c:_e.c,d:_e.d,tx:_e.tx,ty:_e.ty};
};
CGAffineTransformMakeRotation=function(_f){
var sin=SIN(_f),cos=COS(_f);
return {a:cos,b:sin,c:-sin,d:cos,tx:0,ty:0};
};
CGAffineTransformRotate=function(_10,_11){
var sin=SIN(_11),cos=COS(_11);
return {a:_10.a*cos+_10.c*sin,b:_10.b*cos+_10.d*sin,c:_10.c*cos-_10.a*sin,d:_10.d*cos-_10.b*sin,tx:_10.tx,ty:_10.ty};
};
CGAffineTransformInvert=function(_12){
var _13=1/(_12.a*_12.d-_12.b*_12.c);
return {a:_13*_12.d,b:-_13*_12.b,c:-_13*_12.c,d:_13*_12.a,tx:_13*(_12.c*_12.ty-_12.d*_12.tx),ty:_13*(_12.b*_12.tx-_12.a*_12.ty)};
};
CGRectApplyAffineTransform=function(_14,_15){
var top=(_14.origin.y),_16=(_14.origin.x),_17=(_14.origin.x+_14.size.width),_18=(_14.origin.y+_14.size.height),_19=CGPointApplyAffineTransform({x:_16,y:top},_15),_1a=CGPointApplyAffineTransform({x:_17,y:top},_15),_1b=CGPointApplyAffineTransform({x:_16,y:_18},_15),_1c=CGPointApplyAffineTransform({x:_17,y:_18},_15),_1d=MIN(_19.x,_1a.x,_1b.x,_1c.x),_1e=MAX(_19.x,_1a.x,_1b.x,_1c.x),_1f=MIN(_19.y,_1a.y,_1b.y,_1c.y),_20=MAX(_19.y,_1a.y,_1b.y,_1c.y);
return {origin:{x:_1d,y:_1f},size:{width:(_1e-_1d),height:(_20-_1f)}};
};
CPStringFromCGAffineTransform=function(_21){
return "{"+_21.a+", "+_21.b+", "+_21.c+", "+_21.d+", "+_21.tx+", "+_21.ty+"}";
};
p;9;CGColor.ji;14;CGColorSpace.jc;2065;
var _1=0;
CFHashCode=function(_2){
if(!_2.hash){
_2.hash=++_1;
}
return _2;
};
kCGColorWhite="kCGColorWhite";
kCGColorBlack="kCGColorBlack";
kCGColorClear="kCGColorClear";
var _3={};
CGColorGetConstantColor=function(_4){
alert("FIX ME");
};
CGColorRetain=function(_5){
return _5;
};
CGColorRelease=function(){
};
CGColorCreate=function(_6,_7){
if(!_6||!_7){
return NULL;
}
var _7=_7.slice();
CGColorSpaceStandardizeComponents(_6,_7);
var _8=CFHashCode(_6)+_7.join("");
if(_3[_8]){
return _3[_8];
}
return _3[_8]={colorspace:_6,pattern:NULL,components:_7};
};
CGColorCreateCopy=function(_9){
return _9;
};
CGColorCreateGenericGray=function(_a,_b){
return CGColorCreate(0,[_a,_b]);
};
CGColorCreateGenericRGB=function(_c,_d,_e,_f){
return CGColorCreate(0,[_c,_d,_e,_f]);
};
CGColorCreateGenericCMYK=function(_10,_11,_12,_13,_14){
return CGColorCreate(0,[_10,_11,_12,_13,_14]);
};
CGColorCreateCopyWithAlpha=function(_15,_16){
var _17=_15.components;
if(!_15||_16==_17[_17.length-1]){
return _15;
}
if(_15.pattern){
var _18=CGColorCreateWithPattern(_15.colorspace,_15.pattern,_17);
}else{
var _18=CGColorCreate(_15.colorspace,_17);
}
_18.components[_17.length-1]=_16;
return _18;
};
CGColorCreateWithPattern=function(_19,_1a,_1b){
if(!_19||!_1a||!_1b){
return NULL;
}
return {colorspace:_19,pattern:_1a,components:_1b.slice()};
};
CGColorEqualToColor=function(lhs,rhs){
if(lhs==rhs){
return true;
}
if(!lhs||!rhs){
return false;
}
var _1c=lhs.components,_1d=rhs.components,_1e=_1c.length;
if(_1e!=_1d.length){
return false;
}
while(_1e--){
if(_1c[_1e]!=_1d[_1e]){
return false;
}
}
if(lhs.pattern!=rhs.pattern){
return false;
}
if(CGColorSpaceEqualToColorSpace(lhs.colorspace,rhs.colorspace)){
return false;
}
return true;
};
CGColorGetAlpha=function(_1f){
var _20=_1f.components;
return _20[_20.length-1];
};
CGColorGetColorSpace=function(_21){
return _21.colorspace;
};
CGColorGetComponents=function(_22){
return _22.components;
};
CGColorGetNumberOfComponents=function(_23){
return _23.components.length;
};
CGColorGetPattern=function(_24){
return _24.pattern;
};
p;14;CGColorSpace.jc;3502;
kCGColorSpaceModelUnknown=-1;
kCGColorSpaceModelMonochrome=0;
kCGColorSpaceModelRGB=1;
kCGColorSpaceModelCMYK=2;
kCGColorSpaceModelLab=3;
kCGColorSpaceModelDeviceN=4;
kCGColorSpaceModelIndexed=5;
kCGColorSpaceModelPattern=6;
kCGColorSpaceGenericGray="CGColorSpaceGenericGray";
kCGColorSpaceGenericRGB="CGColorSpaceGenericRGB";
kCGColorSpaceGenericCMYK="CGColorSpaceGenericCMYK";
kCGColorSpaceGenericRGBLinear="CGColorSpaceGenericRGBLinear";
kCGColorSpaceGenericRGBHDR="CGColorSpaceGenericRGBHDR";
kCGColorSpaceAdobeRGB1998="CGColorSpaceAdobeRGB1998";
kCGColorSpaceSRGB="CGColorSpaceSRGB";
var _1={};
CGColorSpaceCreateCalibratedGray=function(_2,_3,_4){
return {model:kCGColorSpaceModelMonochrome,count:1,base:NULL};
};
CGColorSpaceCreateCalibratedRGB=function(_5,_6,_7){
return {model:kCGColorSpaceModelRGB,count:1,base:NULL};
};
CGColorSpaceCreateICCBased=function(_8,_9,_a,_b){
return NULL;
};
CGColorSpaceCreateLab=function(_c,_d,_e){
return NULL;
};
CGColorSpaceCreateDeviceCMYK=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK);
};
CGColorSpaceCreateDeviceGray=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
};
CGColorSpaceCreateDeviceRGB=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
};
CGColorSpaceCreateWithPlatformColorSpace=function(){
return NULL;
};
CGColorSpaceCreateIndexed=function(_f,_10,_11){
return NULL;
};
CGColorSpaceCreatePattern=function(_12){
if(_12){
return {model:kCGColorSpaceModelPattern,count:_12.count,base:_12};
}
return {model:kCGColorSpaceModelPattern,count:0,base:NULL};
};
CGColorSpaceCreateWithName=function(_13){
var _14=_1[_13];
if(_14){
return _14;
}
switch(_13){
case kCGColorSpaceGenericGray:
return _1[_13]={model:kCGColorSpaceModelMonochrome,count:1,base:NULL};
case kCGColorSpaceGenericRGB:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceGenericCMYK:
return _1[_13]={model:kCGColorSpaceModelCMYK,count:4,base:NULL};
case kCGColorSpaceGenericRGBLinear:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceGenericRGBHDR:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceAdobeRGB1998:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceSRGB:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
}
return NULL;
};
CGColorSpaceCopyICCProfile=function(_15){
return NULL;
};
CGColorSpaceGetNumberOfComponents=function(_16){
return _16.count;
};
CGColorSpaceGetTypeID=function(_17){
};
CGColorSpaceGetModel=function(_18){
return _18.model;
};
CGColorSpaceGetBaseColorSpace=function(_19){
};
CGColorSpaceGetColorTableCount=function(_1a){
};
CGColorSpaceGetColorTable=function(_1b){
};
CGColorSpaceRelease=function(_1c){
};
CGColorSpaceRetain=function(_1d){
return _1d;
};
CGColorSpaceStandardizeComponents=function(_1e,_1f){
var _20=_1e.count;
if(_20>_1f.length){
_1f[_20]=1;
return;
}
var _21=_1f[_20];
if(_21<0){
_1f[_20]=0;
}else{
if(_21>1){
_1f[_20]=1;
}else{
_1f[_20]=ROUND(_21*1000)/1000;
}
}
if(_1e.base){
_1e=_1e.base;
}
switch(_1e.model){
case kCGColorSpaceModelMonochrome:
case kCGColorSpaceModelRGB:
case kCGColorSpaceModelCMYK:
case kCGColorSpaceModelDeviceN:
while(_20--){
if(_20>_1f.length){
_1f[_20]=1;
return;
}
var _21=_1f[_20];
if(_21<0){
_1f[_20]=0;
}else{
if(_21>1){
_1f[_20]=1;
}else{
_1f[_20]=ROUND(_21*255)/255;
}
}
}
break;
case kCGColorSpaceModelIndexed:
case kCGColorSpaceModelLab:
case kCGColorSpaceModelPattern:
break;
}
};
p;11;CGContext.ji;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;20255;
kCGLineCapButt=0;
kCGLineCapRound=1;
kCGLineCapSquare=2;
kCGLineJoinMiter=0;
kCGLineJoinRound=1;
kCGLineJoinBevel=2;
kCGPathFill=0;
kCGPathEOFill=1;
kCGPathStroke=2;
kCGPathFillStroke=3;
kCGPathEOFillStroke=4;
kCGBlendModeNormal=0;
kCGBlendModeMultiply=1;
kCGBlendModeScreen=2;
kCGBlendModeOverlay=3;
kCGBlendModeDarken=4;
kCGBlendModeLighten=5;
kCGBlendModeColorDodge=6;
kCGBlendModeColorBurn=7;
kCGBlendModeSoftLight=8;
kCGBlendModeHardLight=9;
kCGBlendModeDifference=10;
kCGBlendModeExclusion=11;
kCGBlendModeHue=12;
kCGBlendModeSaturation=13;
kCGBlendModeColor=14;
kCGBlendModeLuminosity=15;
kCGBlendModeClear=16;
kCGBlendModeCopy=17;
kCGBlendModeSourceIn=18;
kCGBlendModeSourceOut=19;
kCGBlendModeSourceAtop=20;
kCGBlendModeDestinationOver=21;
kCGBlendModeDestinationIn=22;
kCGBlendModeDestinationOut=23;
kCGBlendModeDestinationAtop=24;
kCGBlendModeXOR=25;
kCGBlendModePlusDarker=26;
kCGBlendModePlusLighter=27;
CGContextRelease=function(){
};
CGContextRetain=function(_1){
return _1;
};
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CGGStateCreate=function(){
return {alpha:1,strokeStyle:"#000",fillStyle:"#ccc",lineWidth:1,lineJoin:kCGLineJoinMiter,lineCap:kCGLineCapButt,miterLimit:10,globalAlpha:1,blendMode:kCGBlendModeNormal,shadowOffset:{width:0,height:0},shadowBlur:0,shadowColor:NULL,CTM:{a:1,b:0,c:0,d:1,tx:0,ty:0}};
};
CGGStateCreateCopy=function(_2){
return {alpha:_2.alpha,strokeStyle:_2.strokeStyle,fillStyle:_2.fillStyle,lineWidth:_2.lineWidth,lineJoin:_2.lineJoin,lineCap:_2.lineCap,miterLimit:_2.miterLimit,globalAlpha:_2.globalAlpha,blendMode:_2.blendMode,shadowOffset:_2.shadowOffset,shadowBlur:_2.shadowBlur,shadowColor:_2.shadowColor,CTM:{a:_2.CTM.a,b:_2.CTM.b,c:_2.CTM.c,d:_2.CTM.d,tx:_2.CTM.tx,ty:_2.CTM.ty}};
};
CGBitmapGraphicsContextCreate=function(){
return {DOMElement:document.createElement("div"),path:NULL,gState:CGGStateCreate(),gStateStack:[]};
};
CGContextSaveGState=function(_3){
_3.gStateStack.push(CGGStateCreateCopy(_3.gState));
};
CGContextRestoreGState=function(_4){
_4.gState=_4.gStateStack.pop();
};
CGContextSetLineCap=function(_5,_6){
_5.gState.lineCap=_6;
};
CGContextSetLineJoin=function(_7,_8){
_7.gState.lineJoin=_8;
};
CGContextSetLineWidth=function(_9,_a){
_9.gState.lineWidth=_a;
};
CGContextSetMiterLimit=function(_b,_c){
_b.gState.miterLimit=_c;
};
CGContextSetBlendMode=function(_d,_e){
_d.gState.blendMode=_e;
};
CGContextAddArc=function(_f,x,y,_10,_11,_12,_13){
CGPathAddArc(_f.path,_f.gState.CTM,x,y,_10,_11,_12,_13);
};
CGContextAddArcToPoint=function(_14,x1,y1,x2,y2,_15){
CGPathAddArcToPoint(_14.path,_14.gState.CTM,x1,y1,x2,y2,_15);
};
CGContextAddCurveToPoint=function(_16,_17,_18,_19,_1a,x,y){
CGPathAddCurveToPoint(_16.path,_16.gState.CTM,_17,_18,_19,_1a,x,y);
};
CGContextAddLines=function(_1b,_1c,_1d){
CGPathAddLines(_1b.path,_1b.gState.CTM,_1c,_1d);
};
CGContextAddLineToPoint=function(_1e,x,y){
CGPathAddLineToPoint(_1e.path,_1e.gState.CTM,x,y);
};
CGContextAddPath=function(_1f,_20){
if(!_1f||CGPathIsEmpty(_20)){
return;
}
if(!_1f.path){
_1f.path=CGPathCreateMutable();
}
CGPathAddPath(_1f.path,_1f.gState.CTM,_20);
};
CGContextAddQuadCurveToPoint=function(_21,cpx,cpy,x,y){
CGPathAddQuadCurveToPoint(_21.path,_21.gState.CTM,cpx,cpy,x,y);
};
CGContextAddRect=function(_22,_23){
CGPathAddRect(_22.path,_22.gState.CTM,_23);
};
CGContextAddRects=function(_24,_25,_26){
CGPathAddRects(_24.path,_24.gState.CTM,_25,_26);
};
CGContextBeginPath=function(_27){
_27.path=CGPathCreateMutable();
};
CGContextClosePath=function(_28){
CGPathCloseSubpath(_28.path);
};
CGContextMoveToPoint=function(_29,x,y){
if(!_29.path){
_29.path=CGPathCreateMutable();
}
CGPathMoveToPoint(_29.path,_29.gState.CTM,x,y);
};
CGContextFillRect=function(_2a,_2b){
CGContextFillRects(_2a,[_2b],1);
};
CGContextFillRects=function(_2c,_2d,_2e){
if(arguments[2]===undefined){
var _2e=_2d.length;
}
CGContextBeginPath(_2c);
CGContextAddRects(_2c,_2d,_2e);
CGContextClosePath(_2c);
CGContextDrawPath(_2c,kCGPathFill);
};
CGContextStrokeRect=function(_2f,_30){
CGContextBeginPath(_2f);
CGContextAddRect(_2f,_30);
CGContextClosePath(_2f);
CGContextDrawPath(_2f,kCGPathStroke);
};
CGContextStrokeRectWithWidth=function(_31,_32,_33){
CGContextSaveGState(_31);
CGContextSetLineWidth(_31,_33);
CGContextStrokeRect(_31,_32);
CGContextRestoreGState(_31);
};
CGContextConcatCTM=function(_34,_35){
var CTM=_34.gState.CTM;
var tx=CTM.tx*_35.a+CTM.ty*_35.c+_35.tx;
CTM.ty=CTM.tx*_35.b+CTM.ty*_35.d+_35.ty;
CTM.tx=tx;
var a=CTM.a*_35.a+CTM.b*_35.c,b=CTM.a*_35.b+CTM.b*_35.d,c=CTM.c*_35.a+CTM.d*_35.c;
CTM.d=CTM.c*_35.b+CTM.d*_35.d;
CTM.a=a;
CTM.b=b;
CTM.c=c;
};
CGContextGetCTM=function(_36){
return _36.gState.CTM;
};
CGContextRotateCTM=function(_37,_38){
var _39=_37.gState;
_39.CTM=CGAffineTransformRotate(_39.CTM,_38);
};
CGContextScaleCTM=function(_3a,sx,sy){
var _3b=_3a.gState;
_3b.CTM={a:_3b.CTM.a*sx,b:_3b.CTM.b*sx,c:_3b.CTM.c*sy,d:_3b.CTM.d*sy,tx:_3b.CTM.tx,ty:_3b.CTM.ty};
};
CGContextTranslateCTM=function(_3c,tx,ty){
var _3d=_3c.gState;
_3d.CTM={a:_3d.CTM.a,b:_3d.CTM.b,c:_3d.CTM.c,d:_3d.CTM.d,tx:_3d.CTM.tx+_3d.CTM.a*tx+_3d.CTM.c*ty,ty:_3d.CTM.ty+_3d.CTM.b*tx+_3d.CTM.d*ty};
};
CGContextSetShadow=function(_3e,_3f,_40){
var _41=_3e.gState;
_41.shadowOffset={width:_3f.width,height:_3f.height};
_41.shadowBlur=_40;
_41.shadowColor=objj_msgSend(CPColor,"shadowColor");
};
CGContextSetShadowWithColor=function(_42,_43,_44,_45){
var _46=_42.gState;
_46.shadowOffset={width:_43.width,height:_43.height};
_46.shadowBlur=_44;
_46.shadowColor=_45;
};
CGContextSetAlpha=function(_47,_48){
_47.gState.alpha=MAX(MIN(_48,1),0);
};
}
CGContextEOFillPath=function(_49){
CGContextDrawPath(_49,kCGPathEOFill);
};
CGContextFillPath=function(_4a){
CGContextDrawPath(_4a,kCGPathFill);
};
var _4b=4*((SQRT2-1)/3);
CGContextAddEllipseInRect=function(_4c,_4d){
CGContextBeginPath(_4c);
CGContextAddPath(_4c,CGPathWithEllipseInRect(_4d));
CGContextClosePath(_4c);
};
CGContextFillEllipseInRect=function(_4e,_4f){
CGContextBeginPath(_4e);
CGContextAddEllipseInRect(_4e,_4f);
CGContextClosePath(_4e);
CGContextFillPath(_4e);
};
CGContextStrokeEllipseInRect=function(_50,_51){
CGContextBeginPath(_50);
CGContextAddEllipseInRect(_50,_51);
CGContextClosePath(_50);
CGContextStrokePath(_50);
};
CGContextStrokePath=function(_52){
CGContextDrawPath(_52,kCGPathStroke);
};
CGContextStrokeLineSegments=function(_53,_54,_55){
var i=0;
if(arguments["count"]==NULL){
var _55=_54.length;
}
CGContextBeginPath(_53);
for(;i<_55;i+=2){
CGContextMoveToPoint(_53,_54[i].x,_54[i].y);
CGContextAddLineToPoint(_53,_54[i+1].x,_54[i+1].y);
}
CGContextStrokePath(_53);
};
CGContextSetFillColor=function(_56,_57){
if(_57){
_56.gState.fillStyle=objj_msgSend(_57,"cssString");
}
};
CGContextSetStrokeColor=function(_58,_59){
if(_59){
_58.gState.strokeStyle=objj_msgSend(_59,"cssString");
}
};
CGContextFillRoundedRectangleInRect=function(_5a,_5b,_5c,ne,se,sw,nw){
CGContextBeginPath(_5a);
CGContextAddPath(_5a,CGPathWithRoundedRectangleInRect(_5b,_5c,_5c,ne,se,sw,nw));
CGContextClosePath(_5a);
CGContextFillPath(_5a);
};
CGContextStrokeRoundedRectangleInRect=function(_5d,_5e,_5f,ne,se,sw,nw){
CGContextBeginPath(_5d);
CGContextAddPath(_5d,CGPathWithRoundedRectangleInRect(_5e,_5f,_5f,ne,se,sw,nw));
CGContextClosePath(_5d);
CGContextStrokePath(_5d);
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
var _60=["butt","round","square"],_61=["miter","round","bevel"],_62=["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState=function(_63){
_63.save();
};
CGContextRestoreGState=function(_64){
_64.restore();
};
CGContextSetLineCap=function(_65,_66){
_65.lineCap=_60[_66];
};
CGContextSetLineJoin=function(_67,_68){
_67.lineJoin=_61[_68];
};
CGContextSetLineWidth=function(_69,_6a){
_69.lineWidth=_6a;
};
CGContextSetMiterLimit=function(_6b,_6c){
_6b.miterLimit=_6c;
};
CGContextSetBlendMode=function(_6d,_6e){
_6d.globalCompositeOperation=_62[_6e];
};
CGContextAddArc=function(_6f,x,y,_70,_71,_72,_73){
_6f.arc(x,y,_70,_71,_72,!_73);
};
CGContextAddArcToPoint=function(_74,x1,y1,x2,y2,_75){
_74.arcTo(x1,y1,x2,y2,_75);
};
CGContextAddCurveToPoint=function(_76,_77,_78,_79,_7a,x,y){
_76.bezierCurveTo(_77,_78,_79,_7a,x,y);
};
CGContextAddLineToPoint=function(_7b,x,y){
_7b.lineTo(x,y);
};
CGContextAddPath=function(_7c,_7d){
if(!_7c||CGPathIsEmpty(_7d)){
return;
}
var _7e=_7d.elements,i=0,_7f=_7d.count;
for(;i<_7f;++i){
var _80=_7e[i],_81=_80.type;
switch(_81){
case kCGPathElementMoveToPoint:
_7c.moveTo(_80.x,_80.y);
break;
case kCGPathElementAddLineToPoint:
_7c.lineTo(_80.x,_80.y);
break;
case kCGPathElementAddQuadCurveToPoint:
_7c.quadraticCurveTo(_80.cpx,_80.cpy,_80.x,_80.y);
break;
case kCGPathElementAddCurveToPoint:
_7c.bezierCurveTo(_80.cp1x,_80.cp1y,_80.cp2x,_80.cp2y,_80.x,_80.y);
break;
case kCGPathElementCloseSubpath:
_7c.closePath();
break;
case kCGPathElementAddArc:
_7c.arc(_80.x,_80.y,_80.radius,_80.startAngle,_80.endAngle,_80.clockwise);
break;
case kCGPathElementAddArcTo:
break;
}
}
};
CGContextAddRect=function(_82,_83){
_82.rect((_83.origin.x),(_83.origin.y),(_83.size.width),(_83.size.height));
};
CGContextAddRects=function(_84,_85,_86){
var i=0;
if(arguments["count"]==NULL){
var _86=_85.length;
}
for(;i<_86;++i){
var _87=_85[i];
_84.rect((_87.origin.x),(_87.origin.y),(_87.size.width),(_87.size.height));
}
};
CGContextBeginPath=function(_88){
_88.beginPath();
};
CGContextClosePath=function(_89){
_89.closePath();
};
CGContextMoveToPoint=function(_8a,x,y){
_8a.moveTo(x,y);
};
CGContextClearRect=function(_8b,_8c){
_8b.clearRect((_8c.origin.x),(_8c.origin.y),(_8c.size.width),(_8c.size.height));
};
CGContextDrawPath=function(_8d,_8e){
if(_8e==kCGPathFill||_8e==kCGPathFillStroke){
_8d.fill();
}else{
if(_8e==kCGPathEOFill||_8e==kCGPathEOFillStroke){
alert("not implemented!!!");
}
}
if(_8e==kCGPathStroke||_8e==kCGPathFillStroke||_8e==kCGPathEOFillStroke){
_8d.stroke();
}
};
CGContextFillRect=function(_8f,_90){
_8f.fillRect((_90.origin.x),(_90.origin.y),(_90.size.width),(_90.size.height));
};
CGContextFillRects=function(_91,_92,_93){
var i=0;
if(arguments["count"]==NULL){
var _93=_92.length;
}
for(;i<_93;++i){
var _94=_92[i];
_91.fillRect((_94.origin.x),(_94.origin.y),(_94.size.width),(_94.size.height));
}
};
CGContextStrokeRect=function(_95,_96){
_95.strokeRect((_96.origin.x),(_96.origin.y),(_96.size.width),(_96.size.height));
};
CGContextClip=function(_97){
_97.clip();
};
CGContextClipToRect=function(_98,_99){
_98.beginPath();
_98.rect((_99.origin.x),(_99.origin.y),(_99.size.width),(_99.size.height));
_98.closePath();
_98.clip();
};
CGContextClipToRects=function(_9a,_9b,_9c){
if(arguments["count"]==NULL){
var _9c=_9b.length;
}
_9a.beginPath();
CGContextAddRects(_9a,_9b,_9c);
_9a.clip();
};
CGContextSetAlpha=function(_9d,_9e){
_9d.globalAlpha=_9e;
};
CGContextSetFillColor=function(_9f,_a0){
_9f.fillStyle=objj_msgSend(_a0,"cssString");
};
CGContextSetStrokeColor=function(_a1,_a2){
_a1.strokeStyle=objj_msgSend(_a2,"cssString");
};
CGContextSetShadow=function(_a3,_a4,_a5){
_a3.shadowOffsetX=_a4.width;
_a3.shadowOffsetY=_a4.height;
_a3.shadowBlur=_a5;
};
CGContextSetShadowWithColor=function(_a6,_a7,_a8,_a9){
_a6.shadowOffsetX=_a7.width;
_a6.shadowOffsetY=_a7.height;
_a6.shadowBlur=_a8;
_a6.shadowColor=objj_msgSend(_a9,"cssString");
};
CGContextRotateCTM=function(_aa,_ab){
_aa.rotate(_ab);
};
CGContextScaleCTM=function(_ac,sx,sy){
_ac.scale(sx,sy);
};
CGContextTranslateCTM=function(_ad,tx,ty){
_ad.translate(tx,ty);
};
eigen=function(_ae){
alert("IMPLEMENT ME!");
};
if(CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature)){
CGContextConcatCTM=function(_af,_b0){
_af.transform(_b0.a,_b0.b,_b0.c,_b0.d,_b0.tx,_b0.ty);
};
}else{
CGContextConcatCTM=function(_b1,_b2){
var a=_b2.a,b=_b2.b,c=_b2.c,d=_b2.d,tx=_b2.tx,ty=_b2.ty,sx=1,sy=1,a1=0,a2=0;
if(b==0&&c==0){
sx=a;
sy=d;
}else{
if(a*b==-c*d){
var _b3=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_b3*c,_b3*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
}else{
if(a*c==-b*d){
var _b3=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_b3*b,_b3*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
}else{
var _b4=CGAffineTransformMake(a,c,b,d,0,0),u=eigen(CGAffineTransformConcat(_b2,_b4)),v=eigen(CGAffineTransformConcat(_b4,_b2)),U=CGAffineTransformMake(u.vector_1.x,u.vector_2.x,u.vector_1.y,u.vector_2.y,0,0),VT=CGAffineTransformMake(v.vector_1.x,v.vector_1.y,v.vector_2.x,v.vector_2.y,0,0),S=CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U),_b2),CGAffineTransformInvert(VT));
a=VT.a;
b=VT.b;
c=VT.c;
d=VT.d;
var _b3=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_b3*c,_b3*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
S.a*=sx;
S.d*=sy;
a=U.a;
b=U.b;
c=U.c;
d=U.d;
var _b3=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_b3*b,_b3*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
sx=S.a*sx;
sy=S.d*sy;
}
}
}
if(tx!=0||ty!=0){
CGContextTranslateCTM(_b1,tx,ty);
}
if(a1!=0){
CGContextRotateCTM(_b1,a1);
}
if(sx!=1||sy!=1){
CGContextScaleCTM(_b1,sx,sy);
}
if(a2!=0){
CGContextRotateCTM(_b1,a2);
}
};
}
CGContextDrawImage=function(_b5,_b6,_b7){
_b5.drawImage(_b7._image,(_b6.origin.x),(_b6.origin.y),(_b6.size.width),(_b6.size.height));
};
to_string=function(_b8){
return "rgba("+ROUND(_b8.components[0]*255)+", "+ROUND(_b8.components[1]*255)+", "+ROUND(255*_b8.components[2])+", "+_b8.components[3]+")";
};
CGContextDrawLinearGradient=function(_b9,_ba,_bb,_bc,_bd){
var _be=_ba.colors,_bf=_be.length,_c0=_b9.createLinearGradient(_bb.x,_bb.y,_bc.x,_bc.y);
while(_bf--){
_c0.addColorStop(_ba.locations[_bf],to_string(_be[_bf]));
}
_b9.fillStyle=_c0;
_b9.fill();
};
CGBitmapGraphicsContextCreate=function(){
var _c1=document.createElement("canvas"),_c2=_c1.getContext("2d");
_c2.DOMElement=_c1;
return _c2;
};
}else{
if(CPFeatureIsCompatible(CPVMLFeature)){
var _c3=["f","t"],_c4=["flat","round","square"],_c5=["miter","round","bevel"],_c6=[" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _c7=CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate=function(){
document.namespaces.add("cg_vml_","urn:schemas-microsoft-com:vml");
document.createStyleSheet().cssText="cg_vml_\\:*{behavior:url(#default#VML)}";
CGBitmapGraphicsContextCreate=_c7;
return _c7();
};
CGContextClearRect=function(_c8,_c9){
if(_c8.buffer!=nil){
_c8.buffer="";
}else{
_c8.DOMElement.innerHTML="";
}
_c8.path=NULL;
};
var W=10,H=10,Z=10,Z_2=Z/2;
CGContextDrawImage=function(_ca,_cb,_cc){
var _cd="";
if(_cc.buffer!=nil){
_cd=_cc.buffer;
}else{
var ctm=_ca.gState.CTM,_ce=CGPointApplyAffineTransform(_cb.origin,ctm),_cf=ctm.a==ctm.d&&ctm.b==-ctm.c,vml=["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
var _d0=CGRectApplyAffineTransform(_cb,ctm);
vml.push(";padding:0 ",ROUND((_d0.origin.x+_d0.size.width)),"px ",ROUND((_d0.origin.y+_d0.size.height)),"px 0;filter:progid:DXImageTransform.Microsoft.Matrix(","M11='",ctm.a,"',M12='",ctm.c,"',M21='",ctm.b,"',M22='",ctm.d,"',","Dx='",ROUND(_ce.x),"', Dy='",ROUND(_ce.y),"', sizingmethod='clip');");
vml.push("\"><cg_vml_:image src=\"",_cc._image.src,"\" style=\"width:",(_cb.size.width),"px;height:",(_cb.size.height),"px;\"/></g_vml_:group>");
_cd=vml.join("");
}
if(_ca.buffer!=nil){
_ca.buffer+=_cd;
}else{
_ca.DOMElement.insertAdjacentHTML("BeforeEnd",_cd);
}
};
CGContextDrawPath=function(_d1,_d2){
if(!_d1||CGPathIsEmpty(_d1.path)){
return;
}
var _d3=_d1.path.elements,i=0,_d4=_d1.path.count,_d5=_d1.gState,_d6=(_d2==kCGPathFill||_d2==kCGPathFillStroke)?1:0,_d7=(_d2==kCGPathStroke||_d2==kCGPathFillStroke)?1:0,_d8=_d5.alpha,vml=["<cg_vml_:shape"," fillcolor=\"",_d5.fillStyle,"\" filled=\"",_c3[_d6],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",_c3[_d7],"\" strokeweight=\"",_d5.lineWidth,"\" strokecolor=\"",_d5.strokeStyle,"\" path=\""];
for(;i<_d4;++i){
var _d9=_d3[i],_da=_d9.type;
switch(_da){
case kCGPathElementMoveToPoint:
case kCGPathElementAddLineToPoint:
vml.push(_c6[_da],(ROUND(Z*(_d9.x)-Z_2)),",",(ROUND(Z*(_d9.y)-Z_2)));
break;
case kCGPathElementAddQuadCurveToPoint:
vml.push(_c6[_da],(ROUND(Z*(_d9.cpx)-Z_2)),",",(ROUND(Z*(_d9.cpy)-Z_2)),",",(ROUND(Z*(_d9.x)-Z_2)),",",(ROUND(Z*(_d9.y)-Z_2)));
break;
case kCGPathElementAddCurveToPoint:
vml.push(_c6[_da],(ROUND(Z*(_d9.cp1x)-Z_2)),",",(ROUND(Z*(_d9.cp1y)-Z_2)),",",(ROUND(Z*(_d9.cp2x)-Z_2)),",",(ROUND(Z*(_d9.cp2y)-Z_2)),",",(ROUND(Z*(_d9.x)-Z_2)),",",(ROUND(Z*(_d9.y)-Z_2)));
break;
case kCGPathElementCloseSubpath:
vml.push(_c6[_da]);
break;
case kCGPathElementAddArc:
var x=_d9.x,y=_d9.y,_db=_d9.radius,_dc=_d9.clockwise?1:0,_dd=_d9.endAngle,_de=_d9.startAngle,_df={x:x+_db*COS(_de),y:y+_db*SIN(_de)};
if(_de==_dd&&!_dc){
vml.push(_c6[kCGPathElementMoveToPoint],(ROUND(Z*(_df.x)-Z_2)),",",(ROUND(Z*(_df.y)-Z_2)));
continue;
}
var end={x:x+_db*COS(_dd),y:y+_db*SIN(_dd)};
if(_dc&&_de!=_dd&&(_df.x==end.x&&_df.y==end.y)){
if(_df.x>=x){
if(_df.y<y){
_df.x+=0.125;
}else{
_df.y+=0.125;
}
}else{
if(end.y<=y){
end.x+=0.125;
}else{
end.y+=0.125;
}
}
}
vml.push(_c6[_da][_dc],(ROUND(Z*(x-_db)-Z_2)),",",(ROUND(Z*(y-_db)-Z_2))," ",(ROUND(Z*(x+_db)-Z_2)),",",(ROUND(Z*(y+_db)-Z_2))," ",(ROUND(Z*(_df.x)-Z_2)),",",(ROUND(Z*(_df.y)-Z_2))," ",(ROUND(Z*(end.x)-Z_2)),",",(ROUND(Z*(end.y)-Z_2)));
break;
case kCGPathElementAddArcTo:
break;
}
}
vml.push("\">");
if(_d5.gradient){
vml.push(_d5.gradient);
}else{
if(_d6){
vml.push("<cg_vml_:fill color=\"",_d5.fillStyle,"\" opacity=\"",_d8,"\" />");
}
}
if(_d7){
vml.push("<cg_vml_:stroke opacity=\"",_d8,"\" joinstyle=\"",_c5[_d5.lineJoin],"\" miterlimit=\"",_d5.miterLimit,"\" endcap=\"",_c4[_d5.lineCap],"\" weight=\"",_d5.lineWidth,"","px\" color=\"",_d5.strokeStyle,"\" />");
}
var _e0=_d5.shadowColor;
if(_e0){
var _e1=_d5.shadowOffset;
vml.push("<cg_vml_:shadow on=\"t\" offset=\"",_e1.width,"pt ",_e1.height,"pt\" opacity=\"",objj_msgSend(_e0,"alphaComponent"),"\" color=black />");
}
vml.push("</cg_vml_:shape>");
_d1.path=NULL;
if(_d1.buffer!=nil){
_d1.buffer+=vml.join("");
}else{
_d1.DOMElement.insertAdjacentHTML("BeforeEnd",vml.join(""));
}
};
to_string=function(_e2){
return "rgb("+ROUND(_e2.components[0]*255)+", "+ROUND(_e2.components[1]*255)+", "+ROUND(255*_e2.components[2])+")";
};
CGContextDrawLinearGradient=function(_e3,_e4,_e5,_e6,_e7){
if(!_e3||!_e4){
return;
}
var vml=nil;
if(_e4.vml_gradient){
var _e8=objj_msgSend(objj_msgSend(_e4.vml_gradient,"stops"),"sortedArrayUsingSelector:",sel_getUid("comparePosition:")),_e9=objj_msgSend(_e8,"count");
vml=["<cg_vml_:fill type=\"gradient\" method=\"linear sigma\" "];
vml.push("angle=\""+(objj_msgSend(_e4.vml_gradient,"angle")+90)+"\" ");
vml.push("colors=\"");
for(var i=0;i<_e9;i++){
vml.push((objj_msgSend(_e8[i],"position")*100).toFixed(0)+"% ");
vml.push(objj_msgSend(objj_msgSend(objj_msgSend(_e8[i],"color"),"colorForSlideBase:",nil),"cssString"));
if(i<_e9-1){
vml.push(",");
}
}
vml.push("\" />");
}else{
var _ea=_e4.colors,_e9=_ea.length;
vml=["<cg_vml_:fill type=\"gradient\" "];
vml.push("colors=\"");
for(var i=0;i<_e9;i++){
vml.push((_e4.locations[i]*100).toFixed(0)+"% "+to_string(_ea[i])+(i<_e9-1?",":""));
}
vml.push("\" />");
}
_e3.gState.gradient=vml.join("");
console.log(vml.join(""));
};
}
}
p;12;CGGeometry.jc;5872;
CGPointMake=function(x,y){
return {x:x,y:y};
};
CGPointMakeZero=function(){
return {x:0,y:0};
};
CGPointMakeCopy=function(_1){
return {x:_1.x,y:_1.y};
};
CGPointCreateCopy=function(_2){
return {x:_2.x,y:_2.y};
};
CGPointEqualToPoint=function(_3,_4){
return (_3.x==_4.x&&_3.y==_4.y);
};
CGStringFromPoint=function(_5){
return ("{"+_5.x+", "+_5.y+"}");
};
CGSizeMake=function(_6,_7){
return {width:_6,height:_7};
};
CGSizeMakeZero=function(){
return {width:0,height:0};
};
CGSizeMakeCopy=function(_8){
return {width:_8.width,height:_8.height};
};
CGSizeCreateCopy=function(_9){
return {width:_9.width,height:_9.height};
};
CGSizeEqualToSize=function(_a,_b){
return (_a.width==_b.width&&_a.height==_b.height);
};
CGStringFromSize=function(_c){
return ("{"+_c.width+", "+_c.height+"}");
};
CGRectMake=function(x,y,_d,_e){
return {origin:{x:x,y:y},size:{width:_d,height:_e}};
};
CGRectMakeZero=function(){
return {origin:{x:0,y:0},size:{width:0,height:0}};
};
CGRectMakeCopy=function(_f){
return {origin:{x:_f.origin.x,y:_f.origin.y},size:{width:_f.size.width,height:_f.size.height}};
};
CGRectCreateCopy=function(_10){
return {origin:{x:_10.origin.x,y:_10.origin.y},size:{width:_10.size.width,height:_10.size.height}};
};
CGRectEqualToRect=function(_11,_12){
return ((_11.origin.x==_12.origin.x&&_11.origin.y==_12.origin.y)&&(_11.size.width==_12.size.width&&_11.size.height==_12.size.height));
};
CGStringFromRect=function(_13){
return ("{"+("{"+_13.origin.x+", "+_13.origin.y+"}")+", "+("{"+_13.size.width+", "+_13.size.height+"}")+"}");
};
CGRectOffset=function(_14,dX,dY){
return {origin:{x:_14.origin.x+dX,y:_14.origin.y+dY},size:{width:_14.size.width,height:_14.size.height}};
};
CGRectInset=function(_15,dX,dY){
return {origin:{x:_15.origin.x+dX,y:_15.origin.y+dY},size:{width:_15.size.width-2*dX,height:_15.size.height-2*dY}};
};
CGRectGetHeight=function(_16){
return (_16.size.height);
};
CGRectGetMaxX=function(_17){
return (_17.origin.x+_17.size.width);
};
CGRectGetMaxY=function(_18){
return (_18.origin.y+_18.size.height);
};
CGRectGetMidX=function(_19){
return (_19.origin.x+(_19.size.width)/2);
};
CGRectGetMidY=function(_1a){
return (_1a.origin.y+(_1a.size.height)/2);
};
CGRectGetMinX=function(_1b){
return (_1b.origin.x);
};
CGRectGetMinY=function(_1c){
return (_1c.origin.y);
};
CGRectGetWidth=function(_1d){
return (_1d.size.width);
};
CGRectIsEmpty=function(_1e){
return (_1e.size.width<=0||_1e.size.height<=0);
};
CGRectIsNull=function(_1f){
return (_1f.size.width<=0||_1f.size.height<=0);
};
CGRectContainsPoint=function(_20,_21){
return (_21.x>=(_20.origin.x)&&_21.y>=(_20.origin.y)&&_21.x<(_20.origin.x+_20.size.width)&&_21.y<(_20.origin.y+_20.size.height));
};
CGInsetMake=function(top,_22,_23,_24){
return {top:(top),right:(_22),bottom:(_23),left:(_24)};
};
CGInsetMakeZero=function(){
return {top:(0),right:(0),bottom:(0),left:(0)};
};
CGInsetMakeCopy=function(_25){
return {top:(_25.top),right:(_25.right),bottom:(_25.bottom),left:(_25.left)};
};
CGInsetIsEmpty=function(_26){
return ((_26).top===0&&(_26).right===0&&(_26).bottom===0&&(_26).left===0);
};
CGRectNull={origin:{x:Infinity,y:Infinity},size:{width:0,height:0}};
CGRectContainsRect=function(_27,_28){
var _29=CGRectUnion(_27,_28);
return ((_29.origin.x==_27.origin.x&&_29.origin.y==_27.origin.y)&&(_29.size.width==_27.size.width&&_29.size.height==_27.size.height));
};
CGRectIntersectsRect=function(_2a,_2b){
var _2c=CGRectIntersection(_2a,_2b);
return !(_2c.size.width<=0||_2c.size.height<=0);
};
CGRectIntegral=function(_2d){
_2d=CGRectStandardize(_2d);
var x=FLOOR((_2d.origin.x)),y=FLOOR((_2d.origin.y));
_2d.size.width=CEIL((_2d.origin.x+_2d.size.width))-x;
_2d.size.height=CEIL((_2d.origin.y+_2d.size.height))-y;
_2d.origin.x=x;
_2d.origin.y=y;
return _2d;
};
CGRectIntersection=function(_2e,_2f){
var _30={origin:{x:MAX((_2e.origin.x),(_2f.origin.x)),y:MAX((_2e.origin.y),(_2f.origin.y))},size:{width:0,height:0}};
_30.size.width=MIN((_2e.origin.x+_2e.size.width),(_2f.origin.x+_2f.size.width))-(_30.origin.x);
_30.size.height=MIN((_2e.origin.y+_2e.size.height),(_2f.origin.y+_2f.size.height))-(_30.origin.y);
return (_30.size.width<=0||_30.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_30;
};
CGRectStandardize=function(_31){
var _32=(_31.size.width),_33=(_31.size.height),_34={origin:{x:_31.origin.x,y:_31.origin.y},size:{width:_31.size.width,height:_31.size.height}};
if(_32<0){
_34.origin.x+=_32;
_34.size.width=-_32;
}
if(_33<0){
_34.origin.y+=_33;
_34.size.height=-_33;
}
return _34;
};
CGRectUnion=function(_35,_36){
var _37=!_35||_35===CGRectNull,_38=!_36||_36===CGRectNull;
if(_37){
return _38?CGRectNull:_36;
}
if(_38){
return _37?CGRectNull:_35;
}
var _39=MIN((_35.origin.x),(_36.origin.x)),_3a=MIN((_35.origin.y),(_36.origin.y)),_3b=MAX((_35.origin.x+_35.size.width),(_36.origin.x+_36.size.width)),_3c=MAX((_35.origin.y+_35.size.height),(_36.origin.y+_36.size.height));
return {origin:{x:_39,y:_3a},size:{width:_3b-_39,height:_3c-_3a}};
};
CGPointFromString=function(_3d){
var _3e=_3d.indexOf(",");
return {x:parseInt(_3d.substr(1,_3e-1)),y:parseInt(_3d.substring(_3e+1,_3d.length))};
};
CGSizeFromString=function(_3f){
var _40=_3f.indexOf(",");
return {width:parseInt(_3f.substr(1,_40-1)),height:parseInt(_3f.substring(_40+1,_3f.length))};
};
CGRectFromString=function(_41){
var _42=_41.indexOf(",",_41.indexOf(",")+1);
return {origin:CGPointFromString(_41.substr(1,_42-1)),size:CGSizeFromString(_41.substring(_42+2,_41.length))};
};
CGPointFromEvent=function(_43){
return {x:_43.clientX,y:_43.clientY};
};
CGInsetFromString=function(_44){
var _45=_44.substr(1,_44.length-2).split(",");
return {top:(parseFloat(_45[0])),right:(parseFloat(_45[1])),bottom:(parseFloat(_45[2])),left:(parseFloat(_45[3]))};
};
CGInsetFromCPString=CGInsetFromString;
CPStringFromCGInset=function(_46){
return "{"+_46.top+", "+_46.left+", "+_46.bottom+", "+_46.right+"}";
};
p;12;CGGradient.ji;9;CGColor.ji;14;CGColorSpace.jc;497;
kCGGradientDrawsBeforeStartLocation=1<<0;
kCGGradientDrawsAfterEndLocation=1<<1;
CGGradientCreateWithColorComponents=function(_1,_2,_3,_4){
if(arguments["count"]==NULL){
var _4=_3.length;
}
var _5=[];
while(_4--){
var _6=_4*4;
_5[_4]=CGColorCreate(_1,_2.slice(_6,_6+4));
}
return CGGradientCreateWithColors(_1,_5,_3);
};
CGGradientCreateWithColors=function(_7,_8,_9){
return {colorspace:_7,colors:_8,locations:_9};
};
CGGradientRelease=function(){
};
CGGradientRetain=function(_a){
return _a;
};
p;8;CGPath.ji;12;CGGeometry.ji;19;CGAffineTransform.jc;7343;
kCGPathElementMoveToPoint=0;
kCGPathElementAddLineToPoint=1;
kCGPathElementAddQuadCurveToPoint=2;
kCGPathElementAddCurveToPoint=3;
kCGPathElementCloseSubpath=4;
kCGPathElementAddArc=5;
kCGPathElementAddArcToPoint=6;
CGPathCreateMutable=function(){
return {count:0,start:NULL,current:NULL,elements:[]};
};
CGPathCreateMutableCopy=function(_1){
var _2=CGPathCreateMutable();
CGPathAddPath(_2,_1);
return _2;
};
CGPathCreateCopy=function(_3){
return CGPathCreateMutableCopy(_3);
};
CGPathRelease=function(_4){
};
CGPathRetain=function(_5){
return _5;
};
CGPathAddArc=function(_6,_7,x,y,_8,_9,_a,_b){
if(_7&&!(_7.a==1&&_7.b==0&&_7.c==0&&_7.d==1&&_7.tx==0&&_7.ty==0)){
var _c={x:x,y:y},_d={x:COS(_a),y:SIN(_a)},_e={x:COS(_9),y:SIN(_9)};
_d={x:_d.x*_7.a+_d.y*_7.c+_7.tx,y:_d.x*_7.b+_d.y*_7.d+_7.ty};
_e={x:_e.x*_7.a+_e.y*_7.c+_7.tx,y:_e.x*_7.b+_e.y*_7.d+_7.ty};
_c={x:_c.x*_7.a+_c.y*_7.c+_7.tx,y:_c.x*_7.b+_c.y*_7.d+_7.ty};
x=_c.x;
y=_c.y;
var _f=_a,_10=_9;
_a=ATAN2(_d.y-_7.ty,_d.x-_7.tx);
_9=ATAN2(_e.y-_7.ty,_e.x-_7.tx);
if(_a==_9&&_f!=_10){
if(_10>_f){
_a=_a-PI2;
}else{
_9=_9-PI2;
}
}
_8={width:_8,height:0};
_8={width:_8.width*_7.a+_8.height*_7.c,height:_8.width*_7.b+_8.height*_7.d};
_8=SQRT(_8.width*_8.width+_8.height*_8.height);
}
_6.current={x:x+_8*COS(_a),y:y+_8*SIN(_a)};
_6.elements[_6.count++]={type:kCGPathElementAddArc,x:x,y:y,radius:_8,startAngle:_9,endAngle:_a};
};
CGPathAddArcToPoint=function(_11,_12,x1,y1,x2,y2,_13){
};
CGPathAddCurveToPoint=function(_14,_15,_16,_17,_18,_19,x,y){
var cp1={x:_16,y:_17},cp2={x:_18,y:_19},end={x:x,y:y};
if(_15){
cp1={x:cp1.x*_15.a+cp1.y*_15.c+_15.tx,y:cp1.x*_15.b+cp1.y*_15.d+_15.ty};
cp2={x:cp2.x*_15.a+cp2.y*_15.c+_15.tx,y:cp2.x*_15.b+cp2.y*_15.d+_15.ty};
end={x:end.x*_15.a+end.y*_15.c+_15.tx,y:end.x*_15.b+end.y*_15.d+_15.ty};
}
_14.current=end;
_14.elements[_14.count++]={type:kCGPathElementAddCurveToPoint,cp1x:cp1.x,cp1y:cp1.y,cp2x:cp2.x,cp2y:cp2.y,x:end.x,y:end.y};
};
CGPathAddLines=function(_1a,_1b,_1c,_1d){
var i=1;
if(arguments["count"]==NULL){
var _1d=_1c.length;
}
if(!_1a||_1d<2){
return;
}
CGPathMoveToPoint(_1a,_1b,_1c[0].x,_1c[0].y);
for(;i<_1d;++i){
CGPathAddLineToPoint(_1a,_1b,_1c[i].x,_1c[i].y);
}
};
CGPathAddLineToPoint=function(_1e,_1f,x,y){
var _20={x:x,y:y};
if(_1f!=NULL){
_20={x:_20.x*_1f.a+_20.y*_1f.c+_1f.tx,y:_20.x*_1f.b+_20.y*_1f.d+_1f.ty};
}
_1e.elements[_1e.count++]={type:kCGPathElementAddLineToPoint,x:_20.x,y:_20.y};
_1e.current=_20;
};
CGPathAddPath=function(_21,_22,_23){
for(var i=0,_24=_23.count;i<_24;++i){
var _25=_23.elements[i];
switch(_25.type){
case kCGPathElementAddLineToPoint:
CGPathAddLineToPoint(_21,_22,_25.x,_25.y);
break;
case kCGPathElementAddCurveToPoint:
CGPathAddCurveToPoint(_21,_22,_25.cp1x,_25.cp1y,_25.cp2x,_25.cp2y,_25.x,_25.y);
break;
case kCGPathElementAddArc:
CGPathAddArc(_21,_22,_25.x,_25.y,_25.radius,_25.startAngle,_25.endAngle,_25.isClockwise);
break;
case kCGPathElementAddQuadCurveToPoint:
CGPathAddQuadCurveToPoint(_21,_22,_25.cpx,_25.cpy,_25.x,_25.y);
break;
case kCGPathElementMoveToPoint:
CGPathMoveToPoint(_21,_22,_25.x,_25.y);
break;
case kCGPathElementCloseSubpath:
CGPathCloseSubpath(_21);
break;
}
}
};
CGPathAddQuadCurveToPoint=function(_26,_27,cpx,cpy,x,y){
var cp={x:cpx,y:cpy},end={x:x,y:y};
if(_27){
cp={x:control.x*_27.a+control.y*_27.c+_27.tx,y:control.x*_27.b+control.y*_27.d+_27.ty};
end={x:end.x*_27.a+end.y*_27.c+_27.tx,y:end.x*_27.b+end.y*_27.d+_27.ty};
}
_26.elements[_26.count++]={type:kCGPathElementAddQuadCurveToPoint,cpx:cp.x,cpy:cp.y,x:end.x,y:end.y};
_26.current=end;
};
CGPathAddRect=function(_28,_29,_2a){
CGPathAddRects(_28,_29,[_2a],1);
};
CGPathAddRects=function(_2b,_2c,_2d,_2e){
var i=0;
if(arguments["count"]==NULL){
var _2e=_2d.length;
}
for(;i<_2e;++i){
var _2f=_2d[i];
CGPathMoveToPoint(_2b,_2c,(_2f.origin.x),(_2f.origin.y));
CGPathAddLineToPoint(_2b,_2c,(_2f.origin.x+_2f.size.width),(_2f.origin.y));
CGPathAddLineToPoint(_2b,_2c,(_2f.origin.x+_2f.size.width),(_2f.origin.y+_2f.size.height));
CGPathAddLineToPoint(_2b,_2c,(_2f.origin.x),(_2f.origin.y+_2f.size.height));
CGPathCloseSubpath(_2b);
}
};
CGPathMoveToPoint=function(_30,_31,x,y){
var _32={x:x,y:y},_33=_30.count;
if(_31!=NULL){
_32={x:_32.x*_31.a+_32.y*_31.c+_31.tx,y:_32.x*_31.b+_32.y*_31.d+_31.ty};
}
_30.start=_32;
_30.current=_32;
var _34=_30.elements[_33-1];
if(_33!=0&&_34.type==kCGPathElementMoveToPoint){
_34.x=_32.x;
_34.y=_32.y;
}else{
_30.elements[_30.count++]={type:kCGPathElementMoveToPoint,x:_32.x,y:_32.y};
}
};
var _35=4*((SQRT2-1)/3);
CGPathWithEllipseInRect=function(_36){
var _37=CGPathCreateMutable();
if((_36.size.width)==(_36.size.height)){
CGPathAddArc(_37,nil,(_36.origin.x+(_36.size.width)/2),(_36.origin.y+(_36.size.height)/2),(_36.size.width)/2,0,2*PI,YES);
}else{
var _38={width:(_36.size.width)/2,height:(_36.size.height)/2},_39={x:(_36.origin.x)+_38.width,y:(_36.origin.y)+_38.height};
CGPathMoveToPoint(_37,nil,_39.x,_39.y-_38.height);
CGPathAddCurveToPoint(_37,nil,_39.x+(_35*_38.width),_39.y-_38.height,_39.x+_38.width,_39.y-(_35*_38.height),_39.x+_38.width,_39.y);
CGPathAddCurveToPoint(_37,nil,_39.x+_38.width,_39.y+(_35*_38.height),_39.x+(_35*_38.width),_39.y+_38.height,_39.x,_39.y+_38.height);
CGPathAddCurveToPoint(_37,nil,_39.x-(_35*_38.width),_39.y+_38.height,_39.x-_38.width,_39.y+(_35*_38.height),_39.x-_38.width,_39.y);
CGPathAddCurveToPoint(_37,nil,_39.x-_38.width,_39.y-(_35*_38.height),_39.x-(_35*_38.width),_39.y-_38.height,_39.x,_39.y-_38.height);
}
CGPathCloseSubpath(_37);
return _37;
};
CGPathWithRoundedRectangleInRect=function(_3a,_3b,_3c,ne,se,sw,nw){
var _3d=CGPathCreateMutable(),_3e=(_3a.origin.x),_3f=(_3a.origin.x+_3a.size.width),_40=(_3a.origin.y),_41=(_3a.origin.y+_3a.size.height);
CGPathMoveToPoint(_3d,nil,_3e+_3b,_40);
if(ne){
CGPathAddLineToPoint(_3d,nil,_3f-_3b,_40);
CGPathAddCurveToPoint(_3d,nil,_3f-_3b,_40,_3f,_40,_3f,_40+_3b);
}else{
CGPathAddLineToPoint(_3d,nil,_3f,_40);
}
if(se){
CGPathAddLineToPoint(_3d,nil,_3f,_41-_3b);
CGPathAddCurveToPoint(_3d,nil,_3f,_41-_3b,_3f,_41,_3f-_3b,_41);
}else{
CGPathAddLineToPoint(_3d,nil,_3f,_41);
}
if(sw){
CGPathAddLineToPoint(_3d,nil,_3e+_3b,_41);
CGPathAddCurveToPoint(_3d,nil,_3e+_3b,_41,_3e,_41,_3e,_41-_3b);
}else{
CGPathAddLineToPoint(_3d,nil,_3e,_41);
}
if(nw){
CGPathAddLineToPoint(_3d,nil,_3e,_40+_3b);
CGPathAddCurveToPoint(_3d,nil,_3e,_40+_3b,_3e,_40,_3e+_3b,_40);
}else{
CGPathAddLineToPoint(_3d,nil,_3e,_40);
}
CGPathCloseSubpath(_3d);
return _3d;
};
CGPathCloseSubpath=function(_42){
var _43=_42.count;
if(_43==0||_42.elements[_43-1].type==kCGPathElementCloseSubpath){
return;
}
_42.elements[_42.count++]={type:kCGPathElementCloseSubpath,points:[_42.start]};
};
CGPathEqualToPath=function(_44,_45){
if(_44==_45){
return YES;
}
if(_44.count!=_45.count||!(_44.start.x==_45.start.x&&_44.start.y==_45.start.y)||!(_44.current.x==_45.current.x&&_44.current.y==_45.current.y)){
return NO;
}
var i=0,_46=_44.count;
for(;i<_46;++i){
var _47=_44[i],_48=_45[i];
if(_47.type!=_48.type){
return NO;
}
if((_47.type==kCGPathElementAddArc||_47.type==kCGPathElementAddArcToPoint)&&_47.radius!=_48.radius){
return NO;
}
var j=_47.points.length;
while(j--){
if(!(_47.points[j].x==_48.points[j].x&&_47.points[j].y==_48.points[j].y)){
return NO;
}
}
}
return YES;
};
CGPathGetCurrentPoint=function(_49){
return {x:_49.current.x,y:_49.current.y};
};
CGPathIsEmpty=function(_4a){
return !_4a||_4a.count==0;
};
p;31;_CPBorderlessBridgeWindowView.ji;15;_CPWindowView.jc;1901;
var _1=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPBorderlessBridgeWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_toolbarBackgroundView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("tile"),function(_4,_5){
with(_4){
objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPWindowView")},"tile");
var _6=objj_msgSend(_4,"window"),_7=objj_msgSend(_4,"bounds");
objj_msgSend(objj_msgSend(_6,"contentView"),"setFrame:",CGRectMake(0,objj_msgSend(_4,"toolbarMaxY"),CGRectGetWidth(_7),CGRectGetHeight(_7)-objj_msgSend(_4,"toolbarMaxY")));
if(!objj_msgSend(objj_msgSend(_6,"toolbar"),"isVisible")){
objj_msgSend(_toolbarBackgroundView,"removeFromSuperview");
_toolbarBackgroundView=nil;
return;
}
if(!_toolbarBackgroundView){
_toolbarBackgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_toolbarBackgroundView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_4,"class"),"toolbarBackgroundColor"));
objj_msgSend(_toolbarBackgroundView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_4,"addSubview:positioned:relativeTo:",_toolbarBackgroundView,CPWindowBelow,nil);
}
var _8=CGRectMakeZero();
_8.origin=CGPointMakeCopy(objj_msgSend(_4,"toolbarOffset"));
_8.size=objj_msgSend(_toolbarView,"frame").size;
objj_msgSend(_toolbarBackgroundView,"setFrame:",_8);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("toolbarBackgroundColor"),function(_9,_a){
with(_9){
if(!_1){
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPBorderlessBridgeWindowView,"class")),"pathForResource:","_CPToolbarView/_CPToolbarViewBackground.png"),CGSizeMake(1,59)));
}
return _1;
}
})]);
p;25;_CPBorderlessWindowView.ji;15;_CPWindowView.jc;188;
var _1=objj_allocateClassPair(_CPWindowView,"_CPBorderlessWindowView"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;23;_CPDocModalWindowView.ji;15;_CPWindowView.jc;1336;
var _1=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPDocModalWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_bodyView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_6,_7);
if(_4){
var _8=objj_msgSend(_4,"class"),_9=objj_msgSend(_4,"bounds");
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_9),CGRectGetHeight(_9)));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_8,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_4,"addSubview:",_bodyView);
}
return _4;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_a,_b,_c){
with(_a){
return _c;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_d,_e,_f){
with(_d){
return _f;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_10,_11){
with(_10){
if(!_1){
_1=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,0.9);
}
return _1;
}
})]);
p;18;_CPHUDWindowView.jc;6989;
var _1=nil,_2=nil;
var _3=26;
var _4=objj_allocateClassPair(_CPWindowView,"_CPHUDWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(objj_msgSend(_6,"class"),"contentRectForFrameRect:",_8);
if(objj_msgSend(objj_msgSend(objj_msgSend(_6,"window"),"toolbar"),"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_6,"toolbarView"),"frame"));
_9.origin.y+=toolbarHeight;
_9.size.height-=toolbarHeight;
}
return _9;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(objj_msgSend(_a,"class"),"frameRectForContentRect:",_c);
if(objj_msgSend(objj_msgSend(objj_msgSend(_a,"window"),"toolbar"),"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_a,"toolbarView"),"frame"));
_d.origin.y-=toolbarHeight;
_d.size.height+=toolbarHeight;
}
return _d;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_10,_11);
if(_e){
var _12=objj_msgSend(_e,"bounds");
objj_msgSend(_e,"setBackgroundColor:",_1);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setHitTests:",NO);
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_titleField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,CGRectGetWidth(objj_msgSend(_e,"bounds"))-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(_e,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
var _13=objj_msgSend(_CPHUDWindowViewCloseImage,"size");
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(4,4,_13.width,_13.height));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_CPHUDWindowViewCloseImage);
objj_msgSend(_closeButton,"setAlternateImage:",_CPHUDWindowViewCloseActiveImage);
objj_msgSend(_e,"addSubview:",_closeButton);
}
objj_msgSend(_e,"setResizeIndicatorOffset:",CGSizeMake(5,5));
}
return _e;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_14,_15){
with(_14){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_14,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
}
}),new objj_method(sel_getUid("setTitle:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_titleField,"setStringValue:",_18);
}
}),new objj_method(sel_getUid("toolbarView"),function(_19,_1a){
with(_19){
return _toolbarView;
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPColor,"whiteColor");
}
}),new objj_method(sel_getUid("toolbarLabelShadowColor"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_1f,_20){
with(_1f){
return CGSizeMake(0,_3);
}
}),new objj_method(sel_getUid("tile"),function(_21,_22){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("_CPWindowView")},"tile");
var _23=objj_msgSend(_21,"window"),_24=objj_msgSend(_21,"bounds"),_25=CGRectGetWidth(_24);
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,_25-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
var _26=objj_msgSend(_21,"toolbarMaxY");
objj_msgSend(objj_msgSend(_23,"contentView"),"setFrameOrigin:",CGPointMake(0,_26,_25,CGRectGetHeight(_24)-_26));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_27,_28){
with(_27){
if(_27!=objj_msgSend(_CPHUDWindowView,"class")){
return;
}
var _29=objj_msgSend(CPBundle,"bundleForClass:",_27);
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground0.png"),CPSizeMake(6,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground1.png"),CPSizeMake(1,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground2.png"),CPSizeMake(6,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground3.png"),CPSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground4.png"),CPSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground5.png"),CPSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground6.png"),CPSizeMake(6,6)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground7.png"),CPSizeMake(6,6)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground8.png"),CPSizeMake(6,6))]));
_CPHUDWindowViewCloseImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","HUDTheme/WindowClose.png"),CPSizeMake(20,20));
_CPHUDWindowViewCloseActiveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","HUDTheme/WindowCloseActive.png"),CPSizeMake(20,20));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=CGRectMakeCopy(_2c),_2e=_3;
_2d.origin.y+=_2e;
_2d.size.height-=_2e;
return _2d;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2f,_30,_31){
with(_2f){
var _32=CGRectMakeCopy(_31),_33=_3;
_32.origin.y-=_33;
_32.size.height+=_33;
return _32;
}
})]);
p;23;_CPStandardWindowView.ji;15;_CPWindowView.jc;11844;
var _1=41;
var _2=nil,_3=nil;
var _4=objj_allocateClassPair(CPView,"_CPTexturedWindowHeadView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_gradientView"),new objj_ivar("_solidView"),new objj_ivar("_dividerView")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPView")},"initWithFrame:",_8);
if(_6){
var _9=objj_msgSend(_6,"class"),_a=objj_msgSend(_6,"bounds");
_gradientView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_a),_1));
objj_msgSend(_gradientView,"setBackgroundColor:",objj_msgSend(_9,"gradientColor"));
objj_msgSend(_6,"addSubview:",_gradientView);
_solidView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1,CGRectGetWidth(_a),CGRectGetHeight(_a)-_1));
objj_msgSend(_solidView,"setBackgroundColor:",objj_msgSend(_9,"solidColor"));
objj_msgSend(_6,"addSubview:",_solidView);
}
return _6;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_b,"bounds");
objj_msgSend(_gradientView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),_1));
objj_msgSend(_solidView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),CGRectGetHeight(_e)-_1));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("gradientColor"),function(_f,_10){
with(_f){
if(!_2){
var _11=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPWindowView,"class"));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop0.png"),CGSizeMake(6,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop1.png"),CGSizeMake(1,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop2.png"),CGSizeMake(6,41))],NO));
}
return _2;
}
}),new objj_method(sel_getUid("solidColor"),function(_12,_13){
with(_12){
if(!_3){
_3=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",195/255,195/255,195/255,1);
}
return _3;
}
})]);
var _14=nil,_15=nil,_16=nil,_17=nil,_18=nil,_19=nil,_1a=nil,_1b=nil,_1c=nil;
var _1d=41;
STANDARD_TITLEBAR_HEIGHT=25;
var _4=objj_allocateClassPair(_CPWindowView,"_CPStandardWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_headView"),new objj_ivar("_dividerView"),new objj_ivar("_bodyView"),new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton"),new objj_ivar("_minimizeButton"),new objj_ivar("_isDocumentEdited")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_1e,_1f,_20){
with(_1e){
var _21=objj_msgSend(objj_msgSend(_1e,"class"),"contentRectForFrameRect:",_20),_22=objj_msgSend(objj_msgSend(_1e,"window"),"toolbar");
if(objj_msgSend(_22,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_22,"_toolbarView"),"frame"));
_21.origin.y+=toolbarHeight;
_21.size.height-=toolbarHeight;
}
return _21;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(objj_msgSend(_23,"class"),"frameRectForContentRect:",_25),_27=objj_msgSend(objj_msgSend(_23,"window"),"toolbar");
if(objj_msgSend(_27,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_27,"_toolbarView"),"frame"));
_26.origin.y-=toolbarHeight;
_26.size.height+=toolbarHeight;
}
return _26;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_28,_29,_2a,_2b){
with(_28){
_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_2a,_2b);
if(_28){
var _2c=objj_msgSend(_28,"class"),_2d=objj_msgSend(_28,"bounds");
_headView=objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_2d),objj_msgSend(objj_msgSend(_28,"class"),"titleBarHeight")));
objj_msgSend(_headView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_headView,"setHitTests:",NO);
objj_msgSend(_28,"addSubview:",_headView);
_dividerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),CGRectGetWidth(_2d),1));
objj_msgSend(_dividerView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_dividerView,"setBackgroundColor:",objj_msgSend(_2c,"dividerBackgroundColor"));
objj_msgSend(_dividerView,"setHitTests:",NO);
objj_msgSend(_28,"addSubview:",_dividerView);
var y=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,y,CGRectGetWidth(_2d),CGRectGetHeight(_2d)-y));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_2c,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_28,"addSubview:",_bodyView);
objj_msgSend(_28,"setResizeIndicatorOffset:",CGSizeMake(2,2));
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_28,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
if(!_17){
var _2e=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_17=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButton.png"),CGSizeMake(16,16));
_18=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"),CGSizeMake(16,16));
_19=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonUnsaved.png"),CGSizeMake(16,16));
_1a=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonUnsavedHighlighted.png"),CGSizeMake(16,16));
}
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(8,7,16,16));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_28,"_updateCloseButton");
objj_msgSend(_28,"addSubview:",_closeButton);
}
if(_styleMask&CPMiniaturizableWindowMask&&!objj_msgSend(CPPlatform,"isBrowser")){
if(!_1b){
var _2e=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_1b=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButton.png"),CGSizeMake(16,16));
_1c=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButtonHighlighted.png"),CGSizeMake(16,16));
}
_minimizeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(27,7,16,16));
objj_msgSend(_minimizeButton,"setBordered:",NO);
objj_msgSend(_minimizeButton,"setImage:",_1b);
objj_msgSend(_minimizeButton,"setAlternateImage:",_1c);
objj_msgSend(_28,"addSubview:",_minimizeButton);
}
objj_msgSend(_28,"tile");
}
return _28;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_2f,_30){
with(_2f){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_2f,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
objj_msgSend(_minimizeButton,"setTarget:",objj_msgSend(_2f,"window"));
objj_msgSend(_minimizeButton,"setAction:",sel_getUid("performMiniaturize:"));
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_31,_32){
with(_31){
return CGSizeMake(0,objj_msgSend(objj_msgSend(_31,"class"),"titleBarHeight"));
}
}),new objj_method(sel_getUid("tile"),function(_33,_34){
with(_33){
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("_CPWindowView")},"tile");
var _35=objj_msgSend(_33,"window"),_36=objj_msgSend(_33,"bounds"),_37=CGRectGetWidth(_36);
objj_msgSend(_headView,"setFrameSize:",CGSizeMake(_37,objj_msgSend(_33,"toolbarMaxY")));
objj_msgSend(_dividerView,"setFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),_37,1));
var _38=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
objj_msgSend(_bodyView,"setFrame:",CGRectMake(0,_38,_37,CGRectGetHeight(_36)-_38));
var _39=8;
if(_closeButton){
_39+=19;
}
if(_minimizeButton){
_39+=19;
}
objj_msgSend(_titleField,"setFrame:",CGRectMake(_39,5,_37-_39*2,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(objj_msgSend(_35,"contentView"),"setFrameOrigin:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_dividerView,"frame"))));
}
}),new objj_method(sel_getUid("_updateCloseButton"),function(_3a,_3b){
with(_3a){
if(_isDocumentEdited){
objj_msgSend(_closeButton,"setImage:",_19);
objj_msgSend(_closeButton,"setAlternateImage:",_1a);
}else{
objj_msgSend(_closeButton,"setImage:",_17);
objj_msgSend(_closeButton,"setAlternateImage:",_18);
}
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_3c,_3d,_3e){
with(_3c){
_isDocumentEdited=_3e;
objj_msgSend(_3c,"_updateCloseButton");
}
}),new objj_method(sel_getUid("setTitle:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_titleField,"setStringValue:",_41);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_42,_43,_44){
with(_42){
if(CGRectContainsPoint(objj_msgSend(_headView,"frame"),objj_msgSend(_42,"convertPoint:fromView:",objj_msgSend(_44,"locationInWindow"),nil))){
return objj_msgSend(_42,"trackMoveWithEvent:",_44);
}
objj_msgSendSuper({receiver:_42,super_class:objj_getClass("_CPWindowView")},"mouseDown:",_44);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_45,_46){
with(_45){
if(!_14){
_14=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,1);
}
return _14;
}
}),new objj_method(sel_getUid("dividerBackgroundColor"),function(_47,_48){
with(_47){
if(!_15){
_15=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",125/255,125/255,125/255,1);
}
return _15;
}
}),new objj_method(sel_getUid("titleColor"),function(_49,_4a){
with(_49){
if(!_16){
_16=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",44/255,44/255,44/255,1);
}
return _16;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=CGRectMakeCopy(_4d),_4f=objj_msgSend(_4b,"titleBarHeight")+1;
_4e.origin.y+=_4f;
_4e.size.height-=_4f;
return _4e;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_50,_51,_52){
with(_50){
var _53=CGRectMakeCopy(_52),_54=objj_msgSend(_50,"titleBarHeight")+1;
_53.origin.y-=_54;
_53.size.height+=_54;
return _53;
}
}),new objj_method(sel_getUid("titleBarHeight"),function(_55,_56){
with(_55){
return STANDARD_TITLEBAR_HEIGHT;
}
})]);
p;15;_CPWindowView.ji;8;CPView.ji;13;CPImageView.jc;9331;
var _1=nil;
var _2=objj_allocateClassPair(CPView,"_CPWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_styleMask"),new objj_ivar("_resizeIndicator"),new objj_ivar("_resizeIndicatorOffset"),new objj_ivar("_toolbarView"),new objj_ivar("_resizeFrame"),new objj_ivar("_mouseDraggedPoint"),new objj_ivar("_cachedScreenFrame")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(objj_msgSend(_4,"class"),"contentRectForFrameRect:",_6);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(objj_msgSend(_7,"class"),"frameRectForContentRect:",_9);
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPView")},"initWithFrame:",_c);
if(_a){
_styleMask=_d;
_resizeIndicatorOffset=CGSizeMake(0,0);
_toolbarOffset=CGSizeMake(0,0);
objj_msgSend(_a,"setShowsResizeIndicator:",!(_styleMask&CPBorderlessBridgeWindowMask)&&(_styleMask&CPResizableWindowMask));
}
return _a;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("setTitle:"),function(_11,_12,_13){
with(_11){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_14,_15,_16){
with(_14){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_17,"window");
if((_styleMask&CPResizableWindowMask)&&_resizeIndicator){
var _1b=objj_msgSend(_resizeIndicator,"frame");
if(CGRectContainsPoint(_1b,objj_msgSend(_17,"convertPoint:fromView:",objj_msgSend(_19,"locationInWindow"),nil))){
return objj_msgSend(_17,"trackResizeWithEvent:",_19);
}
}
if(objj_msgSend(_1a,"isMovableByWindowBackground")){
objj_msgSend(_17,"trackMoveWithEvent:",_19);
}else{
objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPView")},"mouseDown:",_19);
}
}
}),new objj_method(sel_getUid("trackResizeWithEvent:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(_1e,"locationInWindow"),_20=objj_msgSend(_1e,"type");
if(_20===CPLeftMouseUp){
return;
}
var _21=objj_msgSend(_1c,"window");
if(_20===CPLeftMouseDown){
var _22=objj_msgSend(_21,"frame");
_resizeFrame=CGRectMake(_1f.x,_1f.y,CGRectGetWidth(_22),CGRectGetHeight(_22));
}else{
if(_20===CPLeftMouseDragged){
var _23=CGSizeMake(CGRectGetWidth(_resizeFrame)+_1f.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+_1f.y-CGRectGetMinY(_resizeFrame));
if(_21._isSheet&&_21._parentView&&(_21._frame.size.width!==_23.width)){
objj_msgSend(_21._parentView,"_setAttachedSheetFrameOrigin");
}
objj_msgSend(_21,"setFrameSize:",_23);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_1c,sel_getUid("trackResizeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_pointWithinScreenFrame:"),function(_24,_25,_26){
with(_24){
if(!objj_msgSend(CPPlatform,"isBrowser")){
return _26;
}
var _27=_cachedScreenFrame;
if(!_27){
_27=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}
var _28=CGPointMake(0,0);
_28.x=MIN(MAX(_26.x,-_frame.size.width+4),CGRectGetMaxX(_27)-4);
_28.y=MIN(MAX(_26.y,0),CGRectGetMaxY(_27)-8);
return _28;
}
}),new objj_method(sel_getUid("trackMoveWithEvent:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(_2b,"type");
if(_2c===CPLeftMouseUp){
_cachedScreenFrame=nil;
return;
}else{
if(_2c===CPLeftMouseDown){
_mouseDraggedPoint=objj_msgSend(objj_msgSend(_29,"window"),"convertBaseToGlobal:",objj_msgSend(_2b,"locationInWindow"));
_cachedScreenFrame=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}else{
if(_2c===CPLeftMouseDragged){
var _2d=objj_msgSend(_29,"window"),_2e=objj_msgSend(_2d,"frame"),_2f=objj_msgSend(_2d,"convertBaseToGlobal:",objj_msgSend(_2b,"locationInWindow")),_30=objj_msgSend(_29,"_pointWithinScreenFrame:",CGPointMake((_2e.origin.x)+(_2f.x-_mouseDraggedPoint.x),(_2e.origin.y)+(_2f.y-_mouseDraggedPoint.y)));
objj_msgSend(_2d,"setFrameOrigin:",_30);
_mouseDraggedPoint=objj_msgSend(_29,"_pointWithinScreenFrame:",_2f);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_29,sel_getUid("trackMoveWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_31,_32,_33){
with(_31){
if(_33){
var _34=objj_msgSend(_1,"size"),_35=objj_msgSend(_31,"frame").size;
_resizeIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_35.width-_34.width-_resizeIndicatorOffset.width,_35.height-_34.height-_resizeIndicatorOffset.height,_34.width,_34.height));
objj_msgSend(_resizeIndicator,"setImage:",_1);
objj_msgSend(_resizeIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_31,"addSubview:",_resizeIndicator);
}else{
objj_msgSend(_resizeIndicator,"removeFromSuperview");
_resizeIndicator=nil;
}
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_36,_37){
with(_36){
return _resizeIndicator!==nil;
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_38,_39,_3a){
with(_38){
if(CGSizeEqualToSize(_resizeIndicatorOffset,_3a)){
return;
}
_resizeIndicatorOffset=_3a;
if(!_resizeIndicator){
return;
}
var _3b=objj_msgSend(_resizeIndicator,"frame").size,_3c=objj_msgSend(_38,"frame").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_3c.width-_3b.width-_3a.width,_3c.height-_3b.height-_3a.height));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_3d,_3e){
with(_3d){
return _resizeIndicatorOffset;
}
}),new objj_method(sel_getUid("windowDidChangeDocumentEdited"),function(_3f,_40){
with(_3f){
}
}),new objj_method(sel_getUid("windowDidChangeDocumentSaving"),function(_41,_42){
with(_41){
}
}),new objj_method(sel_getUid("showsToolbar"),function(_43,_44){
with(_43){
return YES;
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_45,_46){
with(_45){
return CGSizeMakeZero();
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_47,_48){
with(_47){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarMaxY"),function(_49,_4a){
with(_49){
if(!_toolbarView||objj_msgSend(_toolbarView,"isHidden")){
return objj_msgSend(_49,"toolbarOffset").height;
}
return CGRectGetMaxY(objj_msgSend(_toolbarView,"frame"));
}
}),new objj_method(sel_getUid("toolbarView"),function(_4b,_4c){
with(_4b){
return _toolbarView;
}
}),new objj_method(sel_getUid("tile"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSend(_4d,"window"),_50=objj_msgSend(_4d,"bounds"),_51=CGRectGetWidth(_50);
if(objj_msgSend(objj_msgSend(_4f,"toolbar"),"isVisible")){
var _52=objj_msgSend(_4d,"toolbarView"),_53=objj_msgSend(_4d,"toolbarOffset");
objj_msgSend(_52,"setFrame:",CGRectMake(_53.width,_53.height,_51,CGRectGetHeight(objj_msgSend(_52,"frame"))));
}
if(objj_msgSend(_4d,"showsResizeIndicator")){
var _54=objj_msgSend(_resizeIndicator,"frame").size,_55=objj_msgSend(_4d,"bounds").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_55.width-_54.width-_resizeIndicatorOffset.width,_55.height-_54.height-_resizeIndicatorOffset.height));
}
}
}),new objj_method(sel_getUid("noteToolbarChanged"),function(_56,_57){
with(_56){
var _58=objj_msgSend(_56,"window"),_59=objj_msgSend(_58,"toolbar"),_5a=objj_msgSend(_59,"_toolbarView");
if(_toolbarView!==_5a){
objj_msgSend(_toolbarView,"removeFromSuperview");
if(_5a){
objj_msgSend(_5a,"removeFromSuperview");
objj_msgSend(_5a,"setLabelColor:",objj_msgSend(_56,"toolbarLabelColor"));
if(objj_msgSend(_56,"respondsToSelector:",sel_getUid("toolbarLabelShadowColor"))){
objj_msgSend(_5a,"setLabelShadowColor:",objj_msgSend(_56,"toolbarLabelShadowColor"));
}
objj_msgSend(_56,"addSubview:",_5a);
}
_toolbarView=_5a;
}
objj_msgSend(_5a,"setHidden:",!objj_msgSend(_56,"showsToolbar")||!objj_msgSend(_59,"isVisible"));
if(_58){
var _5b=objj_msgSend(_56,"convertRect:toView:",objj_msgSend(objj_msgSend(_58,"contentView"),"frame"),nil);
_5b.origin=objj_msgSend(_58,"convertBaseToGlobal:",_5b.origin);
objj_msgSend(_56,"setAutoresizesSubviews:",NO);
objj_msgSend(_58,"setFrame:",objj_msgSend(_58,"frameRectForContentRect:",_5b));
objj_msgSend(_56,"setAutoresizesSubviews:",YES);
}
objj_msgSend(_56,"tile");
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_5c,_5d,_5e){
with(_5c){
if(!_resizeIndicator||_5e===_resizeIndicator){
return;
}
objj_msgSend(_5c,"addSubview:",_resizeIndicator);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_5f,_60){
with(_5f){
if(_5f!=objj_msgSend(_CPWindowView,"class")){
return;
}
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class")),"pathForResource:","_CPWindowView/_CPWindowViewResizeIndicator.png"),CGSizeMake(12,12));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_61,_62,_63){
with(_61){
return CGRectMakeCopy(_63);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_64,_65,_66){
with(_64){
return CGRectMakeCopy(_66);
}
})]);
p;10;CPWindow.jI;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;10;CPScreen.ji;18;CPPlatformWindow.jc;52143;
CPBorderlessWindowMask=0;
CPTitledWindowMask=1<<0;
CPClosableWindowMask=1<<1;
CPMiniaturizableWindowMask=1<<2;
CPResizableWindowMask=1<<3;
CPTexturedBackgroundWindowMask=1<<8;
CPBorderlessBridgeWindowMask=1<<20;
CPHUDBackgroundWindowMask=1<<21;
CPWindowNotSizable=0;
CPWindowMinXMargin=1;
CPWindowWidthSizable=2;
CPWindowMaxXMargin=4;
CPWindowMinYMargin=8;
CPWindowHeightSizable=16;
CPWindowMaxYMargin=32;
CPBackgroundWindowLevel=-1;
CPNormalWindowLevel=0;
CPFloatingWindowLevel=3;
CPSubmenuWindowLevel=3;
CPTornOffMenuWindowLevel=3;
CPMainMenuWindowLevel=24;
CPStatusWindowLevel=25;
CPModalPanelWindowLevel=8;
CPPopUpMenuWindowLevel=101;
CPDraggingWindowLevel=500;
CPScreenSaverWindowLevel=1000;
CPWindowOut=0;
CPWindowAbove=1;
CPWindowBelow=2;
CPWindowWillCloseNotification="CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification="CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification="CPWindowDidResignMainNotification";
CPWindowDidMoveNotification="CPWindowDidMoveNotification";
CPWindowWillBeginSheetNotification="CPWindowWillBeginSheetNotification";
CPWindowDidEndSheetNotification="CPWindowDidEndSheetNotification";
CPWindowDidMiniaturizeNotification="CPWindowDidMiniaturizeNotification";
CPWindowWillMiniaturizeNotification="CPWindowWillMiniaturizeNotification";
CPWindowDidDeminiaturizeNotification="CPWindowDidDeminiaturizeNotification";
CPWindowShadowStyleStandard=0;
CPWindowShadowStyleMenu=1;
CPWindowShadowStylePanel=2;
var _1=20,_2=19,_3=10,_4=10,_5=5,_6=nil;
var _7=nil,_8=nil;
var _9=objj_allocateClassPair(CPResponder,"CPWindow"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isMiniaturized"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_shadowStyle"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession"),new objj_ivar("_sheetContext"),new objj_ivar("_parentView"),new objj_ivar("_isSheet")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPResponder")},"init");
if(_b){
var _f=objj_msgSend(objj_msgSend(_b,"class"),"_windowViewClassForStyleMask:",_e);
_frame=objj_msgSend(_f,"frameRectForContentRect:",_d);
objj_msgSend(_b,"_setSharesChromeWithPlatformWindow:",!objj_msgSend(CPPlatform,"isBrowser"));
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"));
}else{
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"initWithContentRect:",_frame));
objj_msgSend(_b,"platformWindow")._only=_b;
}
_isFullPlatformWindow=NO;
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_isSheet=NO;
_windowNumber=objj_msgSend(CPApp._windows,"count");
CPApp._windows[_windowNumber]=_b;
_styleMask=_e;
objj_msgSend(_b,"setLevel:",CPNormalWindowLevel);
_minSize=CGSizeMake(0,0);
_maxSize=CGSizeMake(1000000,1000000);
_windowView=objj_msgSend(objj_msgSend(_f,"alloc"),"initWithFrame:styleMask:",CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame)),_e);
objj_msgSend(_windowView,"_setWindow:",_b);
objj_msgSend(_windowView,"setNextResponder:",_b);
objj_msgSend(_b,"setMovableByWindowBackground:",_e&CPHUDBackgroundWindowMask);
objj_msgSend(_b,"setContentView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
_firstResponder=_b;
objj_msgSend(_b,"setNextResponder:",CPApp);
objj_msgSend(_b,"setHasShadow:",_e!==CPBorderlessWindowMask);
if(_e&CPBorderlessBridgeWindowMask){
objj_msgSend(_b,"setFullPlatformWindow:",YES);
}
_defaultButtonEnabled=YES;
_keyViewLoopIsDirty=YES;
}
return _b;
}
}),new objj_method(sel_getUid("platformWindow"),function(_10,_11){
with(_10){
return _platformWindow;
}
}),new objj_method(sel_getUid("setPlatformWindow:"),function(_12,_13,_14){
with(_12){
_platformWindow=_14;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_15,_16){
with(_15){
if(_initialFirstResponder){
objj_msgSend(_15,"makeFirstResponder:",_initialFirstResponder);
}
_keyViewLoopIsDirty=!objj_msgSend(_15,"_hasKeyViewLoop");
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_17,_18,_19){
with(_17){
if(_windowView===_19){
return;
}
var _1a=_windowView;
_windowView=_19;
if(_1a){
objj_msgSend(_1a,"_setWindow:",nil);
objj_msgSend(_1a,"noteToolbarChanged");
}
if(_windowView){
var _1b=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_1b.origin=objj_msgSend(_17,"convertBaseToGlobal:",_1b.origin);
objj_msgSend(_windowView,"_setWindow:",_17);
objj_msgSend(_windowView,"setNextResponder:",_17);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_17,"setFrame:",objj_msgSend(_17,"frameRectForContentRect:",_1b));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_1c,_1d,_1e){
with(_1c){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_1e=!!_1e;
if(_isFullPlatformWindow===_1e){
return;
}
_isFullPlatformWindow=_1e;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_1c,"contentRectForFrameRect:",objj_msgSend(_1c,"frame")),objj_msgSend(_1c,"hasShadow"),objj_msgSend(_1c,"level"));
var _1f=objj_msgSend(objj_msgSend(_1c,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_20=objj_msgSend(objj_msgSend(_1f,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_1c,"_setWindowView:",_20);
objj_msgSend(_1c,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_1c,"setHasShadow:",NO);
objj_msgSend(_1c,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_1c,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _20=_fullPlatformWindowSession.windowView;
objj_msgSend(_1c,"_setWindowView:",_20);
objj_msgSend(_1c,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_1c,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_1c,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_1c,"setFrame:",objj_msgSend(_20,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_21,_22){
with(_21){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_23,_24){
with(_23){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_27);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(_windowView,"frameRectForContentRect:",_2a);
}
}),new objj_method(sel_getUid("frame"),function(_2b,_2c){
with(_2b){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_2d,_2e,_2f,_30,_31){
with(_2d){
if(_31){
var _32=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_2d,_2f);
objj_msgSend(_32,"startAnimation");
}else{
var _33=_frame.origin,_34=_2f.origin;
if(!(_33.x==_34.x&&_33.y==_34.y)){
_33.x=_34.x;
_33.y=_34.y;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_2d);
}
var _35=_frame.size,_36=_2f.size;
if(!(_35.width==_36.width&&_35.height==_36.height)){
_35.width=MIN(MAX(_36.width,_minSize.width),_maxSize.width);
_35.height=MIN(MAX(_36.height,_minSize.height),_maxSize.height);
objj_msgSend(_windowView,"setFrameSize:",_35);
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_35.width+_2,height:_4+_35.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_2d);
}
}
if(objj_msgSend(_2d,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentRect:",_frame);
}
}
}
}),new objj_method(sel_getUid("setFrame:display:"),function(_37,_38,_39,_3a){
with(_37){
objj_msgSendSuper({receiver:_37,super_class:objj_getClass("CPResponder")},"setFrame:display:animate:",_39,_3a,NO);
}
}),new objj_method(sel_getUid("setFrame:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(_3b,"setFrame:display:animate:",_3d,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_3e,_3f,_40){
with(_3e){
objj_msgSend(_3e,"setFrame:display:animate:",{origin:{x:_40.x,y:_40.y},size:{width:(_frame.size.width),height:(_frame.size.height)}},YES,NO);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_41,"setFrame:display:animate:",{origin:{x:(_frame.origin.x),y:(_frame.origin.y)},size:{width:_43.width,height:_43.height}},YES,NO);
}
}),new objj_method(sel_getUid("orderFront:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_platformWindow,"orderFront:",_44);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_44,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_47,_48,_49){
with(_47){
}
}),new objj_method(sel_getUid("orderOut:"),function(_4a,_4b,_4c){
with(_4a){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_4a);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_4a,nil);
if(objj_msgSend(CPApp,"keyWindow")==_4a){
objj_msgSend(_4a,"resignKeyWindow");
CPApp._keyWindow=nil;
}
if(objj_msgSend(_4a,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"orderOut:",_4a);
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_4d,_4e,_4f,_50){
with(_4d){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_4f,_4d,CPApp._windows[_50]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_51,_52,_53){
with(_51){
_level=_53;
if(objj_msgSend(_51,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_53);
}
}
}),new objj_method(sel_getUid("level"),function(_54,_55){
with(_54){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_56,_57){
with(_56){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_58,_59){
with(_58){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_5c);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_5d,_5e){
with(_5d){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_5f,_60,_61){
with(_5f){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_61);
}
}),new objj_method(sel_getUid("setContentView:"),function(_62,_63,_64){
with(_62){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _65=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_contentView=_64;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_62,"contentRectForFrameRect:",_65));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_66,_67){
with(_66){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_68,_69,_6a){
with(_68){
objj_msgSend(_windowView,"setBackgroundColor:",_6a);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_6b,_6c){
with(_6b){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_6d,_6e,_6f){
with(_6d){
if(CGSizeEqualToSize(_minSize,_6f)){
return;
}
_minSize=CGSizeCreateCopy(_6f);
var _70=CGSizeMakeCopy(objj_msgSend(_6d,"frame").size),_71=NO;
if(_70.width<_minSize.width){
_70.width=_minSize.width;
_71=YES;
}
if(_70.height<_minSize.height){
_70.height=_minSize.height;
_71=YES;
}
if(_71){
objj_msgSend(_6d,"setFrameSize:",_70);
}
}
}),new objj_method(sel_getUid("minSize"),function(_72,_73){
with(_72){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_74,_75,_76){
with(_74){
if(CGSizeEqualToSize(_maxSize,_76)){
return;
}
_maxSize=CGSizeCreateCopy(_76);
var _77=CGSizeMakeCopy(objj_msgSend(_74,"frame").size),_78=NO;
if(_77.width>_maxSize.width){
_77.width=_maxSize.width;
_78=YES;
}
if(_77.height>_maxSize.height){
_77.height=_maxSize.height;
_78=YES;
}
if(_78){
objj_msgSend(_74,"setFrameSize:",_77);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_79,_7a){
with(_79){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_7b,_7c){
with(_7b){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_7d,_7e,_7f){
with(_7d){
if(_hasShadow===_7f){
return;
}
_hasShadow=_7f;
if(objj_msgSend(_7d,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_platformWindow,"setHasShadow:",_7f);
}
if(_hasShadow){
var _80=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_80)+_2,_3+CGRectGetHeight(_80)+_4));
if(!_6){
var _81=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_81,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}else{
if(_shadowView){
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_82,_83,_84){
with(_82){
_shadowStyle=_84;
objj_msgSend(objj_msgSend(_82,"platformWindow"),"setShadowStyle:",_shadowStyle);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_85,_86,_87){
with(_85){
_delegate=_87;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _88=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_88,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_85);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_88,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_85);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_88,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_85);
}
}
}),new objj_method(sel_getUid("delegate"),function(_89,_8a){
with(_89){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_8b,_8c,_8d){
with(_8b){
_windowController=_8d;
}
}),new objj_method(sel_getUid("windowController"),function(_8e,_8f){
with(_8e){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_90,_91,_92){
with(_90){
if(objj_msgSend(_delegate,"respondsToSelector:",_92)){
objj_msgSend(_delegate,"performSelector:",_92);
}else{
objj_msgSendSuper({receiver:_90,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_92);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_93,_94){
with(_93){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_95,_96,_97){
with(_95){
if(_firstResponder==_97){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_97||!objj_msgSend(_97,"acceptsFirstResponder")||!objj_msgSend(_97,"becomeFirstResponder")){
_firstResponder=_95;
return NO;
}
_firstResponder=_97;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_98,_99){
with(_98){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_9a,_9b){
with(_9a){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_9c,_9d,_9e){
with(_9c){
_acceptsMouseMovedEvents=_9e;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_9f,_a0){
with(_9f){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_a1,_a2,_a3){
with(_a1){
_ignoresMouseEvents=_a3;
}
}),new objj_method(sel_getUid("title"),function(_a4,_a5){
with(_a4){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a6,_a7,_a8){
with(_a6){
_title=_a8;
objj_msgSend(_windowView,"setTitle:",_a8);
objj_msgSend(_a6,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_a9,_aa,_ab){
with(_a9){
objj_msgSend(_a9,"setRepresentedFilename:",_ab);
objj_msgSend(_a9,"setTitle:",objj_msgSend(_ab,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_ac,_ad,_ae){
with(_ac){
objj_msgSend(_ac,"setRepresentedURL:",_ae);
}
}),new objj_method(sel_getUid("representedFilename"),function(_af,_b0){
with(_af){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_b1,_b2,_b3){
with(_b1){
_representedURL=_b3;
}
}),new objj_method(sel_getUid("representedURL"),function(_b4,_b5){
with(_b4){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_b6,_b7){
with(_b6){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_b8,_b9,_ba){
with(_b8){
_isMovableByWindowBackground=_ba;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_bb,_bc){
with(_bb){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_bd,_be){
with(_bd){
var _bf=objj_msgSend(_bd,"frame").size,_c0=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(_platformWindow,"contentBounds").size:objj_msgSend(objj_msgSend(_bd,"screen"),"visibleFrame").size;
objj_msgSend(_bd,"setFrameOrigin:",CGPointMake((_c0.width-_bf.width)/2,(_c0.height-_bf.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_c1,_c2,_c3){
with(_c1){
var _c4=objj_msgSend(_c3,"type"),_c5=objj_msgSend(_c3,"locationInWindow");
switch(_c4){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_c1,"firstResponder"),"keyUp:",_c3);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_c1,"firstResponder"),"keyDown:",_c3);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_c5),"scrollWheel:",_c3);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_c5),"mouseUp:",_c3);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_c3);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_c5);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_c1,"makeFirstResponder:",_leftMouseDownView);
}
objj_msgSend(CPApp,"activateIgnoringOtherApps:",YES);
var _c6=objj_msgSend(_c3,"window");
if(objj_msgSend(_c6,"isKeyWindow")||objj_msgSend(_c6,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_c3);
}else{
objj_msgSend(_c1,"makeKeyAndOrderFront:",_c1);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_c3)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_c3);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_c5),"mouseDragged:",_c3);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_c3);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_c3);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_c5);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_c3);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_c3);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _c7=objj_msgSend(_windowView,"hitTest:",_c5);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_c7){
return objj_msgSend(_c7,"mouseMoved:",_c3);
}
var _c8=_c7,_c9=[];
while(_c8){
_c9.unshift(_c8);
_c8=objj_msgSend(_c8,"superview");
}
var _ca=MIN(_mouseEnteredStack.length,_c9.length);
while(_ca--){
if(_mouseEnteredStack[_ca]===_c9[_ca]){
break;
}
}
var _cb=_ca+1,_cc=_mouseEnteredStack.length;
if(_cb<_cc){
var _cd=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_c5,objj_msgSend(_c3,"modifierFlags"),objj_msgSend(_c3,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_cb<_cc;++_cb){
objj_msgSend(_mouseEnteredStack[_cb],"mouseExited:",_cd);
}
}
_cb=_ca+1;
_cc=_c9.length;
if(_cb<_cc){
var _cd=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_c5,objj_msgSend(_c3,"modifierFlags"),objj_msgSend(_c3,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_cb<_cc;++_cb){
objj_msgSend(_c9[_cb],"mouseEntered:",_cd);
}
}
_mouseEnteredStack=_c9;
objj_msgSend(_c7,"mouseMoved:",_c3);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_ce,_cf){
with(_ce){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_d0,_d1){
with(_d0){
if(_firstResponder!=_d0&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_d2,_d3){
with(_d2){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_d4,_d5){
with(_d4){
return objj_msgSend(CPApp,"keyWindow")==_d4;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_d6,_d7,_d8){
with(_d6){
objj_msgSend(_d6,"orderFront:",_d6);
objj_msgSend(_d6,"makeKeyWindow");
objj_msgSend(_d6,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_d9,_da){
with(_d9){
if(!objj_msgSend(_d9,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_d9;
objj_msgSend(_d9,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_db,_dc){
with(_db){
if(_firstResponder!=_db&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_db);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_dd,_de,_df,_e0,_e1,_e2,_e3,_e4,_e5){
with(_dd){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_df,_dd,objj_msgSend(_dd,"convertBaseToGlobal:",_e0),_e1,_e2,_e3,_e4,_e5);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(_e6,_e7,_e8){
with(_e6){
if(!_e8){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_e8);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(_e9,_ea,_eb){
with(_e9){
if(!_eb){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_eb);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_ec,_ed,_ee,_ef,_f0,_f1,_f2,_f3,_f4){
with(_ec){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_ee,_ec,objj_msgSend(_ec,"convertBaseToGlobal:",_ef),_f0,_f1,_f2,_f3,_f4);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_f5,_f6,_f7){
with(_f5){
if(!_f7){
return;
}
objj_msgSend(_f5,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_f7);
objj_msgSend(_f5,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_f8,_f9){
with(_f8){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_fa,_fb){
with(_fa){
objj_msgSend(_fa,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_fc,_fd,_fe){
with(_fc){
if(_isDocumentEdited==_fe){
return;
}
_isDocumentEdited=_fe;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
objj_msgSend(_windowView,"setDocumentEdited:",_fe);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_ff,_100){
with(_ff){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(self,_101,_102){
with(self){
if(_isDocumentSaving==_102){
return;
}
_isDocumentSaving=_102;
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(self,_103){
with(self){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(self,_104){
with(self){
if(!objj_msgSend(self,"isMainWindow")){
return;
}
var _105=objj_msgSend(CPApp,"mainMenu"),_106=objj_msgSend(_105,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_106==CPNotFound){
return;
}
var item=objj_msgSend(_105,"itemAtIndex:",_106);
if(_isDocumentSaving){
_7=objj_msgSend(item,"image");
objj_msgSend(item,"setTitle:","Saving...");
objj_msgSend(item,"setImage:",_8);
objj_msgSend(item,"setEnabled:",NO);
}else{
objj_msgSend(item,"setTitle:","Save");
objj_msgSend(item,"setImage:",_7);
objj_msgSend(item,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("performMiniaturize:"),function(self,_107,_108){
with(self){
objj_msgSend(self,"miniaturize:",_108);
}
}),new objj_method(sel_getUid("miniaturize:"),function(self,_109,_10a){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillMiniaturizeNotification,self);
objj_msgSend(objj_msgSend(self,"platformWindow"),"miniaturize:",_10a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMiniaturizeNotification,self);
_isMiniaturized=YES;
}
}),new objj_method(sel_getUid("deminiaturize:"),function(self,_10b,_10c){
with(self){
objj_msgSend(objj_msgSend(self,"platformWindow"),"deminiaturize:",_10c);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidDeminiaturizeNotification,self);
_isMiniaturized=NO;
}
}),new objj_method(sel_getUid("isMiniaturized"),function(self,_10d){
with(self){
return _isMiniaturized;
}
}),new objj_method(sel_getUid("performClose:"),function(self,_10e,_10f){
with(self){
if(!(_styleMask&CPClosableWindowMask)){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",self)){
return;
}
}else{
if(objj_msgSend(self,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(self,"windowShouldClose:",self)){
return;
}
}
var _110=objj_msgSend(_windowController,"documents");
if(objj_msgSend(_110,"count")){
var _111=objj_msgSend(_110,"indexOfObject:",objj_msgSend(_windowController,"document"));
objj_msgSend(_110[_111],"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),{documents:objj_msgSend(_110,"copy"),visited:0,index:_111});
}else{
objj_msgSend(self,"close");
}
}
}),new objj_method(sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),function(self,_112,_113,_114,_115){
with(self){
if(_114){
var _116=objj_msgSend(self,"windowController"),_117=_115.documents,_118=objj_msgSend(_117,"count"),_119=++_115.visited,_11a=++_115.index%_118;
objj_msgSend(_113,"removeWindowController:",_116);
if(_119<_118){
objj_msgSend(_116,"setDocument:",_117[_11a]);
objj_msgSend(_117[_11a],"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),_115);
}else{
objj_msgSend(self,"close");
}
}
}
}),new objj_method(sel_getUid("close"),function(self,_11b){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillCloseNotification,self);
objj_msgSend(self,"orderOut:",nil);
}
}),new objj_method(sel_getUid("isMainWindow"),function(self,_11c){
with(self){
return objj_msgSend(CPApp,"mainWindow")==self;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(self,_11d){
with(self){
if(objj_msgSend(self,"isVisible")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("makeMainWindow"),function(self,_11e){
with(self){
if(!objj_msgSend(self,"canBecomeMainWindow")){
return;
}
objj_msgSend(CPApp._mainWindow,"resignMainWindow");
CPApp._mainWindow=self;
objj_msgSend(self,"becomeMainWindow");
}
}),new objj_method(sel_getUid("becomeMainWindow"),function(self,_11f){
with(self){
objj_msgSend(self,"_synchronizeMenuBarTitleWithWindowTitle");
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeMainNotification,self);
}
}),new objj_method(sel_getUid("resignMainWindow"),function(self,_120){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignMainNotification,self);
}
}),new objj_method(sel_getUid("toolbar"),function(self,_121){
with(self){
return _toolbar;
}
}),new objj_method(sel_getUid("setToolbar:"),function(self,_122,_123){
with(self){
if(_toolbar===_123){
return;
}
objj_msgSend(objj_msgSend(_123,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_123;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_124,_125){
with(self){
var _126=objj_msgSend(self,"toolbar");
objj_msgSend(_126,"setVisible:",!objj_msgSend(_126,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_127){
with(self){
var _128=CGRectMakeCopy(objj_msgSend(self,"frame")),_129;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_129=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_129=CGRectMakeCopy(objj_msgSend(self,"frame"));
_129.origin=_128.origin;
}
objj_msgSend(self,"setFrame:",_129);
}
}),new objj_method(sel_getUid("_setFrame:delegate:duration:curve:"),function(self,_12a,_12b,_12c,_12d,_12e){
with(self){
var _12f=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",self,_12b);
objj_msgSend(_12f,"setDelegate:",_12c);
objj_msgSend(_12f,"setAnimationCurve:",_12e);
objj_msgSend(_12f,"setDuration:",_12d);
objj_msgSend(_12f,"startAnimation");
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_130){
with(self){
var _131=objj_msgSend(self,"attachedSheet");
var _132=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_133=CGRectMakeCopy(objj_msgSend(_131,"frame"));
_133.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_132);
_133.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_133))/2);
objj_msgSend(_131,"setFrameOrigin:",_133.origin);
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_134,_135,_136,_137,_138){
with(self){
var _139=objj_msgSend(_135,"frame");
_sheetContext={"sheet":_135,"modalDelegate":_136,"endSelector":_137,"contextInfo":_138,"frame":CGRectMakeCopy(_139),"returnCode":-1,"opened":NO};
objj_msgSend(self,"_attachSheetWindow:",_135);
}
}),new objj_method(sel_getUid("_attachSheetWindow:"),function(self,_13a,_13b){
with(self){
var _13c=objj_msgSend(_13b,"frame"),_13d=objj_msgSend(self,"frame"),_13e=objj_msgSend(_13b,"contentView");
objj_msgSend(self,"_setUpMasksForView:",_13e);
_13b._isSheet=YES;
_13b._parentView=self;
var _13f=_13d.origin.x+FLOOR((_13d.size.width-_13c.size.width)/2),_140=_13d.origin.y+objj_msgSend(objj_msgSend(self,"contentView"),"frame").origin.y,_141=CGRectMake(_13f,_140,_13c.size.width,0),_142=CGRectMake(_13f,_140,_13c.size.width,_13c.size.height);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillBeginSheetNotification,self);
objj_msgSend(CPApp,"runModalForWindow:",_13b);
objj_msgSend(_13b,"orderFront:",self);
objj_msgSend(_13b,"setFrame:",_141);
_sheetContext["opened"]=YES;
objj_msgSend(_13b,"_setFrame:delegate:duration:curve:",_142,self,0.2,CPAnimationEaseOut);
objj_msgSend(_13b,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("_detachSheetWindow"),function(self,_143){
with(self){
var _144=objj_msgSend(self,"attachedSheet"),_145=objj_msgSend(_144,"frame"),_146=CGRectMakeCopy(_145);
_146.size.height=0;
_sheetContext["frame"]=_145;
var _147=objj_msgSend(_144,"contentView");
objj_msgSend(self,"_setUpMasksForView:",_147);
_sheetContext["opened"]=NO;
objj_msgSend(_144,"_setFrame:delegate:duration:curve:",_146,self,0.2,CPAnimationEaseIn);
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(self,_148,anim){
with(self){
var _149=_sheetContext["sheet"];
if(anim._window!=_149){
return;
}
var _14a=objj_msgSend(_149,"contentView");
if(_sheetContext["opened"]===YES){
objj_msgSend(self,"_restoreMasksForView:",_14a);
return;
}
objj_msgSend(CPApp,"stopModal");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidEndSheetNotification,self);
objj_msgSend(_149,"orderOut:",self);
var _14b=_sheetContext["frame"];
objj_msgSend(_149,"setFrame:",_14b);
objj_msgSend(self,"_restoreMasksForView:",_14a);
var _14c=_sheetContext["modalDelegate"],_14d=_sheetContext["endSelector"];
if(_14c!=nil&&_14d!=nil){
objj_msgSend(_14c,_14d,_149,_sheetContext["returnCode"],_sheetContext["contextInfo"]);
}
_sheetContext=nil;
_149._parentView=nil;
}
}),new objj_method(sel_getUid("_setUpMasksForView:"),function(self,_14e,_14f){
with(self){
var _150=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_14f,"subviews"));
objj_msgSend(_150,"addObject:",_14f);
for(var i=0,_151=objj_msgSend(_150,"count");i<_151;i++){
var view=objj_msgSend(_150,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_152=(mask&CPViewMinYMargin)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask|_152));
}
}
}),new objj_method(sel_getUid("_restoreMasksForView:"),function(self,_153,_154){
with(self){
var _155=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_154,"subviews"));
objj_msgSend(_155,"addObject:",_154);
for(var i=0,_156=objj_msgSend(_155,"count");i<_156;i++){
var view=objj_msgSend(_155,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_157=(mask&128)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask&(~_157)));
}
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_158){
with(self){
if(_sheetContext===nil){
return nil;
}
return _sheetContext["sheet"];
}
}),new objj_method(sel_getUid("isSheet"),function(self,_159){
with(self){
return _isSheet;
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(self,_15a){
with(self){
return NO;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(self,_15b){
with(self){
return NO;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(self,_15c,_15d){
with(self){
return objj_msgSend(objj_msgSend(self,"contentView"),"performKeyEquivalent:",_15d);
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_15e,_15f){
with(self){
if(!objj_msgSend(_15f,"_couldBeKeyEquivalent")||!objj_msgSend(self,"performKeyEquivalent:",_15f)){
objj_msgSend(self,"interpretKeyEvents:",[_15f]);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(self,_160,_161){
with(self){
if(_defaultButton&&_defaultButtonEnabled){
objj_msgSend(_defaultButton,"performClick:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(self,_162,_163){
with(self){
objj_msgSend(self,"selectNextKeyView:",nil);
}
}),new objj_method(sel_getUid("_dirtyKeyViewLoop"),function(self,_164){
with(self){
if(_autorecalculatesKeyViewLoop){
_keyViewLoopIsDirty=YES;
}
}
}),new objj_method(sel_getUid("_hasKeyViewLoop"),function(self,_165){
with(self){
var _166=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_166);
for(var i=0,_167=objj_msgSend(_166,"count");i<_167;i++){
if(_166[i]._nextKeyView){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_168){
with(self){
var _169=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_169);
var _16a=objj_msgSend(_169,"sortedArrayUsingFunction:context:",_16b,_contentView),_16c=objj_msgSend(_16a,"count");
for(var i=0;i<_16c;i++){
objj_msgSend(_16a[i],"setNextKeyView:",_16a[(i+1)%_16c]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("_appendSubviewsOf:toArray:"),function(self,_16d,_16e,_16f){
with(self){
var _170=objj_msgSend(_16e,"subviews"),_171=objj_msgSend(_170,"count");
while(_171--){
objj_msgSend(self,"_appendSubviewsOf:toArray:",_170[_171],_16f);
}
objj_msgSend(_16f,"addObject:",_16e);
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_172,_173){
with(self){
if(_autorecalculatesKeyViewLoop===_173){
return;
}
_autorecalculatesKeyViewLoop=_173;
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}else{
if(_autorecalculatesKeyViewLoop){
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_174){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_175,_176){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewFollowingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_177,_178){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewPrecedingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_179,_17a){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_17a,"nextValidKeyView"));
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_17b,_17c){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_17c,"previousValidKeyView"));
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_17d,_17e){
with(self){
objj_msgSend(self,"setDefaultButton:",_17e);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_17f){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_180,_181){
with(self){
objj_msgSend(_defaultButton,"setDefaultButton:",NO);
_defaultButton=_181;
objj_msgSend(_defaultButton,"setDefaultButton:",YES);
}
}),new objj_method(sel_getUid("defaultButton"),function(self,_182){
with(self){
return _defaultButton;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"),function(self,_183){
with(self){
_defaultButtonEnabled=YES;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"),function(self,_184){
with(self){
objj_msgSend(self,"enableKeyEquivalentForDefaultButton");
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"),function(self,_185){
with(self){
_defaultButtonEnabled=NO;
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"),function(self,_186){
with(self){
objj_msgSend(self,"disableKeyEquivalentForDefaultButton");
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("initialize"),function(self,_187){
with(self){
if(self!=objj_msgSend(CPWindow,"class")){
return;
}
var _188=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_188,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_189,_18a){
with(self){
if(_18a&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_18a===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}else{
if(_18a&CPDocModalWindowMask){
return _CPDocModalWindowView;
}
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_18b,_18c){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_18d,_18e,_18f){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_18f),"frameRectForContentRect:",_18e);
}
})]);
var _16b=function(a,b,_190){
var _191=objj_msgSend(a,"convertRect:toView:",objj_msgSend(a,"bounds"),nil),_192=objj_msgSend(b,"convertRect:toView:",objj_msgSend(b,"bounds"),nil);
if(CGRectGetMinY(_191)<CGRectGetMinY(_192)){
return -1;
}else{
if(CGRectGetMinY(_191)==CGRectGetMinY(_192)&&CGRectGetMinX(_191)<CGRectGetMinX(_192)){
return -1;
}else{
if(CGRectGetMinX(_191)==CGRectGetMinX(_192)&&CGRectGetMinX(_191)==CGRectGetMinX(_192)){
return 0;
}else{
return 1;
}
}
}
};
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"),function(self,_193){
with(self){
if(!objj_msgSend(_windowController,"document")||!objj_msgSend(self,"isMainWindow")){
return;
}
objj_msgSend(CPMenu,"setMenuBarTitle:",_title);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_194,_195){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _196=objj_msgSend(_platformWindow,"contentBounds"),_197=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_196)-_195.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_196)-_195.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_197.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_197.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_197.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_197.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_197);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_198,_199){
with(self){
_autoresizingMask=_199;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_19a){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_19b,_19c){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_19c):objj_msgSend(self,"convertBaseToScreen:",_19c);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_19d,_19e){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_19e):objj_msgSend(self,"convertScreenToBase:",_19e);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_19f,_1a0){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _1a0;
}
var _1a1=objj_msgSend(self,"frame").origin;
return {x:_1a0.x+_1a1.x,y:_1a0.y+_1a1.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_1a2,_1a3){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _1a3;
}
var _1a4=objj_msgSend(self,"frame").origin;
return {x:_1a3.x-_1a4.x,y:_1a3.y-_1a4.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_1a5,_1a6){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1a6));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_1a7,_1a8){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1a8));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_1a9,_1aa){
with(self){
if(_1aa&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1aa;
}
}),new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"),function(self,_1ab){
with(self){
return _sharesChromeWithPlatformWindow;
}
}),new objj_method(sel_getUid("undoManager"),function(self,_1ac){
with(self){
if(_delegateRespondsToWindowWillReturnUndoManagerSelector){
return objj_msgSend(_delegate,"windowWillReturnUndoManager:",self);
}
if(!_undoManager){
_undoManager=objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init");
}
return _undoManager;
}
}),new objj_method(sel_getUid("undo:"),function(self,_1ad,_1ae){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_1af,_1b0){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_1b1,_1b2){
with(self){
return CGRectContainsPoint(_frame,_1b2);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setFullBridge:"),function(self,_1b3,_1b4){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1b4);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_1b5){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_1b6,_1b7){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_1b7);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_1b8,_1b9){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_1b9);
}
})]);
var _1ba=function(_1bb,_1bc,_1bd){
return _1bb+(_1bc-_1bb)*_1bd;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_1be,_1bf,_1c0){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_1bf;
_targetFrame=CGRectMakeCopy(_1c0);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_1c1){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_1c2,_1c3){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_1c3);
var _1c4=objj_msgSend(self,"currentValue");
if(_1c4==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_1ba(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_1c4),_1ba(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_1c4)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_1ba(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_1c4),_1ba(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_1c4)));
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_1c5,_1c6,_1c7,_1c8){
return {windowView:_1c5,contentRect:_1c6,hasShadow:_1c7,level:_1c8};
};
CPStandardWindowShadowStyle=0;
CPMenuWindowShadowStyle=1;
CPPanelWindowShadowStyle=2;
CPCustomWindowShadowStyle=3;
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;23;_CPDocModalWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.jp;12;CPPlatform.jI;21;Foundation/CPObject.jc;1074;
var _1=objj_allocateClassPair(CPObject,"CPPlatform"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
objj_msgSend(CPPlatformString,"bootstrap");
objj_msgSend(CPPlatformWindow,"setPrimaryPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"_init"));
}
}),new objj_method(sel_getUid("isBrowser"),function(_5,_6){
with(_5){
return typeof window.cpIsDesktop==="undefined";
}
}),new objj_method(sel_getUid("supportsDragAndDrop"),function(_7,_8){
with(_7){
return CPFeatureIsCompatible(CPHTMLDragAndDropFeature);
}
}),new objj_method(sel_getUid("supportsNativeMainMenu"),function(_9,_a){
with(_9){
return (typeof window["cpSetMainMenu"]==="function");
}
}),new objj_method(sel_getUid("terminateApplication"),function(_b,_c){
with(_b){
if(typeof window["cpTerminate"]==="function"){
window.cpTerminate();
}
}
}),new objj_method(sel_getUid("activateIgnoringOtherApps:"),function(_d,_e,_f){
with(_d){
}
})]);
p;18;CPPlatformString.jI;21;Foundation/CPObject.jc;402;
var _1=objj_allocateClassPair(CPObject,"CPPlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_5,_6,_7,_8,_9){
with(_5){
return {width:0,height:0};
}
})]);
p;18;CPPlatformWindow.jI;21;Foundation/CPObject.jc;3467;
var _1=NULL;
var _2=objj_allocateClassPair(CPObject,"CPPlatformWindow"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contentRect"),new objj_ivar("_level"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowStyle")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentRect:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_contentRect={origin:{x:_6.origin.x,y:_6.origin.y},size:{width:_6.size.width,height:_6.size.height}};
}
return _4;
}
}),new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"initWithContentRect:",{origin:{x:0,y:0},size:{width:400,height:500}});
}
}),new objj_method(sel_getUid("contentRect"),function(_9,_a){
with(_9){
return {origin:{x:_contentRect.origin.x,y:_contentRect.origin.y},size:{width:_contentRect.size.width,height:_contentRect.size.height}};
}
}),new objj_method(sel_getUid("contentBounds"),function(_b,_c){
with(_b){
var _d=objj_msgSend(_b,"contentRect");
_d.origin={x:0,y:0};
return _d;
}
}),new objj_method(sel_getUid("visibleFrame"),function(_e,_f){
with(_e){
var _10=objj_msgSend(_e,"contentBounds");
_10.origin=CGPointMakeZero();
if(objj_msgSend(CPMenu,"menuBarVisible")){
var _11=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"menuBarHeight");
_10.origin.y+=_11;
_10.size.height-=_11;
}
return _10;
}
}),new objj_method(sel_getUid("usableContentFrame"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"visibleFrame");
}
}),new objj_method(sel_getUid("setContentRect:"),function(_14,_15,_16){
with(_14){
if(!_16||((_contentRect.origin.x==_16.origin.x&&_contentRect.origin.y==_16.origin.y)&&(_contentRect.size.width==_16.size.width&&_contentRect.size.height==_16.size.height))){
return;
}
_contentRect={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
objj_msgSend(_14,"updateNativeContentRect");
}
}),new objj_method(sel_getUid("updateFromNativeContentRect"),function(_17,_18){
with(_17){
objj_msgSend(_17,"setContentRect:",objj_msgSend(_17,"nativeContentRect"));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_19,"contentRect");
return {x:_1b.x+(_1c.origin.x),y:_1b.y+(_1c.origin.y)};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(_1d,_1e,_1f){
with(_1d){
var _20=objj_msgSend(_1d,"contentRect");
return {x:_1f.x-(_20.origin.x),y:_1f.y-(_20.origin.y)};
}
}),new objj_method(sel_getUid("isVisible"),function(_21,_22){
with(_21){
return NO;
}
}),new objj_method(sel_getUid("deminiaturize:"),function(_23,_24,_25){
with(_23){
}
}),new objj_method(sel_getUid("miniaturize:"),function(_26,_27,_28){
with(_26){
}
}),new objj_method(sel_getUid("setLevel:"),function(_29,_2a,_2b){
with(_29){
_level=_2b;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_2c,_2d,_2e){
with(_2c){
_hasShadow=_2e;
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_2f,_30,_31){
with(_2f){
_shadowStyle=_31;
}
}),new objj_method(sel_getUid("supportsFullPlatformWindows"),function(_32,_33){
with(_32){
return objj_msgSend(CPPlatform,"isBrowser");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("primaryPlatformWindow"),function(_34,_35){
with(_34){
return _1;
}
}),new objj_method(sel_getUid("setPrimaryPlatformWindow:"),function(_36,_37,_38){
with(_36){
_1=_38;
}
})]);
p;18;CPDOMWindowLayer.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jc;1985;
var _1=objj_allocateClassPair(CPObject,"CPDOMWindowLayer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_level"),new objj_ivar("_windows"),new objj_ivar("_DOMElement")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithLevel:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_level=_5;
_windows=[];
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.top="0px";
_DOMElement.style.left="0px";
_DOMElement.style.width="1px";
_DOMElement.style.height="1px";
}
return _3;
}
}),new objj_method(sel_getUid("level"),function(_6,_7){
with(_6){
return _level;
}
}),new objj_method(sel_getUid("removeWindow:"),function(_8,_9,_a){
with(_8){
if(!_a._isVisible){
return;
}
var _b=_a._index,_c=_windows.length-1;
_DOMElement.removeChild(_a._DOMElement);
objj_msgSend(_windows,"removeObjectAtIndex:",_a._index);
for(;_b<_c;++_b){
_windows[_b]._index=_b;
_windows[_b]._DOMElement.style.zIndex=_b;
}
_a._isVisible=NO;
}
}),new objj_method(sel_getUid("insertWindow:atIndex:"),function(_d,_e,_f,_10){
with(_d){
var _11=objj_msgSend(_windows,"count"),_12=(_10==CPNotFound?_11:_10),_13=_f._isVisible;
if(_13){
_12=MIN(_12,_f._index);
objj_msgSend(_windows,"removeObjectAtIndex:",_f._index);
}else{
++_11;
}
if(_10==CPNotFound||_10>=_11){
objj_msgSend(_windows,"addObject:",_f);
}else{
objj_msgSend(_windows,"insertObject:atIndex:",_f,_10);
}
for(;_12<_11;++_12){
_windows[_12]._index=_12;
_windows[_12]._DOMElement.style.zIndex=_12;
}
if(_f._DOMElement.parentNode!==_DOMElement){
_DOMElement.appendChild(_f._DOMElement);
_f._isVisible=YES;
if(objj_msgSend(_f,"isFullBridge")){
objj_msgSend(_f,"setFrame:",objj_msgSend(_f._platformWindow,"usableContentFrame"));
}
}
}
}),new objj_method(sel_getUid("orderedWindows"),function(_14,_15){
with(_14){
return _windows;
}
})]);
p;22;CPPlatformWindow+DOM.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;12;CPPlatform.ji;18;CPPlatformWindow.jc;24053;
var _1="dblclick",_2="mousedown",_3="mouseup",_4="mousemove",_5="mousedrag",_6="keyup",_7="keydown",_8="keypress",_9="copy",_a="paste",_b="resize",_c="mousewheel",_d="touchstart",_e="touchmove",_f="touchend",_10="touchcancel";
var _11=[];
_11["INPUT"]=YES;
_11["SELECT"]=YES;
_11["TEXTAREA"]=YES;
_11["OPTION"]=YES;
var _12,_13,_14;
var _15={},_16={},_17={"8":1,"9":1,"16":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _18=17;
var _19=objj_msgSend(CPPlatform,"supportsDragAndDrop");
var _1a=objj_getClass("CPPlatformWindow");
if(!_1a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPlatformWindow\""));
}
var _1b=_1a.isa;
class_addMethods(_1a,[new objj_method(sel_getUid("_init"),function(_1c,_1d){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPObject")},"init");
if(_1c){
_DOMWindow=window;
_contentRect={origin:{x:0,y:0},size:{width:0,height:0}};
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1c,"registerDOMWindow");
objj_msgSend(_1c,"updateFromNativeContentRect");
_charCodes={};
}
return _1c;
}
}),new objj_method(sel_getUid("nativeContentRect"),function(_1e,_1f){
with(_1e){
if(!_DOMWindow){
return objj_msgSend(_1e,"contentRect");
}
if(_DOMWindow.cpFrame){
return _DOMWindow.cpFrame();
}
var _20={origin:{x:0,y:0},size:{width:0,height:0}};
if(window.screenTop){
_20.origin={x:_DOMWindow.screenLeft,y:_DOMWindow.screenTop};
}else{
if(window.screenX){
_20.origin={x:_DOMWindow.screenX,y:_DOMWindow.screenY};
}
}
if(_DOMWindow.innerWidth){
_20.size={width:_DOMWindow.innerWidth,height:_DOMWindow.innerHeight};
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_20.size={width:_DOMWindow.document.documentElement.clientWidth,height:_DOMWindow.document.documentElement.clientHeight};
}else{
_20.size={width:_DOMWindow.document.body.clientWidth,height:_DOMWindow.document.body.clientHeight};
}
}
return _20;
}
}),new objj_method(sel_getUid("updateNativeContentRect"),function(_21,_22){
with(_21){
if(!_DOMWindow){
return;
}
if(typeof _DOMWindow["cpSetFrame"]==="function"){
return _DOMWindow.cpSetFrame(objj_msgSend(_21,"contentRect"));
}
var _23=objj_msgSend(_21,"contentRect").origin,_24=objj_msgSend(_21,"nativeContentRect").origin;
if(_23.x!==_24.x||_23.y!==_24.y){
_DOMWindow.moveBy(_23.x-_24.x,_23.y-_24.y);
}
var _25=objj_msgSend(_21,"contentRect").size,_26=objj_msgSend(_21,"nativeContentRect").size;
if(_25.width!==_26.width||_25.height!==_26.height){
_DOMWindow.resizeBy(_25.width-_26.width,_25.height-_26.height);
}
}
}),new objj_method(sel_getUid("orderBack:"),function(_27,_28,_29){
with(_27){
if(_DOMWindow){
_DOMWindow.blur();
}
}
}),new objj_method(sel_getUid("registerDOMWindow"),function(_2a,_2b){
with(_2a){
var _2c=_DOMWindow.document;
_DOMBodyElement=_2c.getElementsByTagName("body")[0];
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.style["-khtml-user-select"]="none";
}
_DOMBodyElement.webkitTouchCallout="none";
_DOMFocusElement=_2c.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=_2c.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
objj_msgSend(_2a,"_addLayers");
var _2d=objj_msgSend(_2a,"class"),_2e=class_getMethodImplementation(_2d,sel_getUid("dragEvent:")),_2f=function(_30){
_2e(_2a,nil,_30);
},_31=sel_getUid("resizeEvent:"),_32=class_getMethodImplementation(_2d,_31),_33=function(_34){
_32(_2a,nil,_34);
},_35=sel_getUid("keyEvent:"),_36=class_getMethodImplementation(_2d,_35),_37=function(_38){
_36(_2a,nil,_38);
},_39=sel_getUid("mouseEvent:"),_3a=class_getMethodImplementation(_2d,_39),_3b=function(_3c){
_3a(_2a,nil,_3c);
},_3d=sel_getUid("scrollEvent:"),_3e=class_getMethodImplementation(_2d,_3d),_3f=function(_40){
_3e(_2a,nil,_40);
},_41=sel_getUid("touchEvent:"),_42=class_getMethodImplementation(_2d,_41),_43=function(_44){
_42(_2a,nil,_44);
};
if(_2c.addEventListener){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_2c.addEventListener("dragstart",_2f,NO);
_2c.addEventListener("drag",_2f,NO);
_2c.addEventListener("dragend",_2f,NO);
_2c.addEventListener("dragover",_2f,NO);
_2c.addEventListener("dragleave",_2f,NO);
_2c.addEventListener("drop",_2f,NO);
}
_2c.addEventListener("mouseup",_3b,NO);
_2c.addEventListener("mousedown",_3b,NO);
_2c.addEventListener("mousemove",_3b,NO);
_2c.addEventListener("keyup",_37,NO);
_2c.addEventListener("keydown",_37,NO);
_2c.addEventListener("keypress",_37,NO);
_2c.addEventListener("touchstart",_43,NO);
_2c.addEventListener("touchend",_43,NO);
_2c.addEventListener("touchmove",_43,NO);
_2c.addEventListener("touchcancel",_43,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.addEventListener("mousewheel",_3f,NO);
_DOMWindow.addEventListener("resize",_33,NO);
_DOMWindow.addEventListener("unload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
objj_msgSend(_2a,"_removeLayers");
_2c.removeEventListener("mouseup",_3b,NO);
_2c.removeEventListener("mousedown",_3b,NO);
_2c.removeEventListener("mousemove",_3b,NO);
_2c.removeEventListener("keyup",_37,NO);
_2c.removeEventListener("keydown",_37,NO);
_2c.removeEventListener("keypress",_37,NO);
_2c.removeEventListener("touchstart",_43,NO);
_2c.removeEventListener("touchend",_43,NO);
_2c.removeEventListener("touchmove",_43,NO);
_DOMWindow.removeEventListener("resize",_33,NO);
_DOMWindow.removeEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.removeEventListener("mousewheel",_3f,NO);
_2a._DOMWindow=nil;
},NO);
}else{
_2c.attachEvent("onmouseup",_3b);
_2c.attachEvent("onmousedown",_3b);
_2c.attachEvent("onmousemove",_3b);
_2c.attachEvent("ondblclick",_3b);
_2c.attachEvent("onkeyup",_37);
_2c.attachEvent("onkeydown",_37);
_2c.attachEvent("onkeypress",_37);
_DOMWindow.attachEvent("onresize",_33);
_DOMWindow.onmousewheel=_3f;
_2c.onmousewheel=_3f;
_2c.body.ondrag=function(){
return NO;
};
_2c.body.onselectstart=function(){
return _DOMWindow.event.srcElement===_DOMPasteboardElement;
};
_DOMWindow.attachEvent("onbeforeunload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
objj_msgSend(_2a,"_removeLayers");
_2c.removeEvent("onmouseup",_3b);
_2c.removeEvent("onmousedown",_3b);
_2c.removeEvent("onmousemove",_3b);
_2c.removeEvent("ondblclick",_3b);
_2c.removeEvent("onkeyup",_37);
_2c.removeEvent("onkeydown",_37);
_2c.removeEvent("onkeypress",_37);
_DOMWindow.removeEvent("onresize",_33);
_DOMWindow.onmousewheel=NULL;
_2c.onmousewheel=NULL;
_2c.body.ondrag=NULL;
_2c.body.onselectstart=NULL;
_2a._DOMWindow=nil;
},NO);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_45,_46,_47){
with(_45){
if(_DOMWindow){
return _DOMWindow.focus();
}
_DOMWindow=window.open("","_blank","menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left="+(_contentRect.origin.x)+",top="+(_contentRect.origin.y)+",width="+(_contentRect.size.width)+",height="+(_contentRect.size.height));
_DOMWindow.document.write("<html><head></head><body style = 'background-color:transparent;'></body></html>");
_DOMWindow.document.close();
if(!objj_msgSend(CPPlatform,"isBrowser")){
_DOMWindow.cpWindowNumber=objj_msgSend(_45._only,"windowNumber");
_DOMWindow.cpSetFrame(_contentRect);
_DOMWindow.cpSetLevel(_level);
_DOMWindow.cpSetHasShadow(_hasShadow);
_DOMWindow.cpSetShadowStyle(_shadowStyle);
}
objj_msgSend(_45,"registerDOMWindow");
}
}),new objj_method(sel_getUid("orderOut:"),function(_48,_49,_4a){
with(_48){
if(!_DOMWindow){
return;
}
_DOMWindow.close();
}
}),new objj_method(sel_getUid("dragEvent:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=_4d.type,_4f=objj_msgSend(CPDragServer,"sharedDragServer"),_50={x:_4d.clientX,y:_4d.clientY},_51=objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
objj_msgSend(_51,"_setDataTransfer:",_4d.dataTransfer);
if(_4d.type==="dragstart"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
objj_msgSend(_51,"_setPasteboard:",objj_msgSend(_4f,"draggingPasteboard"));
var _52=objj_msgSend(_4f,"draggedWindow"),_53=objj_msgSend(_52,"frame"),_54=_52._DOMElement;
_54.style.left=-(_53.size.width)+"px";
_54.style.top=-(_53.size.height)+"px";
document.getElementsByTagName("body")[0].appendChild(_54);
var _55=objj_msgSend(_4f,"draggingOffset");
_4d.dataTransfer.setDragImage(_54,_55.width,_55.height);
objj_msgSend(_4f,"draggingStartedInPlatformWindow:globalLocation:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="drag"){
objj_msgSend(_4f,"draggingSourceUpdatedWithGlobalLocation:",objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="dragover"||_4e==="dragleave"){
if(_4d.preventDefault){
_4d.preventDefault();
}
var _56="none",_57=objj_msgSend(_4f,"draggingUpdatedInPlatformWindow:location:",_4b,_50);
if(_57===CPDragOperationMove||_57===CPDragOperationGeneric||_57===CPDragOperationPrivate){
_56="move";
}else{
if(_57===CPDragOperationCopy){
_56="copy";
}else{
if(_57===CPDragOperationLink){
_56="link";
}
}
}
_4d.dataTransfer.dropEffect=_56;
}else{
if(_4e==="dragend"){
objj_msgSend(_4f,"draggingEndedInPlatformWindow:globalLocation:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
objj_msgSend(_4f,"performDragOperationInPlatformWindow:",_4b);
if(_4d.preventDefault){
_4d.preventDefault();
}
if(_4d.stopPropagation){
_4d.stopPropagation();
}
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyEvent:"),function(_58,_59,_5a){
with(_58){
var _5b,_5c=_5a.timeStamp?_5a.timeStamp:new Date(),_5d=(_5a.target||_5a.srcElement),_5e=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_5f=(_5a.shiftKey?CPShiftKeyMask:0)|(_5a.ctrlKey?CPControlKeyMask:0)|(_5a.altKey?CPAlternateKeyMask:0)|(_5a.metaKey?CPCommandKeyMask:0);
if(_11[_5d.tagName]&&_5d!=_DOMFocusElement&&_5d!=_DOMPasteboardElement){
return;
}
_14=!(_5f&(CPControlKeyMask|CPCommandKeyMask))||_16[String.fromCharCode(_5a.keyCode||_5a.charCode).toLowerCase()]||_15[_5a.keyCode];
var _60=NO,_61=NO,_62=nil;
switch(_5a.type){
case "keydown":
_keyCode=_5a.keyCode;
var _63=String.fromCharCode(_keyCode).toLowerCase();
_62=_5f&CPShiftKeyMask?_63.toUpperCase():_63;
if(_63=="v"&&(_5f&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_60=YES;
}else{
if((_63=="c"||_63=="x")&&(_5f&CPPlatformActionKeyMask)){
_61=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_17[_keyCode]&&(_keyCode==_18||!(_5f&CPControlKeyMask))){
return;
}
}
}
}
case "keypress":
if((_5a.target||_5a.srcElement)==_DOMPasteboardElement){
return;
}
var _64=_keyCode,_65=_5a.keyCode||_5a.charCode,_66=(_charCodes[_64]!=nil);
_charCodes[_64]=_65;
var _63=_62||String.fromCharCode(_65),_67=_63.toLowerCase();
if(!_62&&(_5f&CPCommandKeyMask)&&(_5f&CPShiftKeyMask)){
_63=_63.toUpperCase();
}
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_5f,_5c,_5e,nil,_63,_67,_66,_64);
if(_60){
_pasteboardKeyDownEvent=_5b;
window.setNativeTimeout(function(){
objj_msgSend(_58,"_checkPasteboardElement");
},0);
return;
}
break;
case "keyup":
var _64=_5a.keyCode,_65=_charCodes[_64];
_charCodes[_64]=nil;
var _63=String.fromCharCode(_65),_67=_63.toLowerCase();
if(!(_5f&CPShiftKeyMask)){
_63=_67;
}
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_5f,_5c,_5e,nil,_63,_67,NO,_64);
break;
}
if(_5b){
_5b._DOMEvent=_5a;
objj_msgSend(CPApp,"sendEvent:",_5b);
if(_61){
var _68=objj_msgSend(CPPasteboard,"generalPasteboard"),_69=objj_msgSend(_68,"types");
if(_69.length){
if(objj_msgSend(_69,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_68,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_68,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_58,"_clearPasteboardElement");
},0);
}
return;
}
}
if(_14){
_13(_5a,_58);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("scrollEvent:"),function(_6a,_6b,_6c){
with(_6a){
if(!_6c){
_6c=window.event;
}
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=0,y=0,_6d=_6c.target;
while(_6d.nodeType!==1){
_6d=_6d.parentNode;
}
if(_6d.offsetParent){
do{
x+=_6d.offsetLeft;
y+=_6d.offsetTop;
}while(_6d=_6d.offsetParent);
}
var _6e={x:(x+((_6c.clientX-8)/15)),y:(y+((_6c.clientY-8)/15))};
}else{
var _6e={x:_6c.clientX,y:_6c.clientY};
}
var _6f=0,_70=0,_71=0,_72=_6c.timeStamp?_6c.timeStamp:new Date(),_73=(_6c.shiftKey?CPShiftKeyMask:0)|(_6c.ctrlKey?CPControlKeyMask:0)|(_6c.altKey?CPAlternateKeyMask:0)|(_6c.metaKey?CPCommandKeyMask:0);
_14=YES;
var _74=objj_msgSend(_6a,"hitTest:",_6e);
if(!_74){
return;
}
var _71=objj_msgSend(_74,"windowNumber");
_6e=objj_msgSend(_74,"convertBridgeToBase:",_6e);
if(typeof _6c.wheelDeltaX!="undefined"){
_6f=_6c.wheelDeltaX/120;
_70=_6c.wheelDeltaY/120;
}else{
if(_6c.wheelDelta){
_70=_6c.wheelDelta/120;
}else{
if(_6c.detail){
_70=-_6c.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_6f=-_6f;
_70=-_70;
}
var _75=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_6e,_73,_72,_71,nil,-1,1,0);
_75._DOMEvent=_6c;
_75._deltaX=_6f;
_75._deltaY=_70;
objj_msgSend(CPApp,"sendEvent:",_75);
if(_14){
_13(_6c,_6a);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("resizeEvent:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"contentRect").size;
objj_msgSend(_76,"updateFromNativeContentRect");
var _7a=_windowLevels,_7b=_windowLayers,_7c=_7a.length;
while(_7c--){
var _7d=objj_msgSend(_7b,"objectForKey:",_7a[_7c])._windows,_7e=_7d.length;
while(_7e--){
objj_msgSend(_7d[_7e],"resizeWithOldPlatformWindowSize:",_79);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("touchEvent:"),function(_7f,_80,_81){
with(_7f){
if(_81.touches&&(_81.touches.length==1||(_81.touches.length==0&&_81.changedTouches.length==1))){
var _82={};
switch(_81.type){
case CPDOMEventTouchStart:
_82.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_82.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_82.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_82.type=CPDOMEventMouseUp;
break;
}
var _83=_81.touches.length?_81.touches[0]:_81.changedTouches[0];
_82.clientX=_83.clientX;
_82.clientY=_83.clientY;
_82.timestamp=_81.timestamp;
_82.target=_81.target;
_82.shiftKey=_82.ctrlKey=_82.altKey=_82.metaKey=false;
_82.preventDefault=function(){
if(_81.preventDefault){
_81.preventDefault();
}
};
_82.stopPropagation=function(){
if(_81.stopPropagation){
_81.stopPropagation();
}
};
objj_msgSend(_7f,"mouseEvent:",_82);
return;
}else{
if(_81.preventDefault){
_81.preventDefault();
}
if(_81.stopPropagation){
_81.stopPropagation();
}
}
}
}),new objj_method(sel_getUid("mouseEvent:"),function(_84,_85,_86){
with(_84){
var _87=_overriddenEventType||_86.type;
if(_87==="dblclick"){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_84,"mouseEvent:",_86);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_84,"mouseEvent:",_86);
_overriddenEventType=nil;
return;
}
var _88,_89={x:_86.clientX,y:_86.clientY},_8a=_86.timeStamp?_86.timeStamp:new Date(),_8b=(_86.target||_86.srcElement),_8c=0,_8d=(_86.shiftKey?CPShiftKeyMask:0)|(_86.ctrlKey?CPControlKeyMask:0)|(_86.altKey?CPAlternateKeyMask:0)|(_86.metaKey?CPCommandKeyMask:0);
_14=YES;
if(_mouseDownWindow){
_8c=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _8e=objj_msgSend(_84,"hitTest:",_89);
if((_86.type===CPDOMEventMouseDown)&&_8e){
_mouseDownWindow=_8e;
}
_8c=objj_msgSend(_8e,"windowNumber");
}
if(_8c){
_89=objj_msgSend(CPApp._windows[_8c],"convertPlatformWindowToBase:",_89);
}
if(_87==="mouseup"){
if(_mouseIsDown){
_88=_8f(_86,CPLeftMouseUp,_89,_8d,_8a,_8c,nil,-1,_12(_lastMouseUp,_8a,_89),0);
_mouseIsDown=NO;
_lastMouseUp=_88;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
}else{
if(_87==="mousedown"){
if(_11[_8b.tagName]&&_8b!=_DOMFocusElement){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","false");
_DOMBodyElement.style["-khtml-user-drag"]="none";
}
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_89,_8d,_8a,_8c,nil,-1,_12(_lastMouseDown,_8a,_89),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_89,_8d,_8a,_8c,nil,-1,_12(_lastMouseDown,_8a,_89),0));
return;
}else{
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","true");
_DOMBodyElement.style["-khtml-user-drag"]="element";
}
}
_88=_8f(_86,CPLeftMouseDown,_89,_8d,_8a,_8c,nil,-1,_12(_lastMouseDown,_8a,_89),0);
_mouseIsDown=YES;
_lastMouseDown=_88;
}else{
if(_DOMEventMode){
return;
}
_88=_8f(_86,_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_89,_8d,_8a,_8c,nil,-1,1,0);
}
}
var _90=objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"isDragging");
if(_88&&(!_90||!_19)){
_88._DOMEvent=_86;
objj_msgSend(CPApp,"sendEvent:",_88);
}
if(_14&&(!_19||_87!=="mousedown"&&!_90)){
_13(_86,_84);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_91,_92,_93,_94){
with(_91){
var _95=objj_msgSend(_windowLayers,"objectForKey:",_93);
if(!_95&&_94){
_95=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_93);
objj_msgSend(_windowLayers,"setObject:forKey:",_95,_93);
var low=0,_96=_windowLevels.length-1,_97;
while(low<=_96){
_97=FLOOR((low+_96)/2);
if(_windowLevels[_97]>_93){
_96=_97-1;
}else{
low=_97+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_93,_windowLevels[_97]>_93?_97:_97+1);
_95._DOMElement.style.zIndex=_93;
_DOMBodyElement.appendChild(_95._DOMElement);
}
return _95;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_98,_99,_9a,_9b,_9c){
with(_98){
var _9d=objj_msgSend(_98,"layerAtLevel:create:",objj_msgSend(_9b,"level"),_9a!=CPWindowOut);
if(_9a==CPWindowOut){
return objj_msgSend(_9d,"removeWindow:",_9b);
}
objj_msgSend(_9d,"insertWindow:atIndex:",_9b,(_9c?(_9a==CPWindowAbove?_9c._index+1:_9c._index):CPNotFound));
}
}),new objj_method(sel_getUid("_removeLayers"),function(_9e,_9f){
with(_9e){
var _a0=_windowLevels,_a1=_windowLayers,_a2=_a0.length;
while(_a2--){
var _a3=objj_msgSend(_a1,"objectForKey:",_a0[_a2]);
_DOMBodyElement.removeChild(_a3._DOMElement);
}
}
}),new objj_method(sel_getUid("_addLayers"),function(_a4,_a5){
with(_a4){
var _a6=_windowLevels,_a7=_windowLayers,_a8=_a6.length;
while(_a8--){
var _a9=objj_msgSend(_a7,"objectForKey:",_a6[_a8]);
_DOMBodyElement.appendChild(_a9._DOMElement);
}
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_aa,_ab,_ac,_ad){
with(_aa){
var _ae=_windowLevels,_af=_windowLayers,_b0=_ae.length;
while(_b0--){
if(_ae[_b0]>=CPDraggingWindowLevel){
continue;
}
var _b1=objj_msgSend(_af,"objectForKey:",_ae[_b0])._windows,_b2=_b1.length;
while(_b2--){
var _b3=_b1[_b2];
if(objj_msgSend(_b3,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_b3,"_dragHitTest:pasteboard:",_ac,_ad);
}
if(objj_msgSend(_b3,"containsPoint:",_ac)){
return objj_msgSend(_b3,"_dragHitTest:pasteboard:",_ac,_ad);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_b4,_b5,_b6){
with(_b4){
_14=!_b6;
}
}),new objj_method(sel_getUid("hitTest:"),function(_b7,_b8,_b9){
with(_b7){
if(_b7._only){
return _b7._only;
}
var _ba=_windowLevels,_bb=_windowLayers,_bc=_ba.length,_bd=nil;
while(_bc--&&!_bd){
var _be=objj_msgSend(_bb,"objectForKey:",_ba[_bc])._windows,_bf=_be.length;
while(_bf--&&!_bd){
var _c0=_be[_bf];
if(!_c0._ignoresMouseEvents&&objj_msgSend(_c0,"containsPoint:",_b9)){
_bd=_c0;
}
}
}
return _bd;
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_c1,_c2){
with(_c1){
var _c3=_DOMPasteboardElement.value;
if(objj_msgSend(_c3,"length")){
var _c4=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_c4,"_stateUID")!=_c3){
objj_msgSend(_c4,"declareTypes:owner:",[CPStringPboardType],_c1);
objj_msgSend(_c4,"setString:forType:",_c3,CPStringPboardType);
}
}
objj_msgSend(_c1,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_c5,_c6){
with(_c5){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
class_addMethods(_1b,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_c7,_c8,_c9){
with(_c7){
for(var i=_c9.length;i>0;i--){
_16[""+_c9[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_ca,_cb,_cc){
with(_ca){
_16[_cc.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_cd,_ce){
with(_cd){
_16={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_cf,_d0,_d1){
with(_cf){
for(var i=_d1.length;i>0;i--){
_15[_d1[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_d2,_d3,_d4){
with(_d2){
_15[_d4]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_d5,_d6){
with(_d5){
_15={};
}
})]);
var _d7=objj_msgSend(CPEvent,"class");
var _8f=function(_d8,_d9,_da,_db,_dc,_dd,_de,_df,_e0,_e1){
_d8.isa=_d7;
_d8._type=_d9;
_d8._location=_da;
_d8._modifierFlags=_db;
_d8._timestamp=_dc;
_d8._windowNumber=_dd;
_d8._window=nil;
_d8._context=_de;
_d8._eventNumber=_df;
_d8._clickCount=_e0;
_d8._pressure=_e1;
return _d8;
};
var _e2=5,_e3=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _12=function(_e4,_e5,_e6){
if(!_e4){
return 1;
}
var _e7=objj_msgSend(_e4,"locationInWindow");
return (_e5-objj_msgSend(_e4,"timestamp")<_e3&&ABS(_e7.x-_e6.x)<_e2&&ABS(_e7.y-_e6.y)<_e2)?objj_msgSend(_e4,"clickCount")+1:1;
};
var _13=function(_e8,_e9){
_e8.cancelBubble=true;
_e8.returnValue=false;
if(_e8.preventDefault){
_e8.preventDefault();
}
if(_e8.stopPropagation){
_e8.stopPropagation();
}
if(_e8.type===CPDOMEventMouseDown){
_e9._DOMFocusElement.focus();
_e9._DOMFocusElement.blur();
}
};
CPWindowObjectList=function(){
var _ea=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_eb=_ea._windowLevels,_ec=_ea._windowLayers,_ed=_eb.length,_ee=[];
while(_ed--){
var _ef=objj_msgSend(_ec,"objectForKey:",_eb[_ed])._windows,_f0=_ef.length;
while(_f0--){
_ee.push(_ef[_f0]);
}
}
return _ee;
};
CPWindowList=function(){
var _f1=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_f2=_f1._windowLevels,_f3=_f1._windowLayers,_f4=_f2.length,_f5=[];
while(_f4--){
var _f6=objj_msgSend(_f3,"objectForKey:",_f2[_f4])._windows,_f7=_f6.length;
while(_f7--){
_f5.push(objj_msgSend(_f6[_f7],"windowNumber"));
}
}
return _f5;
};
e;