//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetSplitter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   24/09/2010 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	C_BOOLEAN:C305($_bo_Recall)
	C_LONGINT:C283($_l_ActionSize; $_l_DescriptionLines; $_l_LabelLength; $_l_ObjectActionBottom; $_l_ObjectActionLeft; $_l_ObjectActionRight; $_l_ObjectActionTop; $_l_ObjectBottom; $_l_ObjectDetailsBottom; $_l_ObjectDetailsLeft; $_l_ObjectDetailsRight)
	C_LONGINT:C283($_l_ObjectDetailsTop; $_l_ObjectExpandButtonBottom; $_l_ObjectExpandButtonLeft; $_l_ObjectExpandButtonRight; $_l_ObjectExpandButtonTop; $_l_ObjectLeft; $_l_ObjectMaxHeight; $_l_ObjectMaxRIght; $_l_ObjectRight; $_l_ObjectSpacing; $_l_ObjectTop)
	C_LONGINT:C283($_l_Priority; $_l_RelationsBottom; $_l_RelationsSize; $_l_ResultBottom; $_l_StandardHeight; $_l_TotalObjectsHeight; $_l_WindowBottom; $_l_WindowLeft; $_l_WIndowMove; $_l_WindowRight; $_l_WindowTop)
	C_LONGINT:C283(Baddrelation; BEmailR; BLetterR; BSMSR; BTextExpand; BTextExpand2; SD_l_DescriptionSplitter)
	C_POINTER:C301($1)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; dl_DocumentT; dl_ResultT; SD_t_RelationAdd; SD_t_RelationCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetSplitter")
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
$_bo_Recall:=False:C215
If ($_l_WindowBottom>Screen height:C188)
	//move the window
	$_bo_Recall:=True:C214
	$_l_WIndowMove:=$_l_WindowBottom-Screen height:C188
	If ((($_l_WindowBottom-$_l_WIndowMove)-($_l_WindowTop-$_l_WIndowMove))>531)
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop-$_l_WIndowMove; $_l_WindowRight; $_l_WindowBottom-$_l_WIndowMove)
	Else 
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop-$_l_WIndowMove; $_l_WindowRight; ($_l_WindowTop-$_l_WIndowMove)+429)
	End if 
	
End if 
If ($_l_WindowRight>Screen width:C187)
	$_bo_Recall:=True:C214
	$_l_WIndowMove:=$_l_WindowRight-Screen width:C187
	If (($_l_WindowRight-$_l_WIndowMove)-($_l_WindowLeft-$_l_WIndowMove)>586)
		SET WINDOW RECT:C444($_l_WindowLeft-$_l_WIndowMove; $_l_WindowTop; $_l_WindowRight-$_l_WIndowMove; $_l_WindowBottom)
	Else 
		SET WINDOW RECT:C444($_l_WindowLeft-$_l_WIndowMove; $_l_WindowTop; ($_l_WindowLeft-$_l_WIndowMove)+560; $_l_WindowBottom)
	End if 
	
End if 
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
If ($_l_WindowTop<0)
	$_bo_Recall:=True:C214
	$_l_WIndowMove:=Abs:C99($_l_WindowTop)
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop+$_l_WIndowMove; $_l_WindowRight; $_l_WindowBottom+$_l_WIndowMove)
End if 
If ($_l_WindowLeft<0)
	$_bo_Recall:=True:C214
	$_l_WIndowMove:=Abs:C99($_l_WindowLeft)
	SET WINDOW RECT:C444($_l_WindowLeft+$_l_WIndowMove; $_l_WindowTop; $_l_WindowRight+$_l_WIndowMove; $_l_WindowBottom)
End if 
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)

