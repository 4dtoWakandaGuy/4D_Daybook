//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      VER_ONEXIT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: VER_ONEXIT
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(4096\2)
	//C_UNKNOWN(bExternalRelease)
	//C_UNKNOWN(bIncrementBuildNo)
	//C_UNKNOWN(bInternalRelease)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(LIC_at_ReleaseTypes;0)
	C_BLOB:C604(VER_blb_ResourceBlob)
	C_BOOLEAN:C305($_bo_EditMade; WIN_bo_TrackerInited; $_bo_EditMade; VER_bo_BuildChanged; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_offset; $_l_VersionNumber; $_l_WindowReferenceRow; $_l_WindowRow; bExternalRelease; bIncrementBuildNo; bInternalRelease; VER_l_OLDDevelopmentStage; WIN_l_CurrentWinRef; $_l_offset; $_l_VersionNumber)
	C_LONGINT:C283($_l_WindowReferenceRow; VER_l_CustomerBuild; VER_l_OLDCustomerBuild; VER_l_OLDDevelopmentStage; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_Developer; $_t_FullVersionString; $_t_oldMethodName; $_t_Place; $_t_VersionComment; $_t_VersionString; VER_T_Comment; VER_t_CustomerLicenceVersion; VER_t_DevBuildNoOLD; VER_t_DeveloperName; VER_t_LicVerSection1)
	C_TEXT:C284(VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; VER_t_OLDLicVerSection1; VER_t_OLDLicVerSection2; VER_t_OLDLicVerSection3; VER_t_OLDLicVerSection4; VER_t_STRUCTBUILDREFERENCE; $_t_Developer; $_t_FullVersionString; $_t_oldMethodName)
	C_TEXT:C284($_t_Place; $_t_VersionComment; $_t_VersionString; VER_T_Comment; VER_t_CustomerLicenceVersion; VER_t_DevBuildNoOLD; VER_t_DeveloperName; VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4)
	C_TEXT:C284(VER_t_OLDLicVerSection1; VER_t_OLDLicVerSection2; VER_t_OLDLicVerSection3; VER_t_OLDLicVerSection4; VER_t_STRUCTBUILDREFERENCE)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_ONEXIT")
//BSW 14/08/02 Ver_Exit



