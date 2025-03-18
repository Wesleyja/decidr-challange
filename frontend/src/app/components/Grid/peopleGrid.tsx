import * as React from 'react';
import Box from '@mui/material/Box';
import { DataGrid, GridColDef, GridColumnGroupingModel, GridToolbarQuickFilter } from '@mui/x-data-grid';
import { useQuery } from '@tanstack/react-query';
import apiRouter from "@/app/api/router"

const columns: GridColDef[] = [
  {
    field: 'firstName',
    headerName: 'First name',
    width: 150,
  },
  {
    field: 'lastName',
    headerName: 'Last name',
    width: 150,
  },
  {
    field: 'gender',
    headerName: 'Gender',
    width: 110,
  },
  {
    field: 'weapon',
    headerName: 'Weapon',
    width: 170,
  },
  {
    field: 'vehicle',
    headerName: 'Vehicle',
    width: 170,
  },
  {
    field: 'affiliations',
    headerName: 'Affiliation',
    width: 170,
    valueGetter: (value: Array<APISchema.Affiliation>) => {
      return value.map(e => e.name).join(", ")
    }
  },
  {
    field: 'locations',
    headerName: 'Location',
    width: 170,
    valueGetter: (value: Array<APISchema.Location>) => {
      return value.map(e => e.name).join(", ")
    }
  }
];


const columnGroupingModel: GridColumnGroupingModel = [
  {
    groupId: 'Basic info',
    children: [
      {
        groupId: 'Full name',
        children: [{ field: 'lastName' }, { field: 'firstName' }],
      },
      { field: 'species' },
      { field: 'gender' }
    ],
  },
];

export default function PeopleGrid() {

  const { data } = useQuery({ queryKey: ['getPeople'], queryFn: apiRouter.people.getPeople })

  return (
    <Box >
      <DataGrid
        rows={data}
        columns={columns}
        columnGroupingModel={columnGroupingModel}
        columnGroupHeaderHeight={36}
        slots={{ toolbar: GridToolbarQuickFilter }}
        initialState={{
          pagination: {
            paginationModel: {
              pageSize: 10,
            },
          },
        }}
      />
    </Box>
  );
}
