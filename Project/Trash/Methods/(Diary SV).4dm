//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary SV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:14:48If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SYS_bo_StatsView)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary SV")
//Diary SV
vFilePtr:=->[DIARY:12]
SYS_bo_StatsView:=True:C214
vSVCF:="Diary_SVCF"
StatsView_ArFiS("Diary/12/Diary_Sel/Companies/2/Comp_Sel/Contacts/1/Cont_Sel/"+"Sales Orders/24/Orders_Sel/"+"Service Centre/20/Calls_Sel/Jobs/26/Jobs_Sel/")
StatsView_ArF1S("1.2/2.1.2,5/8.11/9.13/11.14/13.9/14/15.7/17/18.41/19.26/21.47/23.11/"+"25/26/27/29/30.4/")
ERR_MethodTrackerReturn("Diary SV"; $_t_oldMethodName)