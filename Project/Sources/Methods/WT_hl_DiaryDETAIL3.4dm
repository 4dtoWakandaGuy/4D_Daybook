//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_hl_DiaryDETAIL3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_RelationMenuNums;0)
	//Array TEXT(SD_at_RelationTypes;0)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	C_LONGINT:C283(SD_l_RelationAdd)
	C_TEXT:C284($_t_oldMethodName; DOC_t_ActionName; dl_DocumentT; SD_t_JobName; SD_t_DiaryPersonName; dl_ProductT; dl_ResultT; SD_t_RelationAdd; SD_t_RelationCode; SD_t_PriorityName; vCompName)
	C_TEXT:C284(VcompTel; vContName; VcontTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_hl_DiaryDETAIL3")
//Diary_InB22
//MODNG 67-2
[DIARY:12]Company_Code:1:=""
vCompName:=""
VcontTel:=""
VcompTel:=""
[DIARY:12]Contact_Code:2:=""
vContName:=""

[DIARY:12]Person:8:=""
SD_t_DiaryPersonName:=""

[DIARY:12]Action_Code:9:=""
DOC_t_ActionName:=""
[DIARY:12]Action_Details:10:=""

[DIARY:12]Result_Code:11:=""
dl_ResultT:=""
[DIARY:12]Result_Description:12:=""
[DIARY:12]Document_Code:15:=""
dl_DocumentT:=""
[DIARY:12]Job_Code:19:=""
SD_t_JobName:=""
[DIARY:12]Stage_Code:21:=""
[DIARY:12]Product_Code:13:=""
dl_ProductT:=""
[DIARY:12]Date_Do_From:4:=!00-00-00!
[DIARY:12]Time_Do_From:6:=?00:00:00?
[DIARY:12]Date_Do_To:33:=!00-00-00!
[DIARY:12]Time_Do_To:35:=?00:00:00?
SD_t_PriorityName:=""
SD_t_RelationAdd:=""
SD_t_RelationCode:=""
SD_l_RelationAdd:=0
OBJECT SET VISIBLE:C603(SD_t_RelationAdd; False:C215)
OBJECT SET VISIBLE:C603(*; "Pic_Relation"; False:C215)
OBJECT SET VISIBLE:C603(SD_t_RelationCode; False:C215)
OBJECT SET VISIBLE:C603(SD_at_RelationTypes; False:C215)
ARRAY TEXT:C222(SD_at_Arrayrelations; 0)
ARRAY LONGINT:C221(SD_al_RelationMenuNums; 0)
ERR_MethodTrackerReturn("WT_hl_DiaryDETAIL3"; $_t_oldMethodName)