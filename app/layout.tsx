import type {Metadata,Viewport} from 'next';
import './globals.css';
export const metadata:Metadata={title:'BGI Lost & Found — Find your way back',description:'A little campus kindness goes a long way. Report, discover and recover lost belongings across BGI Bhopal.',manifest:'/manifest.webmanifest',appleWebApp:{capable:true,statusBarStyle:'default',title:'BGI Found'},icons:{icon:'/app-icon-v3-192.png',apple:'/app-icon-v3-180.png'}};
export const viewport:Viewport={width:'device-width',initialScale:1,viewportFit:'cover',themeColor:'#145a9b'};
export default function Layout({children}:{children:React.ReactNode}){return <html lang="en"><body>{children}</body></html>}