$_l_ObjectMaxHeight:=($_l_WindowBottom-$_l_WindowTop)-35
$_l_ObjectMaxRIght:=($_l_WindowRight-$_l_WindowLeft)
OBJECT GET COORDINATES:C663($1->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
Case of 
	: (Count parameters:C259>=2)
		$_l_Priority:=$2
		
	: ([DIARY:12]Done:14=True:C214)
		//priority is result
		$_l_DescriptionLines:=Length:C16([DIARY:12]Result_Description:12)/80
		If (Length:C16([DIARY:12]Result_Description:12)>Length:C16([DIARY:12]Action_Details:10))
			$_l_Priority:=2
		Else 
			$_l_Priority:=1
		End if 
	: ([DIARY:12]Done:14=False:C215)
		$_l_Priority:=1
	Else 
		$_l_Priority:=0
		OBJECT GET COORDINATES:C663([DIARY:12]Action_Details:10; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Description:12; $_l_ObjectActionLeft; $_l_ObjectActionTop; $_l_ObjectActionRight; $_l_ObjectActionBottom)
		Case of 
			: (($_l_ObjectActionBottom-$_l_ObjectActionTop)>($_l_ObjectDetailsBottom-$_l_ObjectDetailsTop))
				$_l_Priority:=2
			Else 
				$_l_Priority:=1
		End case 
		
End case 

Case of 
	: ($_l_Priority=1)
		$_l_ActionSize:=50
		$_l_LabelLength:=80
		//$_l_ObjectSpacing:=220
		$_l_ObjectSpacing:=5
		$_l_StandardHeight:=13
		$_l_RelationsSize:=Size of array:C274(SD_at_Arrayrelations)*12
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		
		Case of 
			: ($_l_RelationsSize<$_l_StandardHeight)
				$_l_RelationsSize:=$_l_StandardHeight
			: ($_l_RelationsSize>60)
				$_l_RelationsSize:=60
		End case 
		$_l_TotalObjectsHeight:=($_l_StandardHeight*6)+($_l_ObjectSpacing*6)+$_l_RelationsSize+50
		
		
		OBJECT GET COORDINATES:C663([DIARY:12]Action_Code:9; $_l_ObjectActionLeft; $_l_ObjectActionTop; $_l_ObjectActionRight; $_l_ObjectActionBottom)
		OBJECT GET COORDINATES:C663([DIARY:12]Action_Details:10; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		$_l_ObjectActionBottom:=(($_l_WindowBottom-35)-$_l_TotalObjectsHeight)
		OBJECT MOVE:C664([DIARY:12]Action_Details:10; $_l_ObjectDetailsLeft; ($_l_ObjectActionBottom+$_l_ObjectSpacing); $_l_ObjectDetailsRight; $_l_ObjectActionBottom-$_l_TotalObjectsHeight; *)
		OBJECT MOVE:C664(BTextExpand; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight+2; *)
		OBJECT MOVE:C664(*; "oDescriptionLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		
		
		OBJECT GET COORDINATES:C663(SD_l_DescriptionSplitter; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		//````
		OBJECT MOVE:C664(SD_l_DescriptionSplitter; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom-$_l_TotalObjectsHeight+1; $_l_ObjectDetailsRight; $_l_ObjectActionBottom-$_l_TotalObjectsHeight+1; *)
		
		//  MOVE OBJECT([DIARY]Action Desc;$_l_ObjectDetailsLeft;$_l_ObjectActionBottom+$_l_ObjectSpacing;$_l_ObjectDetailsRight;$_l_ObjectActionBottom+50;*
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom-$_l_TotalObjectsHeight+1
		//SD_l_DescriptionSplitter
		// GET OBJECT RECT(SD_l_DescriptionSplitter;$_l_ObjectDetailsLeft;$_l_ObjectDetailsTop;$_l_ObjectDetailsRight;$_l_ObjectDetailsBottom)
		//````
		//MOVE OBJECT(SD_l_DescriptionSplitter;$_l_ObjectDetailsLeft;$_l_ObjectActionBottom;$_l_ObjectDetailsRight;$_l_ObjectActionBottom+($_l_ObjectDetailsBottom-$_l_ButtonNumber
		//`````````
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom
		OBJECT GET COORDINATES:C663([DIARY:12]Document_Code:15; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Document_Code:15; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oDocumentLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(BLetterR; $_l_ObjectDetailsRight+2+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+22+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(BEmailR; $_l_ObjectDetailsRight+23+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+43+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(BSMSR; $_l_ObjectDetailsRight+44+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+64+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "PICT_SnailMailR"; $_l_ObjectDetailsRight+2+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+22+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "PICT_EmailR"; $_l_ObjectDetailsRight+23+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+43+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "PICT_SMSR"; $_l_ObjectDetailsRight+44+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; ($_l_ObjectDetailsRight+64+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(dl_DocumentT; $_l_ObjectDetailsRight+66+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+64+140; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		//``````
		
		$_l_ObjectActionBottom:=($_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing)
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; ($_l_ObjectActionBottom+$_l_ObjectSpacing); $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(*; "oResCodeLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(SD_at_ResultNames; $_l_ObjectDetailsRight+5; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+13+5; $_l_ObjectActionBottom+12+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oDiaryResultPicture"; $_l_ObjectDetailsRight+5; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+13+5; $_l_ObjectActionBottom+12+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(dl_ResultT; $_l_ObjectDetailsRight+5+13+5; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+2+$_l_StandardHeight+174; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		$_l_ObjectActionBottom:=($_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing)
		$_l_RelationsSize:=Size of array:C274(SD_at_Arrayrelations)*13
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		
		Case of 
			: ($_l_RelationsSize<$_l_StandardHeight)
				$_l_RelationsSize:=$_l_StandardHeight
			: ($_l_RelationsSize>60)
				$_l_RelationsSize:=60
		End case 
		$_l_TotalObjectsHeight:=($_l_StandardHeight*4)+($_l_ObjectSpacing*4)+$_l_RelationsSize
		
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Description:12; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		$_l_ResultBottom:=(($_l_WindowBottom-35)-$_l_TotalObjectsHeight)
		OBJECT MOVE:C664([DIARY:12]Result_Description:12; $_l_ObjectDetailsLeft; ($_l_ObjectActionBottom+$_l_ObjectSpacing); $_l_ObjectDetailsRight; $_l_ResultBottom-$_l_TotalObjectsHeight; *)
		OBJECT MOVE:C664(*; "oResdescLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(BTextExpand2; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight+2; *)
		$_l_ObjectActionBottom:=$_l_ResultBottom-$_l_TotalObjectsHeight
		OBJECT GET COORDINATES:C663([DIARY:12]Script_Code:29; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Script_Code:29; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oScriptLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		//``
		OBJECT GET COORDINATES:C663([DIARY:12]Units:20; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Units:20; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oUnitsLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing
		OBJECT GET COORDINATES:C663([DIARY:12]Status:30; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Status:30; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oStatusLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		//``
		OBJECT GET COORDINATES:C663([DIARY:12]Value:16; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Value:16; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oValueLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing
		
		OBJECT GET COORDINATES:C663(SD_at_Arrayrelations; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664(SD_at_Arrayrelations; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_RelationsSize+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oRelationLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		$_l_RelationsBottom:=$_l_ObjectActionBottom+$_l_RelationsSize+$_l_ObjectSpacing
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing
		OBJECT MOVE:C664(Baddrelation; $_l_ObjectDetailsLeft-(12+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+13; *)
		OBJECT MOVE:C664(*; "oRelations"; $_l_ObjectDetailsLeft-(12+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+13; *)
		$_l_ObjectActionBottom:=$_l_RelationsBottom
		// SD_t_RelationAdd
		OBJECT MOVE:C664(SD_t_RelationAdd; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft+100; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(SD_at_RelationTypes; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing+$_l_StandardHeight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		//Pic_Relation
		OBJECT MOVE:C664(*; "Pic_Relation"; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing+13; $_l_ObjectActionBottom+12+$_l_ObjectSpacing; *)
		//SD_t_RelationCode
		OBJECT MOVE:C664(SD_t_RelationCode; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing+$_l_StandardHeight+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oDiaryCodeLabel"; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing+29; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664([DIARY:12]Diary_Code:3; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing+29+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing+29+$_l_ObjectSpacing+66; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
	: ($_l_Priority=2) | ($_l_Priority=1)
		$_l_ActionSize:=50
		$_l_LabelLength:=80
		$_l_ObjectSpacing:=220
		$_l_ObjectSpacing:=5
		$_l_StandardHeight:=13
		OBJECT GET COORDINATES:C663([DIARY:12]Action_Code:9; $_l_ObjectActionLeft; $_l_ObjectActionTop; $_l_ObjectActionRight; $_l_ObjectActionBottom)
		OBJECT GET COORDINATES:C663([DIARY:12]Action_Details:10; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		
		OBJECT MOVE:C664([DIARY:12]Action_Details:10; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+50; *)
		OBJECT GET COORDINATES:C663(SD_l_DescriptionSplitter; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		//````
		OBJECT MOVE:C664(SD_l_DescriptionSplitter; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+50+1; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+50+1; *)
		OBJECT GET COORDINATES:C663(BTextExpand; $_l_ObjectExpandButtonLeft; $_l_ObjectExpandButtonTop; $_l_ObjectExpandButtonRight; $_l_ObjectExpandButtonBottom)
		OBJECT MOVE:C664(BTextExpand; $_l_ObjectExpandButtonLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectExpandButtonRight; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight+2; *)
		OBJECT MOVE:C664(*; "oDescriptionLabel"; $_l_ObjectExpandButtonLeft; $_l_ObjectActionBottom+5; $_l_ObjectExpandButtonRight; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+55
		//SD_l_DescriptionSplitter
		//GET OBJECT RECT(SD_l_DescriptionSplitter;$_l_ObjectDetailsLeft;$_l_ObjectDetailsTop;$_l_ObjectDetailsRight;$_l_ObjectDetailsBottom)
		//````
		//MOVE OBJECT(SD_l_DescriptionSplitter;$_l_ObjectDetailsLeft;$_l_ObjectActionBottom;$_l_ObjectDetailsRight;$_l_ObjectActionBottom+($_l_ObjectDetailsBottom-$_l_ButtonNumber
		//`````````
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+5
		OBJECT GET COORDINATES:C663([DIARY:12]Document_Code:15; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Document_Code:15; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oDocumentLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(BLetterR; $_l_ObjectDetailsRight+2+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+22+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(BEmailR; $_l_ObjectDetailsRight+23+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+43+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(BSMSR; $_l_ObjectDetailsRight+44+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+64+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "PICT_SnailMailR"; $_l_ObjectDetailsRight+2+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+22+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "PICT_EmailR"; $_l_ObjectDetailsRight+23+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+43+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		
		OBJECT MOVE:C664(*; "PICT_SMSR"; $_l_ObjectDetailsRight+44+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; ($_l_ObjectDetailsRight+64+$_l_ObjectSpacing+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(dl_DocumentT; $_l_ObjectDetailsRight+86; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+64+140; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		//``````
		$_l_ObjectActionBottom:=($_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing)
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; ($_l_ObjectActionBottom+$_l_ObjectSpacing); $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(*; "oResCodeLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(SD_at_ResultNames; $_l_ObjectDetailsRight+5; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+13+5; $_l_ObjectActionBottom+12+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oDiaryResultPicture"; $_l_ObjectDetailsRight+5; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+13+5; $_l_ObjectActionBottom+12+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(dl_ResultT; $_l_ObjectDetailsRight+5+13+5; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight+2+$_l_StandardHeight+174; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		$_l_ObjectActionBottom:=($_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing)
		$_l_RelationsSize:=Size of array:C274(SD_at_Arrayrelations)*13
		
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Code:11; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		
		Case of 
			: ($_l_RelationsSize<$_l_StandardHeight)
				$_l_RelationsSize:=$_l_StandardHeight
			: ($_l_RelationsSize>60)
				$_l_RelationsSize:=60
		End case 
		If ($_l_RelationsSize=$_l_StandardHeight)
			$_l_TotalObjectsHeight:=($_l_StandardHeight*4)+($_l_ObjectSpacing*4)+$_l_RelationsSize
		Else 
			$_l_TotalObjectsHeight:=($_l_StandardHeight*3)+($_l_ObjectSpacing*3)+$_l_RelationsSize
		End if 
		
		
		
		OBJECT GET COORDINATES:C663([DIARY:12]Result_Description:12; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		$_l_ResultBottom:=(($_l_WindowBottom)-$_l_TotalObjectsHeight)
		OBJECT MOVE:C664([DIARY:12]Result_Description:12; $_l_ObjectDetailsLeft; ($_l_ObjectActionBottom+$_l_ObjectSpacing); $_l_ObjectDetailsRight; $_l_ResultBottom-$_l_TotalObjectsHeight; *)
		OBJECT MOVE:C664(*; "oResdescLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		OBJECT MOVE:C664(BTextExpand2; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight+2; *)
		$_l_ObjectActionBottom:=$_l_ResultBottom-$_l_TotalObjectsHeight
		OBJECT GET COORDINATES:C663([DIARY:12]Script_Code:29; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Script_Code:29; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oScriptLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		//``
		OBJECT GET COORDINATES:C663([DIARY:12]Units:20; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Units:20; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oUnitsLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing
		OBJECT GET COORDINATES:C663([DIARY:12]Status:30; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Status:30; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oStatusLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		//``
		OBJECT GET COORDINATES:C663([DIARY:12]Value:16; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664([DIARY:12]Value:16; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oValueLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; ($_l_WindowBottom+$_l_WindowTop)-$_l_ObjectSpacing; *)
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing
		
		OBJECT GET COORDINATES:C663(SD_at_Arrayrelations; $_l_ObjectDetailsLeft; $_l_ObjectDetailsTop; $_l_ObjectDetailsRight; $_l_ObjectDetailsBottom)
		OBJECT MOVE:C664(SD_at_Arrayrelations; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_RelationsSize+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oRelationLabel"; $_l_ObjectDetailsLeft-($_l_LabelLength+$_l_ObjectSpacing+$_l_ObjectSpacing); $_l_ObjectActionBottom+5; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing+$_l_StandardHeight; *)
		$_l_RelationsBottom:=$_l_ObjectActionBottom+$_l_RelationsSize+$_l_ObjectSpacing
		$_l_ObjectActionBottom:=$_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing
		OBJECT MOVE:C664(Baddrelation; $_l_ObjectDetailsLeft-(12+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+13; *)
		OBJECT MOVE:C664(*; "oRelations"; $_l_ObjectDetailsLeft-(12+$_l_ObjectSpacing); $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft-$_l_ObjectSpacing; $_l_ObjectActionBottom+13; *)
		$_l_ObjectActionBottom:=$_l_RelationsBottom
		// SD_t_RelationAdd
		OBJECT MOVE:C664(SD_t_RelationAdd; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft+100; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(SD_at_RelationTypes; $_l_ObjectDetailsLeft; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing+$_l_StandardHeight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		//Pic_Relation
		OBJECT MOVE:C664(*; "Pic_Relation"; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing+13; $_l_ObjectActionBottom+12+$_l_ObjectSpacing; *)
		//SD_t_RelationCode
		OBJECT MOVE:C664(SD_t_RelationCode; $_l_ObjectDetailsLeft+100+$_l_ObjectSpacing+$_l_StandardHeight+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; $_l_ObjectDetailsRight; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664(*; "oDiaryCodeLabel"; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing+29; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		OBJECT MOVE:C664([DIARY:12]Diary_Code:3; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing+29+$_l_ObjectSpacing; $_l_ObjectActionBottom+$_l_ObjectSpacing; ($_l_ObjectDetailsRight-100)+$_l_ObjectSpacing+29+$_l_ObjectSpacing+66; $_l_ObjectActionBottom+$_l_StandardHeight+$_l_ObjectSpacing; *)
		
End case 
OBJECT GET COORDINATES:C663([DIARY:12]Result_Description:12; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
WS_KeepFocus
ERR_MethodTrackerReturn("SD_SetSplitter"; $_t_oldMethodName)
