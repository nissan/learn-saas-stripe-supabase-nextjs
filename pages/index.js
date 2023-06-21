import {supabase} from "@/utils/supabase";

import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

export default function Home(lessons) {
  console.log({lessons});
  return (
    <main
      className={`flex min-h-screen flex-col items-center justify-between p-24 ${inter.className}`}
    >
      <div className="z-10 w-full max-w-5xl items-center justify-between font-mono text-sm lg:flex">
        Working on it...
      </div>
    </main>
  )
}

export const getServerSideProps = async () => {
  const {data: lessons, error} = await supabase.from('lesson').select('*');

    if (error) {
    console.log(error)
    return {
      props: {
        lessons
      }
    }
  }
  return {
    props: {
      lessons
    }
  }
}
