import React from "react";
import { AiOutlineCopyright } from "react-icons/ai";

const FooterBottom = () => {
  return (
    <div className="w-full bg-[var(--bg-primary)] group">
      <div className="max-w-container mx-auto border-t-[1px] border-t-[var(--border-primary)] pt-10 pb-20">
        <p className="text-titleFont font-normal text-center flex md:items-center justify-center text-[var(--text-primary)] duration-200 text-sm">
          <span className="text-md mr-[1px] mt-[2px] md:mt-0 text-center hidden md:inline-flex">
            <AiOutlineCopyright />
          </span>
          Copyright 2025 | Luxury Store | All Rights Reserved To HICMIS |
          <a href=" " target="_blank" rel="noreferrer">
            <span className="ml-1 font-medium group-hover:text-primeColor">
              Powered by Group (9-B)
            </span>
          </a>
        </p>
      </div>
    </div>
  );
};

export default FooterBottom;
