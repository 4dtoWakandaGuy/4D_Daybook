//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetViews_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_AddAction;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_OpenDocument;0)
	//ARRAY TEXT(SD_at_PriorityNM2;0)
	C_LONGINT:C283($_l_LabelSpacing; $_l_MinWIdth; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectTop2; $_l_StartPosition; $_l_StartPositionOLD; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; bhl_GOTOTODAY; Bopenselection; SD_l_IncludeCompleted; SD_l_IncTodo; xFindNext; xOK)
	C_TEXT:C284($_t_oldMethodName; SD_t_LabelFind; SD_t_LabelList; SD_t_LabelNew; SD_t_LabelOpen; SD_t_LabelPerson; SD_t_LabelPriority; SD_t_LabelToday; SD_t_LabelTodo; SD_t_TodoText; vSrchRequest)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetViews_2")
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
SD_t_LabelNew:="New"  //1
SD_t_LabelOpen:="Open"
SD_t_LabelList:="List"
SD_t_LabelFind:="Find"
SD_t_LabelPerson:="Diary Owner"
SD_t_LabelPriority:="Priority"
Case of 
	: (SD_l_IncludeCompleted=1)
		SD_t_LabelTodo:="To Do"  // CONTEXTUAL
		$_l_LabelSpacing:=55
	Else 
		SD_t_LabelTodo:="All Items"  // CONTEXTUAL
		$_l_LabelSpacing:=35
End case 

SD_t_LabelToday:="Today"

$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
$_l_MinWIdth:=582
$_l_StartPosition:=20  //was 10 ` Rollo 26/8/2004

Case of 
	: ($_l_WindowWidth<=($_l_MinWIdth+30))
		
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
	: ($_l_WindowWidth<=($_l_MinWIdth+60))
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
	: ($_l_WindowWidth<=($_l_MinWIdth+90))
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelOpen; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom; *)
		
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
	: ($_l_WindowWidth<=($_l_MinWIdth+120))
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelOpen; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelList; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5)
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		
	: ($_l_WindowWidth<=($_l_MinWIdth+150))
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelOpen; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelList; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5)
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelFind; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5); $_l_ObjectBottom-5; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5)
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
	: ($_l_WindowWidth<=($_l_MinWIdth+180))
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelOpen; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelList; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5)
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelFind; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5); $_l_ObjectBottom-5; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5)
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelPerson; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+40+(Length:C16(SD_t_LabelPerson)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+40+(Length:C16(SD_t_LabelPerson)*5); $_l_ObjectBottom; *)
		
		$_l_StartPosition:=$_l_StartPosition+45+(Length:C16(SD_t_LabelPerson)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
	: ($_l_WindowWidth<=($_l_MinWIdth+220))
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; False:C215)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelOpen; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelList; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5)
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelFind; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5); $_l_ObjectBottom-5; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5)
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelPerson; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+40+(Length:C16(SD_t_LabelPerson)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+40+(Length:C16(SD_t_LabelPerson)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+45+(Length:C16(SD_t_LabelPerson)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelPriority; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+50+(Length:C16(SD_t_LabelPriority)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+50+(Length:C16(SD_t_LabelPriority)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+55+(Length:C16(SD_t_LabelPriority)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
	Else 
		
		OBJECT SET VISIBLE:C603(SD_t_LabelNew; True:C214)
		
		OBJECT SET VISIBLE:C603(SD_t_LabelOpen; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelList; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelFind; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPerson; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelPriority; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelTodo; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_LabelToday; True:C214)
		OBJECT GET COORDINATES:C663(*; "DiaryPic_NewObject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "DiaryPic_NewObject"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelNew; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_AddAction; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelNew)*5)
		OBJECT MOVE:C664(*; "DiaryPic_OpenDoc"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelOpen; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_OpenDocument; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelOpen)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_OpenList"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelList; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(Bopenselection; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelList)*5)
		OBJECT GET COORDINATES:C663(vSrchRequest; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		OBJECT MOVE:C664(vSrchRequest; $_l_StartPosition; $_l_ObjectTop2; $_l_StartPosition+60; $_l_ObjectBottom2; *)
		$_l_StartPosition:=$_l_StartPosition+63
		OBJECT MOVE:C664(*; "Picture_Search"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xOK; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+25
		OBJECT MOVE:C664(*; "PictureSearchPlus"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(xFindNext; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelFind; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5); $_l_ObjectBottom-5; *)
		$_l_StartPosition:=$_l_StartPosition+30+(Length:C16(SD_t_LabelFind)*5)
		OBJECT MOVE:C664(*; "DiaryPic_openPerson"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelPerson; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+40+(Length:C16(SD_t_LabelPerson)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_DiaryOwners; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+40+(Length:C16(SD_t_LabelPerson)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+45+(Length:C16(SD_t_LabelPerson)*5)
		OBJECT MOVE:C664(*; "DiaryPic_FilterPriority"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelPriority; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+50+(Length:C16(SD_t_LabelPriority)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_at_PriorityNM2; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+50+(Length:C16(SD_t_LabelPriority)*5); $_l_ObjectBottom; *)
		$_l_StartPosition:=$_l_StartPosition+55+(Length:C16(SD_t_LabelPriority)*5)
		
		OBJECT MOVE:C664(*; "DiaryPic_includecompleted"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelTodo; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+$_l_LabelSpacing+(Length:C16(SD_t_LabelTodo)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(SD_l_IncTodo; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+$_l_LabelSpacing+(Length:C16(SD_t_LabelTodo)*5); $_l_ObjectBottom; *)
		
		$_l_StartPosition:=$_l_StartPosition+$_l_LabelSpacing+5+(Length:C16(SD_t_LabelTodo)*5)
		
		
		OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_StartPosition; $_l_ObjectTop; $_l_StartPosition+20; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(*; "SD_vDayNo"; $_l_StartPosition+3; $_l_ObjectTop+4; $_l_StartPosition+3+13; $_l_ObjectTop+4+12; *)  //Rollo 26/8/2004
		$_l_StartPositionOLD:=$_l_StartPosition
		$_l_StartPosition:=$_l_StartPosition+22
		OBJECT MOVE:C664(SD_t_LabelToday; $_l_StartPosition; $_l_ObjectTop+3; $_l_StartPosition+60+(Length:C16(SD_t_LabelToday)*5); $_l_ObjectBottom-5; *)
		OBJECT MOVE:C664(bhl_GOTOTODAY; $_l_StartPositionOLD; $_l_ObjectTop; $_l_StartPosition+60+(Length:C16(SD_t_LabelToday)*5); $_l_ObjectBottom; *)
		
End case 
Case of 
	: (SD_l_IncludeCompleted=1)
		SD_t_TodoText:=" -  All Items  "
	Else 
		SD_t_TodoText:=" -  To Do  "
End case 
ERR_MethodTrackerReturn("SD_SetViews_2"; $_t_oldMethodName)