If ((Current user:C182="Designer") & (Not:C34(Is compiled mode:C492)))
	//`Get the current values here to test if they change
	VER_t_DevBuildNoOLD:=VER_GetVersion
	//``
	$_l_offset:=0
	If (BLOB size:C605(VER_blb_ResourceBlob)>0)
		$_l_VersionNumber:=BLOB to longint:C551(VER_blb_ResourceBlob; Macintosh byte ordering:K22:2; $_l_offset)
		$_l_VersionNumber:=BLOB to longint:C551(VER_blb_ResourceBlob; Macintosh byte ordering:K22:2; $_l_offset)
		
		
	Else 
		$_l_VersionNumber:=0
	End if 
	LIC_at_ReleaseTypes:=$_l_VersionNumber\4096\2
	If (LIC_at_ReleaseTypes<=0)
		LIC_at_ReleaseTypes:=4
	End if 
	If ($_l_offset<BLOB size:C605(VER_blb_ResourceBlob))
		$_t_Place:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
		
	Else 
		$_t_Place:=""
	End if 
	If ($_l_offset<BLOB size:C605(VER_blb_ResourceBlob))
		$_t_VersionString:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
		$_t_FullVersionString:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
		
		
	Else 
		$_t_VersionString:="11"
		$_t_FullVersionString:="11"
	End if 
	If (BLOB size:C605(VER_blb_ResourceBlob)>$_l_offset)
		$_t_Developer:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
		
		If (BLOB size:C605(VER_blb_ResourceBlob)>$_l_offset)
			$_t_VersionComment:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
			
		Else 
			$_t_VersionComment:=""
		End if 
	Else 
		$_t_VersionComment:=""
		$_t_Developer:=""
	End if 
	VER_T_Comment:=$_t_VersionComment
	//``
	
	Ver_GetVersionBits(0; ->VER_t_OLDLicVerSection1; ->VER_t_OLDLicVerSection2; ->VER_t_OLDLicVerSection3; ->VER_t_OLDLicVerSection4; ->VER_l_OLDDevelopmentStage; ->VER_t_CustomerLicenceVersion)
	VER_l_OLDCustomerBuild:=VER_GetBuildNumber
	
	VER_CENTERWINDOW(440; 370; Plain fixed size window:K34:6; "Version Control")
	
	DIALOG:C40([USER:15]; "SET_VERSION")
	VER_l_CustomerBuild:=VER_l_CustomerBuild+1
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	$_bo_EditMade:=(VER_t_DevBuildNoOLD#VER_t_STRUCTBUILDREFERENCE) | (VER_t_OLDLicVerSection1#VER_t_LicVerSection1) | (VER_t_OLDLicVerSection2#VER_t_LicVerSection2) | (VER_t_OLDLicVerSection3#VER_t_LicVerSection3)
	//$_bo_EditMade:=(VER_t_DevBuildNoOLD#VER_t_StructureBuildReference) | (VER_t_OLDLicVerSection1#VER_t_LicVerSection1) | (VER_t_OLDLicVerSection2#VER_t_LicVerSection2) | (VER_t_OLDLicVerSection3#VER_t_LicVerSection3)
	$_bo_EditMade:=$_bo_EditMade | (VER_l_OLDDevelopmentStage#LIC_at_ReleaseTypes) | (VER_t_DeveloperName#$_t_Developer) | (VER_T_Comment#$_t_VersionComment)
	
	
	If ((bInternalRelease=1) | (bExternalRelease=1) | (bIncrementBuildNo=1) | ($_bo_EditMade))
		
		If (Not:C34(VER_bo_BuildChanged))  //This is the DEVELOPER Build not the customer licence!!
			
			//VER_t_LicVerSection4:=String((Num(VER_t_OLDLicVerSection4)+1);"000")
			//VER_l_CustomerBuild:=VER_l_CustomerBuild+1
		End if 
		
		Case of 
			: (bInternalRelease=1)
				Gen_Confirm("Are you sure you want to release Daybook enterprise as internal version?")
				If (OK=1)
					
					VER_UPDATEVERSION(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; LIC_at_ReleaseTypes; VER_t_CustomerLicenceVersion; 0; VER_l_CustomerBuild; 0; VER_t_DeveloperName; VER_T_Comment)
				End if 
				
			: (bExternalRelease=1)
				Gen_Confirm("Are you sure you want to release Daybook enterprise as external version?")
				If (OK=1)
					
					VER_UPDATEVERSION(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; LIC_at_ReleaseTypes; VER_t_CustomerLicenceVersion; 0; VER_l_CustomerBuild; 0; VER_t_DeveloperName; VER_T_Comment)
					
				End if 
				
			: (bIncrementBuildNo=1)
				VER_UPDATEVERSION(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; LIC_at_ReleaseTypes; VER_t_CustomerLicenceVersion; 0; VER_l_CustomerBuild; 1; VER_t_DeveloperName; VER_T_Comment)
				
				
			: ($_bo_EditMade)
				VER_UPDATEVERSION(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; LIC_at_ReleaseTypes; VER_t_CustomerLicenceVersion; 0; VER_l_CustomerBuild; 0; VER_t_DeveloperName; VER_T_Comment)
				
		End case 
	Else 
		//This will alway update
		VER_UPDATEVERSION(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; LIC_at_ReleaseTypes; VER_t_CustomerLicenceVersion; 0; VER_l_CustomerBuild; 0; VER_t_DeveloperName; VER_T_Comment)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("VER_ONEXIT"; $_t_oldMethodName)
