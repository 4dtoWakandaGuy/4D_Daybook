//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_CalPic
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CalenderPics)
	C_PICTURE:C286($0)
	C_TEXT:C284($_t_MonthName; $_t_oldMethodName; $1; $2; vCalMth; vCalYr)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CalPic")

//Diary_CalPic
If (Count parameters:C259=0)
	If (<>SYS_bo_CalenderPics=True:C214)
		$_t_MonthName:=MonthName(Date_FromStrs("1"; vCalMth; vCalYr))
		QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_MonthName)
	End if 
Else 
	
	If (<>SYS_bo_CalenderPics=True:C214)
		$_t_MonthName:=MonthName(Date_FromStrs("1"; $1; $2))
		QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_MonthName)
		$0:=[PICTURES:85]Picture:3
		UNLOAD RECORD:C212([PICTURES:85])
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Diary_CalPic"; $_t_oldMethodName)