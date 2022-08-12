//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetSaleType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_BOOLEAN:C305($_bo_Ask; $3)
	C_LONGINT:C283($_l_ListItemRow; $_l_Return; $_l_TableNumber; $0; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_SalesTypeName; $_t_Type; SP_t_SalesOrderNUM; SP_t_SalesOrderTitle; SP_t_SalesProjectionType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetSaleType")
//get the type from the related record and use that to set the type of the sale
$_l_TableNumber:=$1
$0:=0
If (Count parameters:C259>=2)
	If ($2>0)
		$_l_Return:=0
		Case of 
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				
				
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				
				READ ONLY:C145([JOBS:26])
				If ([JOBS:26]x_ID:49#$2)
					QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=$2)
				End if 
				$_t_Type:=[JOBS:26]Job_Type:21
				
				READ ONLY:C145([JOB_TYPES:65])
				QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1=$_t_Type)
				$_l_Return:=[JOB_TYPES:65]ProjectedSaleTypeID:11
				$_t_SalesTypeName:=[JOB_TYPES:65]Type_Name:2
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				
				READ ONLY:C145([ORDERS:24])
				If ([ORDERS:24]x_ID:58#$2)
					QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=$2)
				End if 
				$_t_Type:=[ORDERS:24]Order_Type:43
				
				READ ONLY:C145([JOB_TYPES:65])
				QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1=$_t_Type)
				$_l_Return:=[JOB_TYPES:65]ProjectedSaleTypeID:11
				$_t_SalesTypeName:=[JOB_TYPES:65]Type_Name:2
				
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				
				READ ONLY:C145([PROJECTS:89])
				If ([PROJECTS:89]X_ID:11#$2)
					QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=$2)
				End if 
				$_t_Type:=[PROJECTS:89]Project_Type:7
				
				READ ONLY:C145([JOB_TYPES:65])
				QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1=$_t_Type)
				$_l_Return:=[JOB_TYPES:65]ProjectedSaleTypeID:11
				$_t_SalesTypeName:=[JOB_TYPES:65]Type_Name:2
				
		End case 
	Else 
		$_t_Type:=""
		$_l_Return:=0
		
	End if 
	If (Count parameters:C259>=3)
		$_bo_Ask:=$3
	Else 
		$_bo_Ask:=True:C214
	End if 
	
	If ($_l_Return=0) & ($_t_Type#"") & ($_bo_Ask)
		//we have a TYPE but we dont have a return value
		$_l_ListItemRow:=AA_ListSelector(->SP_at_SalesProjectionTYPE; "Sale type for "+$_t_SalesTypeName+" is not setup."+" Please select the correct type")
		If ($_l_ListItemRow>0)
			$_l_Return:=SP_al_SalesProjectionTYPEID{$_l_ListItemRow}
			$0:=$_l_Return
		End if 
		
		If ($_l_Return=0)
			//    SET VISIBLE(SP_S55_aSalesProject;True)
			OBJECT SET VISIBLE:C603(SP_al_SalesProjectionTYPEID; True:C214)
			OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; True:C214)
			OBJECT SET VISIBLE:C603(*; "SP_PIC_ProjectionType"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; True:C214)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; False:C215)
			OBJECT SET VISIBLE:C603(*; SP_t_SalesOrderTitle; False:C215)
			If (SP_t_SalesOrderNUM="")
				OBJECT SET ENTERABLE:C238(SP_t_SalesOrderNUM; True:C214)
			End if 
			
		Else 
			//   SET VISIBLE(SP_S55_aSalesProject;False)
			OBJECT SET VISIBLE:C603(SP_al_SalesProjectionTYPEID; False:C215)
			OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
			OBJECT SET VISIBLE:C603(*; "SP_PIC_ProjectionType"; False:C215)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
			If (SP_t_SalesOrderNUM="")
				OBJECT SET ENTERABLE:C238(SP_t_SalesOrderNUM; True:C214)
			End if 
			
			$0:=$_l_Return
		End if 
	Else 
		$0:=$_l_Return
		
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("SP_GetSaleType"; $_t_oldMethodName)