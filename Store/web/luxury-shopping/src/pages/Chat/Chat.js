import React, { useState, useEffect } from "react";
import { FaHeadset, FaImage } from "react-icons/fa";
import { Link } from "react-router-dom";
import { useSelector } from "react-redux";

const Chat = () => {
  const products = useSelector((state) => state.LUXURYReducer.products);
  const [messages, setMessages] = useState([
    { text: "Hello! I'm your AI shopping assistant. How can I help you today?", sender: "ai" }
  ]);
  const [inputValue, setInputValue] = useState("");
  const [selectedProduct, setSelectedProduct] = useState("");
  const [imagePreview, setImagePreview] = useState(null);

  const handleSendMessage = () => {
    if (inputValue.trim() === "" && !imagePreview && !selectedProduct) return;
    
    // Add user message
    const newMessages = [...messages];
    if (inputValue.trim() !== "") {
      newMessages.push({ text: inputValue, sender: "user" });
    }
    if (imagePreview) {
      newMessages.push({ image: imagePreview, sender: "user" });
      setImagePreview(null);
    }
    if (selectedProduct) {
      newMessages.push({ text: `I'm interested in: ${selectedProduct}`, sender: "user" });
      setSelectedProduct("");
    }
    setMessages(newMessages);
    setInputValue("");
    
    // Simulate AI response
    setTimeout(() => {
      setMessages(prev => [...prev, { text: "I'm processing your request. Please wait...", sender: "ai" }]);
    }, 1000);
  };

  return (
    <div className="max-w-container mx-auto px-4 py-8 bg-[var(--bg-primary)] text-[var(--text-primary)] min-h-screen">
      <div className="flex items-center gap-2 mb-6">
        <FaHeadset className="text-2xl" />
        <h1 className="text-2xl font-bold">AI Shopping Assistant</h1>
      </div>
      
      <div className="border rounded-lg p-4 h-[500px] overflow-y-auto mb-4 bg-[var(--bg-secondary)]">
        {messages.map((message, index) => (
          <div 
            key={index} 
            className={`mb-4 ${message.sender === 'user' ? 'text-right' : 'text-left'}`}
          >
            <div 
              className={`inline-block p-3 rounded-lg ${message.sender === 'user' 
                ? 'bg-primeColor text-white' 
                : 'bg-[var(--bg-primary)] border border-[var(--border-primary)]'}`}
            >
              {message.image ? (
                <img src={message.image} alt="Uploaded" className="max-h-40 rounded-lg" />
              ) : (
                message.text
              )}
            </div>
          </div>
        ))}
      </div>
      
      <div className="flex flex-col gap-2">
        <div className="flex gap-2">
          <input
            type="text"
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            onKeyPress={(e) => e.key === 'Enter' && handleSendMessage()}
            className="flex-1 p-3 border rounded-lg focus:outline-none focus:border-primeColor bg-[var(--bg-primary)] border-[var(--border-primary)]"
            placeholder="Type your message here..."
          />
          <button
            onClick={handleSendMessage}
            className="bg-primeColor text-white px-6 py-3 rounded-lg hover:bg-black duration-300"
          >
            Send
          </button>
        </div>
        <div className="flex gap-2">
          <label className="flex items-center gap-2 bg-[var(--bg-secondary)] px-4 py-2 rounded-lg cursor-pointer hover:bg-[var(--bg-primary)] border border-[var(--border-primary)]">
            <FaImage />
            Upload Image
            <input
              type="file"
              accept="image/*"
              className="hidden"
              onChange={(e) => {
                const file = e.target.files[0];
                if (file) {
                  const reader = new FileReader();
                  reader.onloadend = () => {
                    setImagePreview(reader.result);
                  };
                  reader.readAsDataURL(file);
                }
              }}
            />
          </label>
          <div className="flex-1 relative">
            <input
              type="text"
              value={selectedProduct}
              onChange={(e) => {
                setSelectedProduct(e.target.value);
              }}
              className="w-full p-3 border rounded-lg bg-[var(--bg-primary)] border-[var(--border-primary)]"
              placeholder="Search products..."
            />
            {selectedProduct && (
              <div className="absolute z-10 w-full mt-1 bg-[var(--bg-primary)] border border-[var(--border-primary)] rounded-lg shadow-lg max-h-60 overflow-y-auto">
                {products
                  .filter((product) =>
                    product.productName.toLowerCase().includes(selectedProduct.toLowerCase())
                  )
                  .map((product) => (
                    <div
                      key={product._id}
                      className="p-2 hover:bg-[var(--bg-secondary)] cursor-pointer text-[var(--text-primary)]"
                      onClick={() => {
                        setSelectedProduct(product.productName);
                      }}
                    >
                      {product.productName}
                    </div>
                  ))}
              </div>
            )}
          </div>
        </div>
        {imagePreview && (
          <div className="mt-2">
            <img src={imagePreview} alt="Preview" className="max-h-40 rounded-lg" />
          </div>
        )}
      </div>
      
      <div className="mt-6 text-center">
        <Link to="/" className="text-primeColor hover:underline">
          Back to Home
        </Link>
      </div>
    </div>
  );
};

export default Chat;