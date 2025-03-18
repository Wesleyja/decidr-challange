'use client'

import PeopleGrid from "@/app/components/Grid/peopleGrid"
import { BottomNavigation, Box, Paper } from "@mui/material";
import MyDropzone from "./components/Dropzone/csvUpload";
import DefaultCsvUpload from "./components/Button/defaultCsvUpload";


export default function Home() {
  return (
    <main className="flex min-h-screen flex-col gap-2 items-center p-6">
      <Box sx={{ pb: 2, justifyItems: 'center', width: '50%'}}>
        <Paper elevation={2} sx={{
          width: '100%',
          border: '1px dashed #666',
          borderRadius: 2
        }}>
          <MyDropzone />
        </Paper>
      </Box>
      <Box sx={{ pb: 2, justifyContent: 'center'}}>
      < PeopleGrid />
        <Paper sx={{ position: 'fixed', bottom: 0, left: 0, right: 0 }} elevation={3}>
          <BottomNavigation>
            <DefaultCsvUpload />
          </BottomNavigation>
        </Paper>
      </Box>
    </main>
  );
}