//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_TitleMod
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
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Remove)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_TitleMod")
//Diary_TitleMod
$_l_Remove:=0
If (vTitle="@'s Diary")
	$_l_Remove:=8
Else 
	If (vTitle="@s Diary")
		$_l_Remove:=7
	Else 
		If (vTitle="@ Diary")
			$_l_Remove:=6
		End if 
	End if 
End if 
If ($_l_Remove>0)
	vTitle:=Substring:C12(vTitle; 1; Length:C16(vTitle)-$_l_Remove)
End if 
$_d_Date:=Diary_SelDate(vTitle; True:C214)
If ($_d_Date>!00-00-00!)
	If ([DIARY:12]Done:14=True:C214)
		[DIARY:12]Date_Done_From:5:=$_d_Date
	Else 
		[DIARY:12]Date_Do_From:4:=$_d_Date
	End if 
Else 
	Diary_Title
End if 
ERR_MethodTrackerReturn("Diary_TitleMod"; $_t_oldMethodName)