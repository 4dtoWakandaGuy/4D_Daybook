If (False:C215)
	//object Name: [USER]Qualities_Pallette.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_include;0)
	C_BOOLEAN:C305($_bo_Setting)
	C_LONGINT:C283($_l_FormEvent; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Variable14"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		
		If (Size of array:C274(QV_abo_include)>0)
			$_bo_Setting:=Not:C34(QV_abo_include{1}=True:C214)
			For ($_l_Index; 1; Size of array:C274(QV_abo_include))
				
				QV_abo_include{$_l_Index}:=$_bo_Setting
			End for 
			//AL_UpdateArrays (QV_l_Powerview;-2)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Variable14"; $_t_oldMethodName)
