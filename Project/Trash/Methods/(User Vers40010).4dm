//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers40010
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers40010")
[USER:15]Module Icons:79:=False:C215
//[USER]Name:=""`resets the User Name in a new data file!
If ((DB_GetModuleSettingByNUM(1))=5)
	[USER:15]Repeat Delay:74:=15
	[USER:15]Waiting Proc:194:=2
	[USER:15]View Lists:150:=False:C215
	[USER:15]CopyPrevKpDate:170:=False:C215
	[USER:15]Palette Delay:80:=0
	[USER:15]Prod Func Ord:122:=False:C215
	[USER:15]Batch Entry:114:=False:C215
	[USER:15]Entry Defaults:106:=True:C214
	[USER:15]Find Defaults:107:=True:C214
	[USER:15]Find My Data:155:=False:C215
	[USER:15]Access Type:195:=False:C215
	[USER:15]Def Callback:84:=False:C215
	[USER:15]Capitalisation:67:=0
	[USER:15]Capitalise Town:77:=False:C215
	[USER:15]Comp User Chk:124:=False:C215
	[USER:15]Def Sales:83:=True:C214
	[USER:15]Def Source:78:=False:C215
	[USER:15]Sales Ordering:82:=False:C215
	[USER:15]Stand Marg Act:130:=False:C215
	[USER:15]Enquirer Status:196:=""
	[USER:15]ContEnq Status:197:=""
	[USER:15]Client Status:85:=""
	[USER:15]ContCl Status:86:=""
	[USER:15]Gen Co Price Gr:157:=""
End if 
ERR_MethodTrackerReturn("User Vers40010"; $_t_oldMethodName)