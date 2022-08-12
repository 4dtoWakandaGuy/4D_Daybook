If (False:C215)
	//Table Form Method Name: [USER]DaskSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_abo_ColumnEnterable;0)
	//ARRAY BOOLEAN(GEN_lb_LBprod;0)
	//ARRAY LONGINT(GEN_AL_ColumnWIdth;0)
	//ARRAY POINTER(GEN_aptr_ColumnArrays;0)
	//ARRAY TEXT(GEN_at_ColumnHeader;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_SetTotalWIdth; $_l_SizeofArray; $_l_WindowHeight; $i; GEN_l_BUT1; GEN_l_But2; GEN_l_BUT3; GEN_l_BUT4; GEN_l_BUT5; GEN_l_BUT6)
	C_LONGINT:C283(GEN_l_BUT7; GEN_l_BUT8; GEN_l_BUT9)
	C_POINTER:C301($_ptr_FirstColumn)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; GEN_t_COL1; GEN_t_COL2; GEN_t_COL3; GEN_t_COL4; GEN_t_COL5; GEN_t_COL6; GEN_t_COL7)
	C_TEXT:C284(GEN_t_COL8; GEN_t_COL9; GEN_t_HED1; GEN_t_HED2; GEN_t_HED3; GEN_t_HED4; GEN_t_HED5; GEN_t_HED6; GEN_t_HED7; GEN_t_HED8; GEN_t_HED9)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].DaskSelect"; Form event code:C388)
//B73
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		$_l_SetTotalWIdth:=0
		For ($I; 1; Size of array:C274(GEN_aptr_ColumnArrays))
			LB_SetupListbox(->GEN_lb_LBprod; "GEN_t"; "GEN_L"; $i; GEN_aptr_ColumnArrays{$i})
			//GEN_aptr_ColumnArrays{2};GEN_aptr_ColumnArrays{3})
			LB_SetColumnHeaders(->GEN_lb_LBprod; "GEN_L"; $i; GEN_at_ColumnHeader{$i})
			//GEN_at_ColumnHeader{2};GEN_at_ColumnHeader{3})
			LB_SetColumnWidths(->GEN_lb_LBprod; "GEN_t"; $i; GEN_AL_ColumnWIdth{$i})
			//;GEN_AL_ColumnWIdth{2};GEN_AL_ColumnWIdth{3})
			$_l_SetTotalWIdth:=$_l_SetTotalWIdth+GEN_AL_ColumnWIdth{$i}
		End for 
		If (False:C215)
			Case of 
				: (Size of array:C274(GEN_aptr_ColumnArrays)=3)
					LB_SetupListbox(->GEN_lb_LBprod; "GEN_t"; "GEN_L"; 1; GEN_aptr_ColumnArrays{1}; GEN_aptr_ColumnArrays{2}; GEN_aptr_ColumnArrays{3})
					LB_SetColumnHeaders(->GEN_lb_LBprod; "GEN_L"; 1; GEN_at_ColumnHeader{1}; GEN_at_ColumnHeader{2}; GEN_at_ColumnHeader{3})
					LB_SetColumnWidths(->GEN_lb_LBprod; "GEN_t"; 1; GEN_AL_ColumnWIdth{1}; GEN_AL_ColumnWIdth{2}; GEN_AL_ColumnWIdth{3})
					//ADD OTHER OPTIONS
				: (Size of array:C274(GEN_aptr_ColumnArrays)=7)
					LB_SetupListbox(->GEN_lb_LBprod; "GEN_t"; "GEN_L"; 1; GEN_aptr_ColumnArrays{1}; GEN_aptr_ColumnArrays{2}; GEN_aptr_ColumnArrays{3})
					LB_SetColumnHeaders(->GEN_lb_LBprod; "GEN_L"; 1; GEN_at_ColumnHeader{1}; GEN_at_ColumnHeader{2}; GEN_at_ColumnHeader{3})
					LB_SetColumnWidths(->GEN_lb_LBprod; "GEN_t"; 1; GEN_AL_ColumnWIdth{1}; GEN_AL_ColumnWIdth{2}; GEN_AL_ColumnWIdth{3})
					
			End case 
		End if 
		LB_SetEnterable(->GEN_lb_LBprod; False:C215; 0)
		For ($i; 1; Size of array:C274(GEN_abo_ColumnEnterable))
			If (GEN_abo_ColumnEnterable{$I})
				LB_SetEnterable(->GEN_lb_LBprod; True:C214; $i)
			End if 
		End for 
		LB_SetScroll(->GEN_lb_LBprod; -3; -2)
		
		LB_StyleSettings(->GEN_lb_LBprod; "Black"; 9; "GEN_t"; ->[ACCOUNTS:32])
		LB_SetFormat(->GEN_lb_LBprod; 2; ""; 4; 4; 2)
		$_ptr_FirstColumn:=GEN_aptr_ColumnArrays{1}
		$_l_SizeofArray:=Size of array:C274($_ptr_FirstColumn->)
		$_l_WindowHeight:=22+($_l_SizeofArray*16)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		WS_AutoscreenSize(2; $_l_WindowHeight; $_l_SetTotalWIdth+60)
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(Current process)
	: ($_l_event=On Activate:K2:9)
		
		In_ButtdCall(->[USER:15])
		
End case 
ERR_MethodTrackerReturn("FM [USER].DaskSelect"; $_t_oldMethodName)
